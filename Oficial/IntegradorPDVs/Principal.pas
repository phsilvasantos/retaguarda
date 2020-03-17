unit Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RXShell, ACBrBase, ACBrFala, dxGDIPlusClasses, ExtCtrls, Menus,
  DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, ZConnection, IniFiles,
  TFlatPanelUnit, StdCtrls, ZAbstractConnection, jpeg, ZStoredProcedure;

type
  TFormPrincipal = class(TForm)
    Timer: TTimer;
    TrayIcon: TRxTrayIcon;
    MenuTryIcon: TPopupMenu;
    N1: TMenuItem;
    ButtonClose: TMenuItem;
    ZdbServidor: TZConnection;
    ZconsultaServidor: TZQuery;
    ZinsereServidor: TZQuery;
    ZapagaServidor: TZQuery;
    ZdbPDV: TZConnection;
    ZConsultaPDV: TZQuery;
    ZupdatePDV: TZQuery;
    MnImportarTabelasConfiguracao: TMenuItem;
    lbStatus: TLabel;
    shpStatusServidor: TShape;
    lbTerminal: TLabel;
    lbEnvio: TLabel;
    lbRecebimento: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lbBancoLocal: TLabel;
    lbBancoServidor: TLabel;
    shpStatusLocal: TShape;
    mnImportaProdutosManualmente: TMenuItem;
    ZInsereEstoqueServidor: TZQuery;
    ZConsultaTabelaServidor: TZQuery;
    ImportarNCMs1: TMenuItem;
    Panel1: TPanel;
    Image2: TImage;
    ZapagaPDV: TZQuery;
    ZConsultaTabelaPDV: TZQuery;
    ZupdateServidor: TZQuery;
    zAtualizaContaCorrente: TZQuery;
    zOperacaoBanco: TZQuery;
    zConfigFinanceiro: TZQuery;
    ZSPSERVIDOR: TZStoredProc;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnImportaProdutosManualmenteClick(Sender: TObject);
    procedure MnImportarTabelasConfiguracaoClick(Sender: TObject);
    procedure ImportarNCMs1Click(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizaSaldoContaCorrente(ContaCorrente : Integer; ValorDebito,ValorCredito : Double);
    function Conecta: boolean;
    function Disconecta: boolean;
    function ApagaRegistrosExcluidosNoServidor: boolean;
    function ImportaServidorTabelaProduto: boolean;
    function ExportaMovimentosPDV: boolean;
    function TrocaVirgulaPorPonto(Numero: string): string;
    function  ConvFloatToStr(Numero : Double) : string ;
  public
    { Public declarations }
    TerminalCodigoSTR: string;
    TempoCiclo : Integer;
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

uses TelaAutenticaUsuario;

{$R *.dfm}

procedure TFormPrincipal.FormCreate(Sender: TObject);
var Inifile: TInifile;
begin
  top := Screen.Height - Height - 50;
  left := Screen.Width - Width;
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Parceiro.ini');
  ZdbPDV.Database := IniFile.ReadString('PDV', 'Database_PDV', '');
  TerminalCodigoSTR := IniFile.ReadString('SERVIDOR', 'Terminal', '');
  ZdbServidor.HostName := IniFile.ReadString('SERVIDOR', 'HostName', '');
  ZdbServidor.Database := IniFile.ReadString('SERVIDOR', 'Database', '');
  TempoCiclo := Inifile.ReadInteger('CICLO','TempoCiclo',0);
  IniFile.Free;
  // FormPrincipal.Hide;                                                   -
  if TempoCiclo = 0 then
    TempoCiclo := 10000;
  Timer.Interval := TempoCiclo;
  lbterminal.Caption := lbterminal.Caption + TerminalCodigoSTR;
  lbBancoLocal.caption := ZdbPDV.Database;
  lbBancoServidor.caption := ZdbServidor.HostName + ' ' + ZdbServidor.Database;
end;

procedure TFormPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
var Password: string;
begin
  Application.CreateForm(TFormTelaAutenticaUsuario, FormTelaAutenticaUsuario);
  FormTelaAutenticaUsuario.ShowModal;
  if (FormTelaAutenticaUsuario.ModalResult = MrCancel) then
  begin
    FormTelaAutenticaUsuario.Close;
    FormTelaAutenticaUsuario.Free;
    Action := caNone;
    exit;
  end;
  if (FormTelaAutenticaUsuario.ModalResult = MrOK) and (FormTelaAutenticaUsuario.EditSenha.Text <> '') then
  begin
    Password := FormTelaAutenticaUsuario.EditSenha.Text;
    if (Password = 'Easy2015') or (Password = 'EASY2015') or (Password = 'easy2015') then
    begin
      FormTelaAutenticaUsuario.Close;
      FormTelaAutenticaUsuario.Free;
      ZdbPDV.Disconnect;
      ZdbServidor.Disconnect;
      action := cafree;
      Application.Terminate;
    end
    else
    begin
      FormTelaAutenticaUsuario.Close;
      FormTelaAutenticaUsuario.Free;
      Action := caNone;
    end;
  end;

end;

procedure TFormPrincipal.TimerTimer(Sender: TObject);
var i: integer;
begin
  TrayIcon.Animated := True;
  timer.Enabled := False;

  {Tenta Conectar ao Servidor}
  if Conecta then
  begin

      {Tenta Apagar, Importar Produtos do Servidor e Exportar Vendas do PDV}
    try ApagaRegistrosExcluidosNoServidor; except Application.ProcessMessages; end;
    try ImportaServidorTabelaProduto; except Application.ProcessMessages; end;
    try ExportaMovimentosPDV; except Application.ProcessMessages; end;

      {Derruba Conexao}
    Disconecta;
  end;

  Application.Title := 'Aguardando Proximo Ciclo';
  lbStatus.Caption := 'Aguardando Proximo Ciclo';
  lbStatus.Update;
  Application.ProcessMessages;
  TrayIcon.Animated := False;
  timer.Enabled := True;
end;

function TFormPrincipal.Conecta: boolean;
var CaminhoNomeArquivo: string;
  Arquivo: TextFile;
begin
  ZdbPDV.Connected := False;
  try
    Application.Title := 'Conectando no Banco Local...';
    lbStatus.Caption := 'Conectando no Banco Local...';
    lbStatus.Update;
    ZdbPDV.Connected := True;
    Application.ProcessMessages;
    result := true;
    shpStatusLocal.Brush.Color := clLime;
  except
    Application.Title := 'Falha de Conexao Banco Local...';
    lbStatus.Caption := 'Falha de Conexao Banco Local...';
    lbStatus.Update;
    zdbPDV.Disconnect;
    Application.ProcessMessages;
    result := false;
    shpStatusLocal.Brush.Color := clRed;
  end;

  ZdbServidor.Connected := False;
  try
    Application.Title := 'Conectando no Banco Servidor...';
    lbStatus.Caption := 'Conectando no Banco Servidor...';
    lbStatus.Update;
    ZdbServidor.Connected := True;
    Application.ProcessMessages;
    result := true;
    shpStatusServidor.Brush.Color := clLime;
  except
    Application.Title := 'Falha de Conexao Banco Servidor...';
    lbStatus.Caption := 'Falha de Conexao Banco Servidor...';
    lbStatus.Update;
    ZdbServidor.Disconnect;
    Application.ProcessMessages;
    result := false;
    shpStatusServidor.Brush.Color := clRed;
  end;

  if result then
  begin
    AssignFile(Arquivo, ExtractFilePath(Application.ExeName) + 'Online.txt');
    Rewrite(Arquivo);
    Reset(Arquivo);
    Append(Arquivo);
    CloseFile(Arquivo);
  end
  else
  begin
    try
      DeleteFile('Online.txt');
    except
      Application.ProcessMessages;
    end;
  end;
end;

function TFormPrincipal.Disconecta: boolean;
begin
  try
    Application.Title := 'Disconectando do Servidor...';
    lbStatus.Caption := 'Disconectando do Servidor...';
    lbStatus.Update;

    zdbPDV.Disconnect;
    ZdbServidor.Disconnect;
    Application.ProcessMessages;
  except
    Application.ProcessMessages;
  end;
end;

function TFormPrincipal.ImportaServidorTabelaProduto: boolean;
var i: integer;
var SalvarRegistro, erro: boolean;
begin
  {Abre Usuario no servidor para achar os registros que serao importados!}
  try
    ZconsultaServidor.Close;
    ZconsultaServidor.sql.clear;
    ZconsultaServidor.sql.Text := 'Select * from USUARIO';
    ZconsultaServidor.open;
    if not ZconsultaServidor.IsEmpty then
    begin
      while not ZconsultaServidor.eof do
      begin
        Application.Title := 'Importando Usuarios...';
        lbStatus.Caption := Application.Title;
        lbStatus.Update;
        ZConsultaPDV.close;
        ZConsultaPDV.SQL.clear;
        ZConsultaPDV.SQL.Text := 'Select * from USUARIO where USUAICOD=' + ZconsultaServidor.fieldbyname('USUAICOD').AsString;
            //ZConsultaPDV.RequestLive := True;
        ZConsultaPDV.Open;
        SalvarRegistro := False;
        if ZConsultaPDV.IsEmpty then
        begin
          SalvarRegistro := True;
          ZConsultaPDV.append;
        end
        else
        begin
          if (ZconsultaServidor.findfield('REGISTRO').Value > ZconsultaPDV.findfield('REGISTRO').Value) then
          begin
            SalvarRegistro := True;
            ZConsultaPDV.edit;
          end
          else
            SalvarRegistro := False;
        end;

        if SalvarRegistro then
        begin
                {alimenta os campos no Pdv}
          for i := 0 to ZconsultaServidor.FieldCount - 1 do
          begin
            try ZConsultaPDV.FindField(ZConsultaServidor.Fields[i].FieldName).AsVariant := ZconsultaServidor.Fields[i].AsVariant; except Application.ProcessMessages; end;
          end;
          try
            ZConsultaPDV.Post;
          except
            ZConsultaPDV.Cancel;
            Application.ProcessMessages;
          end;
        end;
        ZconsultaServidor.Next;
      end;
    end;
    Application.Title := '';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
  except
    Application.Title := 'Falha ao Importar Usuarios!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;                                     
    Application.ProcessMessages;
  end;
  {Fim usuario}

  {Abre ClientePDVs no servidor para achar os registros que serao importados!}
  try
    Application.Title := 'Verificando Altera��es em Clientes.';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    ZconsultaServidor.Close;
    ZconsultaServidor.sql.clear;
    ZconsultaServidor.sql.Text := 'Select * from ClientePDVs where TERMICOD=' + TerminalCodigoSTR + ' Order by TERMICOD asc';
    //ZconsultaServidor.RequestLive := False;
    ZconsultaServidor.open;
    if not ZconsultaServidor.IsEmpty then
    begin
      while not ZconsultaServidor.eof do
      begin
        Application.Title := 'Recebendo Cliente => ' + ZconsultaServidor.fieldbyname('CLIEA13ID').AsString;
        lbStatus.Caption := Application.Title;
        lbStatus.Update;
        ZConsultaPDV.close;
        ZConsultaPDV.SQL.clear;
        ZConsultaPDV.SQL.Text := 'Select * from CLIENTE where CLIEA13ID=''' + ZconsultaServidor.fieldbyname('CLIEA13ID').AsString + '''';
            //ZConsultaPDV.RequestLive := True;
        ZConsultaPDV.Open;
        if ZConsultaPDV.IsEmpty then
          ZConsultaPDV.append
        else
          ZConsultaPDV.edit;

            {acha o cliente atual no servidor e pega os dados dele}
        ZConsultaTabelaServidor.close;
        ZConsultaTabelaServidor.sql.text := 'select * from cliente where CLIEA13ID=''' + ZconsultaServidor.fieldbyname('CLIEA13ID').AsString + '''';
        ZConsultaTabelaServidor.open;
            {alimenta os campos no Pdv}
        for i := 0 to ZConsultaTabelaServidor.FieldCount - 1 do
        begin
          try ZConsultaPDV.FindField(ZConsultaTabelaServidor.Fields[i].FieldName).AsVariant := ZConsultaTabelaServidor.Fields[i].AsVariant; except Application.ProcessMessages; end;
        end;
        try
          ZConsultaPDV.post;
          Erro := False;
        except
          ZConsultaPDV.cancel;
          Erro := True;
          Application.ProcessMessages;
        end;

        //importa pre�o cliente produto
        Application.Title := 'Recebendo Cliente/Produto => ' + ZconsultaServidor.fieldbyname('CLIEA13ID').AsString;
        lbStatus.Caption := Application.Title;
        lbStatus.Update;

            {acha o cliente atual no servidor e pega os dados dele}
        ZConsultaTabelaServidor.close;
        ZConsultaTabelaServidor.sql.text := 'select * from CLIENTEPRODUTOPRECO where CLIEA13ID = ' + QuotedStr(ZconsultaServidor.fieldbyname('CLIEA13ID').AsString) + ' AND PENDENTE = ' + QuotedStr('S');
        ZConsultaTabelaServidor.open;
        while not ZConsultaTabelaServidor.Eof do
        begin
          ZConsultaPDV.close;
          ZConsultaPDV.SQL.clear;
          ZConsultaPDV.SQL.Text := 'Select * from CLIENTEPRODUTOPRECO where CLIEA13ID = ' + QuotedStr(ZconsultaServidor.fieldbyname('CLIEA13ID').AsString) + ' AND PRODICOD = ' + ZConsultaTabelaServidor.FieldByName('PRODICOD').AsString;
          ZConsultaPDV.Open;
          if ZConsultaPDV.IsEmpty then
            ZConsultaPDV.append
          else
            ZConsultaPDV.edit;
            {alimenta os campos no Pdv}
          for i := 0 to ZConsultaTabelaServidor.FieldCount - 1 do
          begin
            try ZConsultaPDV.FindField(ZConsultaTabelaServidor.Fields[i].FieldName).AsVariant := ZConsultaTabelaServidor.Fields[i].AsVariant; except Application.ProcessMessages; end;
          end;
          try
            ZConsultaPDV.post;
            Erro := False;
          except
            ZConsultaPDV.cancel;
            Erro := True;
            Application.ProcessMessages;
          end;
          ZConsultaTabelaServidor.Next;
        end;

        if not erro then
        begin
                {atualiza o pendente na tabela CLIENTEPRODUTOPRECO}
          ZupdateServidor.Close;
          ZupdateServidor.SQL.clear;
          ZupdateServidor.SQL.Text := 'Update CLIENTEPRODUTOPRECO Set PENDENTE = ' + QuotedStr('N') + ' where CLIEA13ID = ' + QuotedStr(ZconsultaServidor.fieldbyname('CLIEA13ID').Value);
          ZupdateServidor.ExecSQL;

                {apaga no servidor se nao teve erro}
          zapagaServidor.close;
          zapagaServidor.sql.Clear;
          zapagaServidor.sql.Text := 'delete from clientepdvs where termicod=' + TerminalCodigoSTR +
            ' and cliea13id=''' + ZconsultaServidor.fieldbyname('cliea13id').AsString + '''';
          zapagaServidor.ExecSQL;
        end;
        ZconsultaServidor.Next;
      end;
    end;
    Application.Title := '';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
  except
    Application.Title := 'Falha ao Importar Clientes!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim Cliente}

  {Abre vendedor do servidor}
  try
    ZconsultaServidor.Close;
    ZconsultaServidor.sql.clear;
    ZconsultaServidor.sql.Text := 'Select * from VENDEDOR where DATA_IMPORTADO <> ''' + FormatDateTime('mm/dd/yyyy', now) + ''' or DATA_IMPORTADO IS NULL';
    ZconsultaServidor.open;
    if not ZconsultaServidor.IsEmpty then
    begin
      while not ZconsultaServidor.eof do
      begin
        Application.Title := 'Recebendo Vendedor => ' + ZconsultaServidor.fieldbyname('VENDA60NOME').AsString;
        lbStatus.Caption := Application.Title;
        lbStatus.Update;
        ZConsultaPDV.close;
        ZConsultaPDV.SQL.clear;
        ZConsultaPDV.SQL.Text := 'Select * from VENDEDOR where VENDICOD=' + QuotedStr(ZconsultaServidor.fieldbyname('VENDICOD').AsString);
        ZConsultaPDV.Open;
        if ZConsultaPDV.IsEmpty then
          ZConsultaPDV.append
        else
          ZConsultaPDV.edit;

            {acha o Vendedor atual no servidor e pega os dados dele}
        ZConsultaTabelaServidor.close;
        ZConsultaTabelaServidor.sql.text := 'select * from VENDEDOR where VENDICOD=' + QuotedStr(ZconsultaServidor.fieldbyname('VENDICOD').AsString);
        ZConsultaTabelaServidor.open;

            {alimenta os campos no Pdv}
        for i := 0 to ZConsultaTabelaServidor.FieldCount - 1 do
        begin
          try
            ZConsultaPDV.FindField(ZConsultaTabelaServidor.Fields[i].FieldName).AsVariant := ZConsultaTabelaServidor.Fields[i].AsVariant;
          except on E : Exception do
              ShowMessage('Erro Vendedor: ' + e.Message);
//            Application.ProcessMessages;
          end;
        end;
        try
          ZConsultaPDV.post;
          Erro := False;
        except  on E : Exception do
           ShowMessage('Erro vendedor1: ' + e.Message);
//          ZConsultaPDV.cancel;
//          Erro := True;
//          Application.ProcessMessages;
        end;
        ZconsultaServidor.Next;
      end;
    end;

    if not erro then
    begin
      ZconsultaServidor.First;
      while not ZconsultaServidor.Eof do
      begin
        ZupdateServidor.Close;
        ZupdateServidor.SQL.clear;
        ZupdateServidor.SQL.Text := 'Update VENDEDOR Set DATA_IMPORTADO = ''' + FormatDateTime('mm/dd/yyyy', now) + ''' where VENDICOD = ' + QuotedStr(ZconsultaServidor.fieldbyname('VENDICOD').Value);
        ZupdateServidor.ExecSQL;
        ZconsultaServidor.Next;
      end;
    end;
    Application.Title := '';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
  except
    Application.Title := 'Falha ao Importar Vendedor!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim Vendedor}

  {Abre UNIDADE no servidor para achar os registros que serao importados!}
  try
    ZconsultaServidor.Close;
    ZconsultaServidor.sql.clear;
    ZconsultaServidor.sql.Text := 'Select * from UNIDADE';
    ZconsultaServidor.open;
    if not ZconsultaServidor.IsEmpty then
    begin
      while not ZconsultaServidor.eof do
      begin
        ZConsultaPDV.close;
        Application.Title := 'Importando Unidades...';
        lbStatus.Caption := Application.Title;
        lbStatus.Update;
        ZConsultaPDV.SQL.clear;
        ZConsultaPDV.SQL.Text := 'Select * from UNIDADE where UNIDICOD=' + ZconsultaServidor.fieldbyname('UNIDICOD').AsString;
            //ZConsultaPDV.RequestLive := True;
        ZConsultaPDV.Open;
        SalvarRegistro := False;
        if ZConsultaPDV.IsEmpty then
        begin
          SalvarRegistro := True;
          ZConsultaPDV.append;
        end
        else
        begin
          if (ZconsultaServidor.findfield('REGISTRO').Value > ZconsultaPDV.findfield('REGISTRO').Value) then
          begin
            SalvarRegistro := True;
            ZConsultaPDV.edit;
          end
          else
            SalvarRegistro := False;
        end;

        if SalvarRegistro then
        begin
                {alimenta os campos no Pdv}
          for i := 0 to ZconsultaServidor.FieldCount - 1 do
            if ZconsultaServidor.Fields[i].AsString <> '' then
            begin
              try ZConsultaPDV.FindField(ZConsultaServidor.Fields[i].FieldName).AsVariant := ZconsultaServidor.Fields[i].AsVariant; except Application.ProcessMessages; end;
            end;
          try
            ZConsultaPDV.post;
          except
            ZConsultaPDV.cancel;
            Application.ProcessMessages;
          end;
        end;
        ZconsultaServidor.Next;
      end;
    end;
    Application.Title := '';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
  except
    Application.Title := 'Falha ao Importar Unidades!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim UNIDADE}


  {Abre NCM do servidor}
  try
    ZconsultaServidor.Close;
    ZconsultaServidor.sql.clear;
    ZconsultaServidor.sql.Text := 'Select * from NCM where COALESCE(PENDENTE,'+ QuotedStr('S') + ') = ' + QuotedStr('S') + ' order by NCMICOD asc ';
    ZconsultaServidor.open;
    if not ZconsultaServidor.IsEmpty then
    begin
      while not ZconsultaServidor.eof do
      begin
        Application.Title := 'Recebendo NCM => ' + ZconsultaServidor.fieldbyname('NCMA30CODIGO').AsString;
        lbStatus.Caption := Application.Title;
        lbStatus.Update;
        ZConsultaPDV.close;
        ZConsultaPDV.SQL.clear;
        ZConsultaPDV.SQL.Text := 'Select * from NCM where NCMA30CODIGO=' + QuotedStr(ZconsultaServidor.fieldbyname('NCMA30CODIGO').AsString);
        ZConsultaPDV.Open;
        if ZConsultaPDV.IsEmpty then
          ZConsultaPDV.append
        else
          ZConsultaPDV.edit;

            {acha o NCM atual no servidor e pega os dados dele}
        ZConsultaTabelaServidor.close;
        ZConsultaTabelaServidor.sql.text := 'select * from NCM where NCMA30CODIGO=' + QuotedStr(ZconsultaServidor.fieldbyname('NCMA30CODIGO').AsString);
        ZConsultaTabelaServidor.open;

            {alimenta os campos no Pdv}
        for i := 0 to ZConsultaTabelaServidor.FieldCount - 1 do
        begin
          try
            ZConsultaPDV.FindField(ZConsultaTabelaServidor.Fields[i].FieldName).AsVariant := ZConsultaTabelaServidor.Fields[i].AsVariant;
          except on E : Exception do
              ShowMessage('Erro NCM: ' + e.Message);
//            Application.ProcessMessages;
          end;
        end;
        try
          ZConsultaPDV.post;
          Erro := False;
        except  on E : Exception do
           ShowMessage('Erro NCM1: ' + e.Message);
//          ZConsultaPDV.cancel;
//          Erro := True;
//          Application.ProcessMessages;
        end;
        ZconsultaServidor.Next;
      end;
    end;

    if not erro then
    begin
      ZconsultaServidor.First;
      while not ZconsultaServidor.Eof do
      begin
        ZupdateServidor.Close;
        ZupdateServidor.SQL.clear;
        ZupdateServidor.SQL.Text := 'Update NCM Set PENDENTE = ' + QuotedStr('N') + ' where NCMICOD = ' + QuotedStr(ZconsultaServidor.fieldbyname('NCMICOD').Value);
        ZupdateServidor.ExecSQL;
        ZconsultaServidor.Next;
      end;
    end;
    Application.Title := '';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
  except
    Application.Title := 'Falha ao Importar NCM!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim NCM}


  {Abre ProdutoPDVs no servidor para achar os registros que serao importados!}
  try
    ZconsultaServidor.Close;
    ZconsultaServidor.sql.clear;
    ZconsultaServidor.sql.Text := 'Select * from PRODUTOPDVs where TERMICOD=' + TerminalCodigoSTR + ' order by prodicod asc ';
    //ZconsultaServidor.RequestLive := False;
    ZconsultaServidor.open;
    if not ZconsultaServidor.IsEmpty then
    begin
      while not ZconsultaServidor.eof do
      begin
        Application.Title := 'Recebendo Produto => ' + ZconsultaServidor.fieldbyname('PRODICOD').AsString;
        lbStatus.Caption := Application.Title;
        lbStatus.Update;
        ZConsultaPDV.close;
        ZConsultaPDV.SQL.clear;
        ZConsultaPDV.SQL.Text := 'Select * from PRODUTO where PRODICOD=' + ZconsultaServidor.fieldbyname('PRODICOD').AsString;
            //ZConsultaPDV.RequestLive := True;
        ZConsultaPDV.Open;
        if ZConsultaPDV.IsEmpty then
          ZConsultaPDV.append
        else
          ZConsultaPDV.edit;

            {acha o produto atual no servidor e pega os dados dele}
        ZConsultaTabelaServidor.close;
        ZConsultaTabelaServidor.sql.text := 'select * from produto where PRODICOD=' + ZconsultaServidor.fieldbyname('PRODICOD').AsString;
        ZConsultaTabelaServidor.open;

            {alimenta os campos no Pdv}
        for i := 0 to ZConsultaTabelaServidor.FieldCount - 1 do
        begin
          try
            ZConsultaPDV.FindField(ZConsultaTabelaServidor.Fields[i].FieldName).AsVariant := ZConsultaTabelaServidor.Fields[i].AsVariant;
          except
            on e : Exception do
            begin
              Application.ProcessMessages;
            end;
          end;
        end;
        try
          ZConsultaPDV.post;
          Erro := False;
        except
          on e : Exception do
          begin
            Application.ProcessMessages;
            ZConsultaPDV.cancel;
            Erro := True;
            Application.ProcessMessages;
          end;

        end;

        if not erro then
        begin
                {apaga no servidor se nao teve erro}
          zApagaServidor.close;
          zApagaServidor.sql.Clear;
          zApagaServidor.sql.Text := 'delete from produtopdvs where termicod=' + TerminalCodigoSTR +
            ' and prodicod=' + ZconsultaServidor.fieldbyname('PRODICOD').AsString;
          zApagaServidor.ExecSQL;
        end;

        ZconsultaServidor.Next;
      end;
    end;
    Application.Title := '';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
  except
    Application.Title := 'Falha ao Importar Produtos!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim produtos}

  {Inicio Barras}
  {Abre ProdutoPDVs no servidor para achar os registros que serao importados!}
  try
    ZconsultaServidor.Close;
    ZconsultaServidor.sql.clear;
    ZconsultaServidor.sql.Text := 'Select * from PRODUTOBARRASPDVs where TERMICOD=' + TerminalCodigoSTR + ' order by prodicod asc';
    //ZconsultaServidor.RequestLive := false;
    ZconsultaServidor.open;
    while not ZconsultaServidor.eof do
    begin
      Application.Title := 'Recebendo Produto/Barras => ' + ZconsultaServidor.fieldbyname('PRODICOD').AsString;
      lbStatus.Caption := Application.Title;
      lbStatus.Update;
      ZConsultaPDV.close;
      ZConsultaPDV.SQL.clear;
      ZConsultaPDV.SQL.Text := 'Select * from PRODUTOBARRAS where PRODICOD=' + ZconsultaServidor.fieldbyname('PRODICOD').AsString + ' and PRBAA15BARRAS=''' + ZconsultaServidor.fieldbyname('PRBAA15BARRAS').AsString + '''';
        //ZConsultaPDV.RequestLive := True;
      ZConsultaPDV.Open;
      if ZConsultaPDV.IsEmpty then
        ZConsultaPDV.append
      else
        ZConsultaPDV.edit;

        {alimenta os campos no Pdv}
      for i := 0 to ZconsultaServidor.FieldCount - 1 do
      begin
        try ZConsultaPDV.FindField(ZConsultaServidor.Fields[i].FieldName).AsVariant := ZconsultaServidor.Fields[i].AsVariant; except Application.ProcessMessages; end;
      end;
      try
        ZConsultaPDV.post;
        Erro := False;
      except
        ZConsultaPDV.cancel;
        Erro := True;
        Application.ProcessMessages;
      end;

      if not erro then
      begin
            {apaga no servidor se nao teve erro}
        zapagaServidor.close;
        zapagaServidor.sql.Clear;
        zapagaServidor.sql.Text := 'delete from PRODUTOBARRASPDVs where termicod=' + TerminalCodigoSTR +
          ' and prodicod=' + ZconsultaServidor.fieldbyname('PRODICOD').AsString;
        zapagaServidor.ExecSQL;
      end;
      ZconsultaServidor.Next;
    end;
    Application.Title := '';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
  except
    Application.Title := 'Falha ao Importar Cd.Barras!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim Barras}

  {Inicio Produto Desconto}
  {Exclui registros apagados do servidor!}
  try
    ZconsultaServidor.Close;
    ZconsultaServidor.sql.clear;
    ZconsultaServidor.sql.Text := 'Select * from PRODUTO_DESCONTOSPDV where TERMICOD=' + TerminalCodigoSTR + ' AND EXCLUIR = ' + QuotedStr('S')  + ' order by prodicod asc';
    //ZconsultaServidor.RequestLive := false;
    ZconsultaServidor.open;
    while not ZconsultaServidor.eof do
    begin
      Application.Title := 'Excluindo Produto/Desconto => ' + ZconsultaServidor.fieldbyname('PRODICOD').AsString;
      lbStatus.Caption := Application.Title;
      lbStatus.Update;

      ZapagaPDV.close;
      ZapagaPDV.sql.Clear;
      ZapagaPDV.sql.Text := 'delete from PRODUTO_DESCONTOS where COD_PRODUTODESCONTOS=' + ZconsultaServidor.fieldbyname('COD_PRODUTODESCONTOS').AsString;
      ZapagaPDV.ExecSQL;
      ZconsultaServidor.Next;
    end;

  {Inicio Produto Desconto}
  {Abre Produto_DescontosPDV no servidor para achar os registros que serao importados!}
    ZconsultaServidor.Close;
    ZconsultaServidor.sql.clear;
    ZconsultaServidor.sql.Text := 'Select * from PRODUTO_DESCONTOSPDV where TERMICOD=' + TerminalCodigoSTR + ' AND EXCLUIR = ' + QuotedStr('N')  + ' order by prodicod asc';
    //ZconsultaServidor.RequestLive := false;
    ZconsultaServidor.open;
    while not ZconsultaServidor.eof do
    begin
      Application.Title := 'Recebendo Produto/Desconto => ' + ZconsultaServidor.fieldbyname('PRODICOD').AsString;
      lbStatus.Caption := Application.Title;
      lbStatus.Update;
      ZConsultaPDV.close;
      ZConsultaPDV.SQL.clear;
      ZConsultaPDV.SQL.Text := 'Select * from PRODUTO_DESCONTOS where COD_PRODUTODESCONTOS=' + ZconsultaServidor.fieldbyname('COD_PRODUTODESCONTOS').AsString;
        //ZConsultaPDV.RequestLive := True;
      ZConsultaPDV.Open;
      if ZConsultaPDV.IsEmpty then
        ZConsultaPDV.append
      else
        ZConsultaPDV.edit;

        {alimenta os campos no Pdv}
      for i := 0 to ZconsultaServidor.FieldCount - 1 do
      begin
        try ZConsultaPDV.FindField(ZConsultaServidor.Fields[i].FieldName).AsVariant := ZconsultaServidor.Fields[i].AsVariant; except Application.ProcessMessages; end;
      end;
      try
        ZConsultaPDV.post;
        Erro := False;
      except
        ZConsultaPDV.cancel;
        Erro := True;
        Application.ProcessMessages;
      end;

      if not erro then
      begin
            {apaga no servidor se nao teve erro}
        zapagaServidor.close;
        zapagaServidor.sql.Clear;
        zapagaServidor.sql.Text := 'delete from PRODUTO_DESCONTOSPDV where termicod=' + TerminalCodigoSTR +
          ' and COD_PRODUTODESCONTOS=' + ZconsultaServidor.fieldbyname('COD_PRODUTODESCONTOS').AsString;
        zapagaServidor.ExecSQL;
      end;
      ZconsultaServidor.Next;
    end;
    Application.Title := '';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
  except
    Application.Title := 'Falha ao Importar Produto Desconto!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim Produto_Desconto}

  {Inicio TabelaPrecos}
  {Abre TABELAPRECOPRODUTOPDVS no servidor para achar os registros que serao importados!}
  try
    ZconsultaServidor.Close;
    ZconsultaServidor.sql.clear;
    ZconsultaServidor.sql.Text := 'Select * from TABELAPRECOPRODUTOPDVS where TERMICOD=' + TerminalCodigoSTR + ' order by PRODICOD asc';
    //ZconsultaServidor.RequestLive := false;
    ZconsultaServidor.open;
    while not ZconsultaServidor.eof do
    begin
      Application.Title := 'Recebendo Pre�os Direfentes por Filial => ' + ZconsultaServidor.fieldbyname('PRODICOD').AsString;
      lbStatus.Caption := Application.Title;
      lbStatus.Update;
      ZConsultaPDV.close;
      ZConsultaPDV.SQL.clear;
      ZConsultaPDV.SQL.Text := 'Select * from TABELAPRECOPRODUTO where PRODICOD=' + ZconsultaServidor.fieldbyname('PRODICOD').AsString + ' and TPRCICOD=' + ZconsultaServidor.fieldbyname('TPRCICOD').AsString;
        //ZConsultaPDV.RequestLive := True;
      ZConsultaPDV.Open;
      if ZConsultaPDV.IsEmpty then
        ZConsultaPDV.append
      else
        ZConsultaPDV.edit;

        {carrega tabela preco do servidor}
      ZConsultaTabelaServidor.Close;
      ZConsultaTabelaServidor.sql.text := 'select * from TABELAPRECOPRODUTO where PRODICOD=' + ZconsultaServidor.fieldbyname('PRODICOD').AsString + ' and TPRCICOD=' + ZconsultaServidor.fieldbyname('TPRCICOD').AsString;
      ZConsultaTabelaServidor.open;

        {alimenta os campos no Pdv}
      for i := 0 to ZConsultaTabelaServidor.FieldCount - 1 do
      begin
        try ZConsultaPDV.FindField(ZConsultaTabelaServidor.Fields[i].FieldName).AsVariant := ZConsultaTabelaServidor.Fields[i].AsVariant; except Application.ProcessMessages; end;
      end;
      try
        ZConsultaPDV.post;
        Erro := False;
      except
        ZConsultaPDV.cancel;
        Erro := True;
        Application.ProcessMessages;
      end;

      if not erro then
      begin
            {apaga no servidor se nao teve erro}
        zapagaServidor.close;
        zapagaServidor.sql.Clear;
        zapagaServidor.sql.Text := 'delete from TABELAPRECOPRODUTOPDVs where TERMICOD=' + TerminalCodigoSTR +
          ' and PRODICOD=' + ZconsultaServidor.fieldbyname('PRODICOD').AsString +
          ' and TPRCICOD=' + ZconsultaServidor.fieldbyname('TPRCICOD').AsString;
        zapagaServidor.ExecSQL;
      end;
      ZconsultaServidor.Next;
    end;
    Application.Title := '';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
  except
    Application.Title := 'Falha ao Importar Cd.Barras!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim TabelaPreco}

  {Abre Marcas no servidor para achar os registros que serao importados!}
  try
    ZconsultaServidor.Close;
    ZconsultaServidor.sql.clear;
    ZconsultaServidor.sql.Text := 'Select * from marca order by marcicod asc';
    //ZconsultaServidor.RequestLive := False;
    ZconsultaServidor.open;
    if not ZconsultaServidor.IsEmpty then
    begin
      while not ZconsultaServidor.eof do
      begin
        Application.Title := 'Verificando Marca => ' + ZconsultaServidor.fieldbyname('marcicod').AsString;
        lbStatus.Caption := Application.Title;
        lbStatus.Update;
        ZConsultaPDV.close;
        ZConsultaPDV.SQL.clear;
        ZConsultaPDV.SQL.Text := 'Select * from marca where marcicod=' + ZconsultaServidor.fieldbyname('marcicod').AsString;
            //ZConsultaPDV.RequestLive := True;
        ZConsultaPDV.Open;
        if ZConsultaPDV.IsEmpty then
        begin
          Application.Title := 'Incluindo Marca => ' + ZconsultaServidor.fieldbyname('marcicod').AsString;
          lbStatus.Caption := Application.Title;
          ZConsultaPDV.append;
                {alimenta os campos no Pdv}
          ZConsultaPDV.fieldbyname('marcicod').AsString := ZconsultaServidor.fieldbyname('marcicod').AsString;
          ZConsultaPDV.fieldbyname('MARCA60DESCR').AsString := ZconsultaServidor.fieldbyname('MARCA60DESCR').AsString;
          try
            ZConsultaPDV.post;
          except
            ZConsultaPDV.cancel;
          end;
        end
        else
        begin
          if ZConsultaPDV.fieldbyname('MARCA60DESCR').AsString <> ZconsultaServidor.fieldbyname('MARCA60DESCR').AsString then
          begin
            Application.Title := 'Alterando Marca => ' + ZconsultaServidor.fieldbyname('marcicod').AsString;
            lbStatus.Caption := Application.Title;
            ZConsultaPDV.edit;
            ZConsultaPDV.fieldbyname('MARCA60DESCR').AsString := ZconsultaServidor.fieldbyname('MARCA60DESCR').AsString;
            try
              ZConsultaPDV.post;
            except
              ZConsultaPDV.cancel;
            end;
          end;
        end;

        ZconsultaServidor.Next;
      end;
    end;
    Application.Title := '';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
  except
    Application.Title := 'Falha ao Importar Marcas!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim marca}

  {Abre Grupos no servidor para achar os registros que serao importados!}
  try
    ZconsultaServidor.Close;
    ZconsultaServidor.sql.clear;
    ZconsultaServidor.sql.Text := 'Select * from grupo order by GRUPICOD asc';
    //ZconsultaServidor.RequestLive := False;
    ZconsultaServidor.open;
    if not ZconsultaServidor.IsEmpty then
    begin
      while not ZconsultaServidor.eof do
      begin
        Application.Title := 'Verificando Grupo => ' + ZconsultaServidor.fieldbyname('GRUPICOD').AsString;
        lbStatus.Caption := Application.Title;
        lbStatus.Update;
        ZConsultaPDV.close;
        ZConsultaPDV.SQL.clear;
        ZConsultaPDV.SQL.Text := 'Select * from GRUPO where GRUPICOD=' + ZconsultaServidor.fieldbyname('GRUPICOD').AsString;
            //ZConsultaPDV.RequestLive := True;
        ZConsultaPDV.Open;
        if ZConsultaPDV.IsEmpty then
        begin
          Application.Title := 'Incluindo Grupo => ' + ZconsultaServidor.fieldbyname('GRUPICOD').AsString;
          lbStatus.Caption := Application.Title;
          ZConsultaPDV.append;
                {alimenta os campos no Pdv}
          ZConsultaPDV.fieldbyname('GRUPICOD').AsString := ZconsultaServidor.fieldbyname('GRUPICOD').AsString;
          ZConsultaPDV.fieldbyname('GRUPA60DESCR').AsString := ZconsultaServidor.fieldbyname('GRUPA60DESCR').AsString;
          try
            ZConsultaPDV.post;
          except
            ZConsultaPDV.cancel;
          end;
        end
        else
        begin
          if ZConsultaPDV.fieldbyname('GRUPA60DESCR').AsString <> ZconsultaServidor.fieldbyname('GRUPA60DESCR').AsString then
          begin
            Application.Title := 'Alterando Grupo => ' + ZconsultaServidor.fieldbyname('GRUPICOD').AsString;
            lbStatus.Caption := Application.Title;
            ZConsultaPDV.edit;
            ZConsultaPDV.fieldbyname('GRUPA60DESCR').AsString := ZconsultaServidor.fieldbyname('GRUPA60DESCR').AsString;
            try
              ZConsultaPDV.post;
            except
              ZConsultaPDV.cancel;
            end;
          end;
        end;

        ZconsultaServidor.Next;
      end;
    end;
    Application.Title := '';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
  except
    Application.Title := 'Falha ao Importar Grupos!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim grupo}

  {Abre COREs no servidor para achar os registros que serao importados!}
  try
    ZconsultaServidor.Close;
    ZconsultaServidor.sql.clear;
    ZconsultaServidor.sql.Text := 'Select * from COR order by CORICOD asc';
    //ZconsultaServidor.RequestLive := False;
    ZconsultaServidor.open;
    if not ZconsultaServidor.IsEmpty then
    begin
      while not ZconsultaServidor.eof do
      begin
        Application.Title := 'Verificando Cor => ' + ZconsultaServidor.fieldbyname('CORICOD').AsString;
        lbStatus.Caption := Application.Title;
        lbStatus.Update;
        ZConsultaPDV.close;
        ZConsultaPDV.SQL.clear;
        ZConsultaPDV.SQL.Text := 'Select * from COR where CORICOD=' + ZconsultaServidor.fieldbyname('CORICOD').AsString;
            //ZConsultaPDV.RequestLive := True;
        ZConsultaPDV.Open;
        if ZConsultaPDV.IsEmpty then
        begin
          Application.Title := 'Incluindo Cor => ' + ZconsultaServidor.fieldbyname('CORICOD').AsString;
          lbStatus.Caption := Application.Title;
          ZConsultaPDV.append;
                {alimenta os campos no Pdv}
          ZConsultaPDV.fieldbyname('CORICOD').AsString := ZconsultaServidor.fieldbyname('CORICOD').AsString;
          ZConsultaPDV.fieldbyname('CORA30DESCR').AsString := ZconsultaServidor.fieldbyname('CORA30DESCR').AsString;
          try
            ZConsultaPDV.post;
          except
            ZConsultaPDV.cancel;
          end;
        end
        else
        begin
          if ZConsultaPDV.fieldbyname('CORA30DESCR').AsString <> ZconsultaServidor.fieldbyname('CORA30DESCR').AsString then
          begin
            Application.Title := 'Alterando Cor => ' + ZconsultaServidor.fieldbyname('CORICOD').AsString;
            lbStatus.Caption := Application.Title;
            ZConsultaPDV.edit;
            ZConsultaPDV.fieldbyname('CORA30DESCR').AsString := ZconsultaServidor.fieldbyname('CORA30DESCR').AsString;
            try
              ZConsultaPDV.post;
            except
              ZConsultaPDV.cancel;
            end;
          end;
        end;

        ZconsultaServidor.Next;
      end;
    end;
    Application.Title := '';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
  except
    Application.Title := 'Falha ao Importar Cores!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim cores}

  {Abre Grades no servidor para achar os registros que serao importados!}
  try
    ZconsultaServidor.Close;
    ZconsultaServidor.sql.clear;
    ZconsultaServidor.sql.Text := 'Select * from grade order by GRADICOD asc';
    //ZconsultaServidor.RequestLive := False;
    ZconsultaServidor.open;
    if not ZconsultaServidor.IsEmpty then
    begin
      while not ZconsultaServidor.eof do
      begin
        Application.Title := 'Verificando Grade => ' + ZconsultaServidor.fieldbyname('GRADICOD').AsString;
        lbStatus.Caption := Application.Title;
        lbStatus.Update;
        ZConsultaPDV.close;
        ZConsultaPDV.SQL.clear;
        ZConsultaPDV.SQL.Text := 'Select * from GRADE where GRADICOD=' + ZconsultaServidor.fieldbyname('GRADICOD').AsString;
            //ZConsultaPDV.RequestLive := True;
        ZConsultaPDV.Open;
        if ZConsultaPDV.IsEmpty then
        begin
          Application.Title := 'Incluindo Grade => ' + ZconsultaServidor.fieldbyname('GRADICOD').AsString;
          lbStatus.Caption := Application.Title;
          ZConsultaPDV.append;
                {alimenta os campos no Pdv}
          ZConsultaPDV.fieldbyname('GRADICOD').AsString := ZconsultaServidor.fieldbyname('GRADICOD').AsString;
          ZConsultaPDV.fieldbyname('GRADA30DESCR').AsString := ZconsultaServidor.fieldbyname('GRADA30DESCR').AsString;
          try
            ZConsultaPDV.post;
          except
            ZConsultaPDV.cancel;
          end;
        end
        else
        begin
          if ZConsultaPDV.fieldbyname('GRADA30DESCR').AsString <> ZconsultaServidor.fieldbyname('GRADA30DESCR').AsString then
          begin
            Application.Title := 'Alterando Grade => ' + ZconsultaServidor.fieldbyname('GRADICOD').AsString;
            lbStatus.Caption := Application.Title;
            ZConsultaPDV.edit;
            ZConsultaPDV.fieldbyname('GRADA30DESCR').AsString := ZconsultaServidor.fieldbyname('GRADA30DESCR').AsString;
            try
              ZConsultaPDV.post;
            except
              ZConsultaPDV.cancel;
            end;
          end;
        end;

        ZconsultaServidor.Next;
      end;
    end;
    Application.Title := '';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
  except
    Application.Title := 'Falha ao Importar Grades!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim grades}

  {Abre tamanhos no servidor para achar os registros que serao importados!}
  try
    ZconsultaServidor.Close;
    ZconsultaServidor.sql.clear;
    ZconsultaServidor.sql.Text := 'Select * from GRADETAMANHO order by GRADICOD, GRTMICOD asc';
    //ZconsultaServidor.RequestLive := False;
    ZconsultaServidor.open;
    if not ZconsultaServidor.IsEmpty then
    begin
      while not ZconsultaServidor.eof do
      begin
        Application.Title := 'Verificando Grade-Tamanho => ' + ZconsultaServidor.fieldbyname('GRADICOD').AsString + '-' + ZconsultaServidor.fieldbyname('GRTMICOD').AsString;
        lbStatus.Caption := Application.Title;
        lbStatus.Update;
        ZConsultaPDV.close;
        ZConsultaPDV.SQL.clear;
        ZConsultaPDV.SQL.Text := 'Select * from GRADETAMANHO where GRADICOD=' + ZconsultaServidor.fieldbyname('GRADICOD').AsString + ' and GRTMICOD=' + ZconsultaServidor.fieldbyname('GRTMICOD').AsString;
            //ZConsultaPDV.RequestLive := True;
        ZConsultaPDV.Open;
        if ZConsultaPDV.IsEmpty then
        begin
          Application.Title := 'Incluindo Grade-Tamanho => ' + ZconsultaServidor.fieldbyname('GRADICOD').AsString + '-' + ZconsultaServidor.fieldbyname('GRTMICOD').AsString;
          lbStatus.Caption := Application.Title;
          ZConsultaPDV.append;
                {alimenta os campos no Pdv}
          ZConsultaPDV.fieldbyname('GRADICOD').AsString := ZconsultaServidor.fieldbyname('GRADICOD').AsString;
          ZConsultaPDV.fieldbyname('GRTMICOD').AsString := ZconsultaServidor.fieldbyname('GRTMICOD').AsString;
          ZConsultaPDV.fieldbyname('GRTMA5DESCR').AsString := ZconsultaServidor.fieldbyname('GRTMA5DESCR').AsString;
          try
            ZConsultaPDV.post;
          except
            ZConsultaPDV.cancel;
          end;
        end
        else
        begin
          if ZConsultaPDV.fieldbyname('GRTMA5DESCR').AsString <> ZconsultaServidor.fieldbyname('GRTMA5DESCR').AsString then
          begin
            Application.Title := 'Alterando Grade-Tamanho => ' + ZconsultaServidor.fieldbyname('GRADICOD').AsString + '-' + ZconsultaServidor.fieldbyname('GRTMICOD').AsString;
            lbStatus.Caption := Application.Title;
            ZConsultaPDV.edit;
            ZConsultaPDV.fieldbyname('GRTMA5DESCR').AsString := ZconsultaServidor.fieldbyname('GRTMA5DESCR').AsString;
            try
              ZConsultaPDV.post;
            except
              ZConsultaPDV.cancel;
            end;
          end;
        end;

        ZconsultaServidor.Next;
      end;
    end;
    Application.Title := '';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
  except
    Application.Title := 'Falha ao Importar Grades / Tamanhos!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim gradesTamanho}

  try
    {Abre sql no servidor e tenta achar o TERMINAL se achou altera se nao insere!}
    ZinsereServidor.Close;
    ZinsereServidor.sql.clear;
    ZinsereServidor.sql.Text := 'update Terminal set  DATAULTRECTO =''' + FormatDateTime('mm/dd/yyyy hh:mm:nn', now) + ''' where TERMICOD = ' + TerminalCodigoSTR;
    ZinsereServidor.ExecSQL;
    lbRecebimento.Caption := FormatDateTime('dd/mm/yy hh:mm', now);
    lbRecebimento.Update;
    Application.ProcessMessages;
  except
    Application.Title := 'Falha ao Atualizar Data Recebimento Logs!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    Application.ProcessMessages;
  end;

  ZConsultaPDV.close;
  ZconsultaServidor.Close;
end;

function TFormPrincipal.ExportaMovimentosPDV: boolean;
var erro, gravou: boolean;
var i, ContaCorrente: integer;
var xEmpresa, xProduto, xProxCod, xData, xTotalDia, xCancelado: string;
var ValorMov, QtdeTroca : Double;
begin
  ValorMov := 0;
  ContaCorrente := 0;
  {Abre ClientePDVs no PDV para achar os registros que serao importados!}
  try
    Application.Title := 'Verificando Altera��es em Clientes.';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    ZConsultaPDV.Close;
    ZConsultaPDV.sql.clear;
    ZConsultaPDV.sql.Text := 'Select * from ClientePDVs where TERMICOD=' + TerminalCodigoSTR + ' Order by TERMICOD asc';
    //ZconsultaServidor.RequestLive := False;
    ZConsultaPDV.open;
    if not ZConsultaPDV.IsEmpty then
    begin
      while not ZConsultaPDV.eof do
      begin
        Application.Title := 'Recebendo Cliente => ' + ZConsultaPDV.fieldbyname('CLIEA13ID').AsString;
        lbStatus.Caption := Application.Title;
        lbStatus.Update;
        ZconsultaServidor.close;
        ZconsultaServidor.SQL.clear;
        ZconsultaServidor.SQL.Text := 'Select * from CLIENTE where CLIEA13ID=''' + ZConsultaPDV.fieldbyname('CLIEA13ID').AsString + '''';
        ZconsultaServidor.Open;
        if ZconsultaServidor.IsEmpty then
          ZconsultaServidor.append
        else
          ZconsultaServidor.edit;

            {acha o cliente atual no PDV e pega os dados dele}
        ZConsultaTabelaPDV.close;
        ZConsultaTabelaPDV.sql.text := 'select * from cliente where CLIEA13ID=''' + ZConsultaPDV.fieldbyname('CLIEA13ID').AsString + '''';
        ZConsultaTabelaPDV.open;

            {alimenta os campos no Pdv}
        for i := 0 to ZConsultaTabelaPDV.FieldCount - 1 do
        begin
          try ZconsultaServidor.FindField(ZConsultaTabelaPDV.Fields[i].FieldName).AsVariant := ZConsultaTabelaPDV.Fields[i].AsVariant; except Application.ProcessMessages; end;
        end;
        try
          ZconsultaServidor.post;
          Erro := False;
        except
          ZconsultaServidor.cancel;
          Erro := True;
          Application.ProcessMessages;
        end;

        if not erro then
        begin
                {apaga no servidor se nao teve erro}
          ZapagaPDV.close;
          ZapagaPDV.sql.Clear;
          ZapagaPDV.sql.Text := 'delete from clientepdvs where termicod=' + TerminalCodigoSTR +
            ' and cliea13id=''' + ZConsultaPDV.fieldbyname('cliea13id').AsString + '''';
          ZapagaPDV.ExecSQL;
        end;
        ZConsultaPDV.Next;
      end;
    end;
    Application.Title := '';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
  except
    Application.Title := 'Falha ao Importar Clientes!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim Cliente}

  {Cupom}
  try
    ZConsultaPDV.close;
    ZConsultaPDV.SQL.clear;
    ZConsultaPDV.SQL.Text := 'Select * from Cupom where PENDENTE = ''S'' ';
    ZConsultaPDV.Open;
    if not ZConsultaPDV.IsEmpty then
    begin
      while not ZConsultaPDV.eof do
      begin
        Application.Title := 'Exportando Venda => ' + ZConsultaPDV.fieldbyname('CUPOA13ID').Value;
        lbStatus.Caption := Application.Title;
        lbStatus.Update;
        Application.ProcessMessages;

        {Abre sql no servidor e tenta achar o registro se achou altera se nao insere!}
        erro := false;
        ZinsereServidor.Close;
        ZinsereServidor.sql.clear;
        ZinsereServidor.sql.Text := 'Select * from Cupom where CUPOA13ID = ''' + ZConsultaPDV.fieldbyname('CUPOA13ID').Value + '''';
        ZinsereServidor.open;
        if ZinsereServidor.IsEmpty then
          ZinsereServidor.append
        else
          ZinsereServidor.edit;
            {alimenta os campos no servidor}
        for i := 0 to ZConsultaPDV.FieldCount - 1 do
          if ZConsultaPDV.Fields[i].AsString <> '' then
          begin
            try ZinsereServidor.FieldByName(ZConsultaPDV.Fields[i].FieldName).AsVariant := ZConsultaPDV.Fields[i].AsVariant; except Application.ProcessMessages; end;
          end;
        try
          erro := false;
          ZinsereServidor.post;
        except
          erro := true;
          ZinsereServidor.cancel;
          Application.ProcessMessages;
        end;

            {troca coluna PENDENTE PARA NAO, Para nao ser mais exportado ao servidor}
        if not erro then
        begin
          ZupdatePDV.Close;
          ZupdatePDV.sql.clear;
          ZupdatePDV.sql.Text := 'Update Cupom Set PENDENTE=''N'' where CUPOA13ID=''' + ZConsultaPDV.fieldbyname('CUPOA13ID').Value + '''';
          ZupdatePDV.ExecSQL;
        end;

        ZConsultaPDV.next;
      end;
    end;
  except
    Application.Title := 'Falha ao Exportar Cupons!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim Cupom}

  {CupomItem}
  try
    ZConsultaPDV.close;
    ZConsultaPDV.SQL.clear;
    ZConsultaPDV.SQL.Text := 'Select * from CupomItem where PENDENTE = ''S'' ';
    ZConsultaPDV.Open;
    if not ZConsultaPDV.IsEmpty then
    begin
      while not ZConsultaPDV.eof do
      begin
        Application.Title := 'Exportando Venda/Item => ' + ZConsultaPDV.fieldbyname('CUPOA13ID').Value + '/' + ZConsultaPDV.fieldbyname('CPITIPOS').AsString;
        lbStatus.Caption := Application.Title;
        lbStatus.Update;
        Application.ProcessMessages;
            {Abre sql no servidor e tenta achar o registro se achou altera se nao insere!}
        erro := false;
        ZinsereServidor.Close;
        ZinsereServidor.sql.clear;
        ZinsereServidor.sql.Text := 'Select * from CupomItem where CUPOA13ID=''' + ZConsultaPDV.fieldbyname('CUPOA13ID').Value + ''' and CPITIPOS = ' + ZConsultaPDV.fieldbyname('CPITIPOS').AsString;
        ZinsereServidor.open;
        if ZinsereServidor.IsEmpty then
          ZinsereServidor.append
        else
          ZinsereServidor.edit;
            {alimenta os campos no servidor}
        for i := 0 to ZConsultaPDV.FieldCount - 1 do
          if ZConsultaPDV.Fields[i].AsString <> '' then
          begin
            try ZinsereServidor.FieldByName(ZConsultaPDV.Fields[i].FieldName).AsVariant := ZConsultaPDV.Fields[i].AsVariant; except Application.ProcessMessages; end;
          end;
        try
          erro := false;
          ZinsereServidor.post;
        except
          erro := true;
          ZinsereServidor.cancel;
          Application.ProcessMessages;
        end;

            {troca coluna PENDENTE PARA NAO, Para nao ser mais exportado ao servidor}
        if not erro then
        begin
          ZupdatePDV.Close;
          ZupdatePDV.sql.clear;
          ZupdatePDV.sql.ADD('Update CupomItem Set PENDENTE=''N'' where CUPOA13ID=''' + ZConsultaPDV.fieldbyname('CUPOA13ID').Value + '''');
          ZupdatePDV.sql.ADD(' and CPITIPOS = ' + ZConsultaPDV.fieldbyname('CPITIPOS').AsString);
          ZupdatePDV.ExecSQL;
        end;

            {Inserir Movimento Item no Estoque}
        if not erro then
        begin
          Application.Title := 'Movimentando Estoque Cupom/Item => ' + ZConsultaPDV.fieldbyname('CUPOA13ID').Value + '/' + ZConsultaPDV.fieldbyname('CPITIPOS').AsString;
          lbStatus.Caption := Application.Title;
          lbStatus.Update;

          xEmpresa := ZConsultaPDV.fieldbyname('EMPRICOD').AsString;
          xCancelado := ZConsultaPDV.fieldbyname('CPITCSTATUS').AsString;
          QtdeTroca := 0;
          if ZConsultaPDV.FieldByName('CPITN3QTDTROCA').AsFloat > 0 then
             QtdeTroca := ZConsultaPDV.FieldByName('CPITN3QTDTROCA').AsFloat;
          xProduto := ZConsultaPDV.fieldbyname('PRODICOD').AsString;
          xData := FormatDateTime('mm/dd/yyyy', ZConsultaPDV.fieldbyname('registro').Value);
                {tenta criar o registro zerado na tabela produtosaldo, caso nao tenha ainda para aquela empresa}
          ZInsereEstoqueServidor.close;
          ZInsereEstoqueServidor.sql.Text := 'Insert Into PRODUTOSALDO (EMPRICOD,PRODICOD,PSLDN3QTDE,PSLDN3QTDMIN,PSLDN3QTDMAX) values (' + xEmpresa + ',' + xProduto + ',0,0,0)';
          try
            ZInsereEstoqueServidor.ExecSQL;
            Application.ProcessMessages;
          except
            Application.ProcessMessages;
          end;
                //PEGAR PROXIMO CODIGO MOVIMENTO DE ESTOQUE

          ZSPSERVIDOR.ParamByName('ID_EMPRESA').AsInteger := StrToInt(xEmpresa);
          ZSPSERVIDOR.ParamByName('ID_PRODUTO').AsInteger := StrToInt(xProduto);
          ZSPSERVIDOR.ParamByName('DATA_MOVIMENTO').AsDate := StrToDate(FormatDateTime('mm/dd/yyyy', ZConsultaPDV.fieldbyname('registro').Value));

          ZSPSERVIDOR.ParamByName('ID_OPERACAO').AsInteger := 14;
          if QtdeTroca > 0 then
          begin
            ZSPSERVIDOR.ParamByName('QTDE_ENTRADA').AsFloat := StrToFloatDef(TrocaVirgulaPorPonto(FloatToStr(QtdeTroca)),0); //QUANT TROCA
            ZSPSERVIDOR.ParamByName('QTDE_SAIDA').AsFloat := 0;
          end
          else
          begin
            ZSPSERVIDOR.ParamByName('QTDE_ENTRADA').AsFloat := 0; //QUANT TROCA
            ZSPSERVIDOR.ParamByName('QTDE_SAIDA').AsFloat := StrToFloatDef(TrocaVirgulaPorPonto(ZinsereServidor.FieldByName('CPITN3QTD').AsString),0);
          end;
          ZSPSERVIDOR.ParamByName('ID_CUPOM').AsString := ZinsereServidor.FieldByName('CUPOA13ID').AsString;
          ZSPSERVIDOR.ParamByName('ESTOQUE_OK').AsString := 'N';
          ZSPSERVIDOR.ParamByName('PENDENTE').AsString := 'S';
          ZSPSERVIDOR.ParamByName('DATA_REGISTRO').AsDateTime := StrToDateTime(FormatDateTime('mm/dd/yyyy hh:mm:ss', ZinsereServidor.FieldByName('REGISTRO').value));

          gravou := False;
          try
            repeat
              try
                ZdbServidor.StartTransaction;
                ZSPSERVIDOR.ExecSQL;
                gravou := True;
              except
                ZdbServidor.Rollback;
  //                Application.ProcessMessages;
              end;
            until gravou;
          finally
            ZdbServidor.Commit;
          end;
//          ZconsultaServidor.Close;
//          ZconsultaServidor.sql.text := 'select Max(MVESICOD) as CONTADOR from MOVIMENTOESTOQUE where EMPRICOD = ' + xEmpresa + ' and MVESDMOV = ''' +
//            xData + '''';
//          ZconsultaServidor.Open;
//          if (ZconsultaServidor.FieldByName('CONTADOR').AsFloat <= 0) or not (ZconsultaServidor.FieldByName('CONTADOR').IsNull) then
//            xProxCod := intToStr(ZconsultaServidor.FieldByName('CONTADOR').AsInteger + 1)
//          else
//            xProxCod := '1';
//
//          ZInsereEstoqueServidor.close;
//          ZInsereEstoqueServidor.sql.Clear;
//          ZInsereEstoqueServidor.SQL.Add('Insert Into MOVIMENTOESTOQUE');
//          ZInsereEstoqueServidor.SQL.Add('(EMPRICOD, ');
//          ZInsereEstoqueServidor.SQL.Add('MVESDMOV, ');
//          ZInsereEstoqueServidor.SQL.Add('MVESICOD, ');
//          ZInsereEstoqueServidor.SQL.Add('PRODICOD, ');
//          ZInsereEstoqueServidor.SQL.Add('OPESICOD, ');
//          if QtdeTroca > 0 then
//            ZInsereEstoqueServidor.SQL.Add('MVESN3QTDENTRADA, ')
//          else
//          if xCancelado <> 'C' then
//            ZInsereEstoqueServidor.SQL.Add('MVESN3QTDSAIDA, ')
//          else
//            ZInsereEstoqueServidor.SQL.Add('MVESN3QTDENTRADA, ');
//          ZInsereEstoqueServidor.SQL.Add('CUPOA13ID, ');
//          ZInsereEstoqueServidor.SQL.Add('MVESCESTOQUEOK, ');
//          ZInsereEstoqueServidor.SQL.Add('PENDENTE, ');
//          ZInsereEstoqueServidor.SQL.Add('REGISTRO) ');
//          ZInsereEstoqueServidor.SQL.Add('values(');
//
//          ZInsereEstoqueServidor.SQL.Add(xEmpresa + ', '); //EMPRICOD
//          ZInsereEstoqueServidor.SQL.Add('''' + xData + ''', '); //MVESDMOV
//          ZInsereEstoqueServidor.SQL.Add(xProxCod + ', '); //MVESICOD
//          ZInsereEstoqueServidor.SQL.Add(xProduto + ', '); //PRODICOD
//          ZInsereEstoqueServidor.SQL.Add('''14'', '); //OPESICOD 14= venda cupom
//          if QtdeTroca > 0 then
//            ZInsereEstoqueServidor.SQL.Add(TrocaVirgulaPorPonto(FloatToStr(QtdeTroca)) + ', ') //QUANT TROCA
//          else
//            ZInsereEstoqueServidor.SQL.Add(TrocaVirgulaPorPonto(ZinsereServidor.FieldByName('CPITN3QTD').AsString) + ', '); //QUANT VENDA
//          ZInsereEstoqueServidor.SQL.Add('''' + ZinsereServidor.FieldByName('CUPOA13ID').AsString + ''', '); //CUPOA13ID
//          ZInsereEstoqueServidor.SQL.Add('''N'', '); //MVESCESTOQUEOK
//          ZInsereEstoqueServidor.SQL.Add('''S'', '); //PENDENTE
//          ZInsereEstoqueServidor.SQL.Add('''' + FormatDateTime('mm/dd/yyyy hh:mm:ss', ZinsereServidor.FieldByName('REGISTRO').value) + ''')'); //REGISTRO
          try
//            ZInsereEstoqueServidor.ExecSQL;

            Application.ProcessMessages;
          except
            Application.ProcessMessages;
          end;
        end;

            {pula para proximo produto vendido}
        ZConsultaPDV.next;
      end;
    end;
  except
    Application.Title := 'Falha ao Exportar Cupons Itens!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim Cupomitem}

  {CupomNumerario}
  try
    ZConsultaPDV.close;
    ZConsultaPDV.SQL.clear;
    ZConsultaPDV.SQL.Text := 'Select * from CupomNumerario where PENDENTE = ''S'' ';
    ZConsultaPDV.Open;
    if not ZConsultaPDV.IsEmpty then
    begin
      while not ZConsultaPDV.eof do
      begin
        Application.Title := 'Exportando Venda/Numerario => ' + ZConsultaPDV.fieldbyname('CUPOA13ID').Value + '/' + ZConsultaPDV.fieldbyname('NUMEICOD').AsString;
        lbStatus.Caption := Application.Title;
        lbStatus.Update;
        Application.ProcessMessages;
            {Abre sql no servidor e tenta achar o registro se achou altera se nao insere!}
        erro := false;
        ZinsereServidor.Close;
        ZinsereServidor.sql.clear;
        ZinsereServidor.sql.Text := 'Select * from CupomNumerario where CUPOA13ID=''' + ZConsultaPDV.fieldbyname('CUPOA13ID').Value + ''' and NUMEICOD = ' + ZConsultaPDV.fieldbyname('NUMEICOD').AsString;
        ZinsereServidor.open;
        if ZinsereServidor.IsEmpty then
          ZinsereServidor.append
        else
          ZinsereServidor.edit;
            {alimenta os campos no servidor}
        for i := 0 to ZConsultaPDV.FieldCount - 1 do
          if ZConsultaPDV.Fields[i].AsString <> '' then
          begin
            try ZinsereServidor.FieldByName(ZConsultaPDV.Fields[i].FieldName).AsVariant := ZConsultaPDV.Fields[i].AsVariant; except Application.ProcessMessages; end;
          end;
        try
          erro := false;
          ZinsereServidor.post;
        except
          erro := true;
          ZinsereServidor.cancel;
          Application.ProcessMessages;
        end;

            {troca coluna PENDENTE PARA NAO, Para nao ser mais exportado ao servidor}
        if not erro then
        begin
          ZupdatePDV.Close;
          ZupdatePDV.sql.clear;
          ZupdatePDV.sql.ADD('Update CupomNumerario Set PENDENTE=''N'' where CUPOA13ID=''' + ZConsultaPDV.fieldbyname('CUPOA13ID').Value + '''');
          ZupdatePDV.sql.ADD(' and NUMEICOD = ' + ZConsultaPDV.fieldbyname('NUMEICOD').AsString);
          ZupdatePDV.ExecSQL;
        end;

        ZConsultaPDV.next;
      end;
    end;
  except
    Application.Title := 'Falha ao Exportar Cupons Numerarios!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim CupomNumerario}

  {ContasReceber}
  try
    ZConsultaPDV.close;
    ZConsultaPDV.SQL.clear;
    ZConsultaPDV.SQL.Text := 'Select * from ContasReceber where PENDENTE = ''S'' ';
    ZConsultaPDV.Open;
    if not ZConsultaPDV.IsEmpty then
    begin
      while not ZConsultaPDV.eof do
      begin
        Application.Title := 'Exportando Venda/C.Receber => ' + ZConsultaPDV.fieldbyname('CTRCA13ID').Value;
        lbStatus.Caption := Application.Title;
        lbStatus.Update;
        Application.ProcessMessages;
            {Abre sql no servidor e tenta achar o registro se achou altera se nao insere!}
        erro := false;
        ZinsereServidor.Close;
        ZinsereServidor.sql.clear;
        ZinsereServidor.sql.Text := 'Select * from ContasReceber where CTRCA13ID=''' + ZConsultaPDV.fieldbyname('CTRCA13ID').Value + '''';
        ZinsereServidor.open;
        if ZinsereServidor.IsEmpty then
          ZinsereServidor.append
        else
          ZinsereServidor.edit;
            {alimenta os campos no servidor}
        for i := 0 to ZConsultaPDV.FieldCount - 1 do
          if ZConsultaPDV.Fields[i].AsString <> '' then
          begin
            try ZinsereServidor.FieldByName(ZConsultaPDV.Fields[i].FieldName).AsVariant := ZConsultaPDV.Fields[i].AsVariant; except Application.ProcessMessages; end;
          end;
        try
          erro := false;
          ZinsereServidor.post;
        except
          erro := true;
          ZinsereServidor.cancel;
          Application.ProcessMessages;
        end;

            {troca coluna PENDENTE PARA NAO, Para nao ser mais exportado ao servidor}
        if not erro then
        begin
          ZupdatePDV.Close;
          ZupdatePDV.sql.clear;
          ZupdatePDV.sql.Text := 'Update ContasReceber Set PENDENTE=''N'' where CTRCA13ID=''' + ZConsultaPDV.fieldbyname('CTRCA13ID').Value + '''';
          ZupdatePDV.ExecSQL;
        end;

        ZConsultaPDV.next;
      end;
    end;
  except
    Application.Title := 'Falha ao Exportar Contas Receber!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim ContasReceber}

  {Recebimento}
  try
    ZConsultaPDV.close;
    ZConsultaPDV.SQL.clear;
    ZConsultaPDV.SQL.Text := 'Select * from Recebimento where PENDENTE = ''S'' ';
    ZConsultaPDV.Open;
    if not ZConsultaPDV.IsEmpty then
    begin
      while not ZConsultaPDV.eof do
      begin
        Application.Title := 'Exportando Venda/Recebimento => ' + ZConsultaPDV.fieldbyname('CTRCA13ID').Value;
        lbStatus.Caption := Application.Title;
        lbStatus.Update;
        Application.ProcessMessages;
            {Abre sql no servidor e tenta achar o registro se achou altera se nao insere!}
        erro := false;
        ZinsereServidor.Close;
        ZinsereServidor.sql.clear;
        ZinsereServidor.sql.Text := 'Select * from Recebimento where CTRCA13ID = ''' + ZConsultaPDV.fieldbyname('CTRCA13ID').Value + ''' AND RECEICOD=' + ZConsultaPDV.fieldbyname('RECEICOD').AsString;
        ZinsereServidor.open;
        if ZinsereServidor.IsEmpty then
          ZinsereServidor.append
        else
          ZinsereServidor.edit;
            {alimenta os campos no servidor}
        for i := 0 to ZConsultaPDV.FieldCount - 1 do
          if ZConsultaPDV.Fields[i].AsString <> '' then
          begin
            try ZinsereServidor.FieldByName(ZConsultaPDV.Fields[i].FieldName).AsVariant := ZConsultaPDV.Fields[i].AsVariant; except Application.ProcessMessages; end;
          end;
        try
          erro := false;
          ZinsereServidor.post;
        except
          erro := true;
          ZinsereServidor.cancel;
          Application.ProcessMessages;
        end;

            {troca coluna PENDENTE PARA NAO, Para nao ser mais exportado ao servidor}
        if not erro then
        begin
          ZupdatePDV.Close;
          ZupdatePDV.sql.clear;
          ZupdatePDV.sql.ADD('Update Recebimento Set PENDENTE=''N'' where CTRCA13ID=''' + ZConsultaPDV.fieldbyname('CTRCA13ID').Value + '''');
          ZupdatePDV.sql.ADD(' AND RECEICOD=' + ZConsultaPDV.fieldbyname('RECEICOD').AsString);
          ZupdatePDV.ExecSQL;
        end;

        ZConsultaPDV.next;
      end;
    end;
  except
    Application.Title := 'Falha ao Exportar Recebimentos!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim Recebimento}

  {MovimentoCaixa}
  try
    ZConsultaPDV.close;
    ZConsultaPDV.SQL.clear;
    ZConsultaPDV.SQL.Text := 'Select * from MovimentoCaixa where PENDENTE = ''S'' ';
    ZConsultaPDV.Open;
    if not ZConsultaPDV.IsEmpty then
    begin
      while not ZConsultaPDV.eof do
      begin
        Application.Title := 'Exportando Movimento Caixa...';
        lbStatus.Caption := Application.Title;
        lbStatus.Update;
        Application.ProcessMessages;
            {Abre sql no servidor e tenta achar o registro se achou altera se nao insere!}
        erro := false;
        ZinsereServidor.Close;
        ZinsereServidor.sql.clear;
        ZinsereServidor.sql.add('Select * from MovimentoCaixa where EMPRICOD=' + ZConsultaPDV.fieldbyname('EMPRICOD').AsString);
        ZinsereServidor.sql.add(' AND TERMICOD=' + ZConsultaPDV.fieldbyname('TERMICOD').AsString);
        ZinsereServidor.sql.add(' AND MVCXDMOV=''' + FormatDateTime('mm/dd/yyyy', ZConsultaPDV.fieldbyname('MVCXDMOV').Value) + '''');
        ZinsereServidor.sql.add(' AND MVCXICOD=' + ZConsultaPDV.fieldbyname('MVCXICOD').AsString);
        ZinsereServidor.open;
        if ZinsereServidor.IsEmpty then
          ZinsereServidor.append
        else
          ZinsereServidor.edit;

            {alimenta os campos no servidor}
        for i := 0 to ZConsultaPDV.FieldCount - 1 do
          if ZConsultaPDV.Fields[i].AsString <> '' then
          begin
            try ZinsereServidor.FieldByName(ZConsultaPDV.Fields[i].FieldName).AsVariant := ZConsultaPDV.Fields[i].AsVariant; except Application.ProcessMessages; end;
          end;
        try
          erro := false;
          ZinsereServidor.post;
        except
          erro := true;
          ZinsereServidor.cancel;
          Application.ProcessMessages;
        end;

            {troca coluna PENDENTE PARA NAO, Para nao ser mais exportado ao servidor}
        if not erro then
        begin
          ZupdatePDV.Close;
          ZupdatePDV.sql.clear;
          ZupdatePDV.sql.add('Update MovimentoCaixa Set PENDENTE=''N''');
          ZupdatePDV.sql.add('Where EMPRICOD=' + ZConsultaPDV.fieldbyname('EMPRICOD').AsString +
            ' AND TERMICOD=' + ZConsultaPDV.fieldbyname('TERMICOD').AsString +
            ' AND MVCXDMOV=''' + FormatDateTime('mm/dd/yyyy', ZConsultaPDV.fieldbyname('MVCXDMOV').Value) + '''' +
            ' AND MVCXICOD=' + ZConsultaPDV.fieldbyname('MVCXICOD').AsString);

          ZupdatePDV.ExecSQL;
        end;

        ZConsultaPDV.next;
      end;
    end;
  except
    Application.Title := 'Falha ao Exportar Mov.Caixa!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim MovimentoCaixa}

  {MovimentoBanco}
  try
    ZConsultaPDV.close;
    ZConsultaPDV.SQL.clear;
    ZConsultaPDV.SQL.Text := 'Select * from MovimentoBanco where PENDENTE = ''S'' ';
    ZConsultaPDV.Open;
    if not ZConsultaPDV.IsEmpty then
    begin
      while not ZConsultaPDV.eof do
      begin
        Application.Title := 'Exportando Movimento Banco...';
        lbStatus.Caption := Application.Title;
        lbStatus.Update;
        Application.ProcessMessages;
            {Abre sql no servidor e tenta achar o registro se achou altera se nao insere!}
        erro := false;
        ZinsereServidor.Close;
        ZinsereServidor.sql.clear;
        ZinsereServidor.sql.add('Select * from MovimentoBanco where EMPRICOD=' + ZConsultaPDV.fieldbyname('EMPRICOD').AsString);
        ZinsereServidor.sql.add(' AND MVBCA13ID = ''' + ZConsultaPDV.fieldbyname('MVBCA13ID').Value + '''');
        ZinsereServidor.open;
        if ZinsereServidor.IsEmpty then
          ZinsereServidor.append
        else
          ZinsereServidor.edit;
        ContaCorrente := ZConsultaPDV.fieldbyname('CTCRICOD').Value;
        ValorMov := ZConsultaPDV.fieldbyname('MVBCN2VLRCRED').Value;

            {alimenta os campos no servidor}
        for i := 0 to ZConsultaPDV.FieldCount - 1 do
          if ZConsultaPDV.Fields[i].AsString <> '' then
          begin
            try ZinsereServidor.FieldByName(ZConsultaPDV.Fields[i].FieldName).AsVariant := ZConsultaPDV.Fields[i].AsVariant; except Application.ProcessMessages; end;
          end;
        try
          erro := false;
          ZinsereServidor.post;
        except
          erro := true;
          ZinsereServidor.cancel;
          Application.ProcessMessages;
        end;

            {troca coluna PENDENTE PARA NAO, Para nao ser mais exportado ao servidor}
        if not erro then
        begin
          ZupdatePDV.Close;
          ZupdatePDV.sql.clear;
          ZupdatePDV.sql.add('Update MovimentoBanco Set PENDENTE=''N''');
          ZupdatePDV.sql.add('Where EMPRICOD=' + ZConsultaPDV.fieldbyname('EMPRICOD').AsString +
            ' AND MVBCA13ID = ''' + ZConsultaPDV.fieldbyname('MVBCA13ID').AsString + '''');
          ZupdatePDV.ExecSQL;

          {Busca a Operacao da sangria}
          if ValorMov > 0 then
          begin
            zConfigFinanceiro.SQL.Clear;
            zConfigFinanceiro.sql.add('Select OPE_BANCO_SANGRIA from CONFIGFINANCEIRO');
            zConfigFinanceiro.open;
            if not zConfigFinanceiro.IsEmpty then
            begin
            {Busca a Operacao do movimentobanco}
              zOperacaoBanco.SQL.Clear;
              zOperacaoBanco.sql.add('Select OPBCCTIPO from OPERACAOBANCO where OPBCICOD = ' + zConfigFinanceiro.fieldbyname('OPE_BANCO_SANGRIA').AsString) ;
              zOperacaoBanco.open;
              {atualiza saldo na conta corrente}
              if not (zOperacaoBanco.IsEmpty) then
              begin
                Case zOperacaoBanco.fieldbyname('OPBCCTIPO').AsString[1] of
                  'D' : begin
                         AtualizaSaldoContaCorrente(ContaCorrente,ValorMov,0);
                        end;
                  'C' : begin
                          AtualizaSaldoContaCorrente(ContaCorrente,0,ValorMov);
                        end;
                end;
              end;
            end;
          end;
        end;
        ZConsultaPDV.next;
      end;
    end;
  except
    Application.Title := 'Falha ao Exportar Mov.Banco!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim MovimentoBanco}

  {Totais Terminal Venda do dia}
  Application.Title := 'Calculando Total Venda Dia Terminal => ' + TerminalCodigoSTR;
  lbStatus.Caption := Application.Title;
  lbStatus.Update;
  Application.ProcessMessages;
  ZConsultaPDV.close;
  ZConsultaPDV.SQL.clear;
  ZConsultaPDV.SQL.Text := 'Select sum(CUPON2TOTITENS) from Cupom where CUPODEMIS = ''' + FormatDateTime('mm/dd/yyyy', now) + ''' and TERMICOD=' + TerminalCodigoSTR;
  ZConsultaPDV.Open;
  if not ZConsultaPDV.IsEmpty then
  begin
    if ZConsultaPDV.fieldbyname('SUM').Value > 0 then
      xtotaldia := ZConsultaPDV.fieldbyname('SUM').AsString
    else
      xtotaldia := '0';
  end;
  ZConsultaPDV.close;
  ZConsultaPDV.SQL.clear;
  ZConsultaPDV.SQL.Text := 'Select TERMCSTATUSCAIXA, TERMDSTATUSCAIXA  from Terminal where TERMICOD=' + TerminalCodigoSTR;
  ZConsultaPDV.Open;

  try
    {Abre sql no servidor e tenta achar o TERMINAL se achou altera se nao insere!}
    ZinsereServidor.Close;
    ZinsereServidor.sql.clear;
    ZinsereServidor.sql.Text := 'Update Terminal set ONLINE=''S'', TOTALDIA=' + TrocaVirgulaPorPonto(xTotalDia) +
      ', DATAULTENVIO=''' + FormatDateTime('mm/dd/yyyy hh:mm:nn', now) + ''', TERMCSTATUSCAIXA=''' + ZConsultaPDV.fieldbyname('TERMCSTATUSCAIXA').AsString + '''' +
      ', TERMDSTATUSCAIXA=''' + FormatDateTime('mm/dd/yyyy hh:mm:nn', ZConsultaPDV.fieldbyname('TERMDSTATUSCAIXA').AsDateTime) + '''' +
      ' where TERMICOD = ' + TerminalCodigoSTR;
    ZinsereServidor.ExecSQL;
    lbEnvio.Caption := FormatDateTime('dd/mm/yy hh:mm', now);
    lbEnvio.Update;
  except
    Application.Title := 'Falha ao Exportar/Atualizar Terminal!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim Totais Terminal}

  {InventarioEstoque}
  try
    ZConsultaPDV.close;
    ZConsultaPDV.SQL.clear;
    ZConsultaPDV.SQL.Text := 'Select * from InventarioEstoque where PENDENTE = ''S'' ';
    ZConsultaPDV.Open;
    if not ZConsultaPDV.IsEmpty then
    begin
      while not ZConsultaPDV.eof do
      begin
        Application.Title := 'Exportando Inventario...';
        lbStatus.Caption := Application.Title;
        lbStatus.Update;
        Application.ProcessMessages;
            {Abre sql no servidor e tenta achar o registro se achou altera se nao insere!}
        erro := false;
        ZinsereServidor.Close;
        ZinsereServidor.sql.clear;
        ZinsereServidor.sql.add('Select * from InventarioEstoque where EMPRICOD=' + ZConsultaPDV.fieldbyname('EMPRICOD').AsString);
        ZinsereServidor.sql.add(' AND TERMICOD=' + ZConsultaPDV.fieldbyname('TERMICOD').AsString);
        ZinsereServidor.sql.add(' AND INVDDATA=''' + FormatDateTime('mm/dd/yyyy', ZConsultaPDV.fieldbyname('INVDDATA').Value) + '''');
        ZinsereServidor.sql.add(' AND INVIPRODPOS=' + ZConsultaPDV.fieldbyname('INVIPRODPOS').AsString);
        ZinsereServidor.open;
        if ZinsereServidor.IsEmpty then
          ZinsereServidor.append
        else
          ZinsereServidor.edit;

            {alimenta os campos no servidor}
        for i := 0 to ZConsultaPDV.FieldCount - 1 do
          if ZConsultaPDV.Fields[i].AsString <> '' then
          begin
            try ZinsereServidor.FieldByName(ZConsultaPDV.Fields[i].FieldName).AsVariant := ZConsultaPDV.Fields[i].AsVariant; except Application.ProcessMessages; end;
          end;
        try
          erro := false;
          ZinsereServidor.post;
        except
          erro := true;
          ZinsereServidor.cancel;
          Application.ProcessMessages;
        end;

            {troca coluna PENDENTE PARA NAO, Para nao ser mais exportado ao servidor}
        if not erro then
        begin
          ZupdatePDV.Close;
          ZupdatePDV.sql.clear;
          ZupdatePDV.sql.add('Update InventarioEstoque Set PENDENTE=''N''');
          ZupdatePDV.sql.add('Where EMPRICOD=' + ZConsultaPDV.fieldbyname('EMPRICOD').AsString +
            ' AND TERMICOD=' + ZConsultaPDV.fieldbyname('TERMICOD').AsString +
            ' AND INVDDATA=''' + FormatDateTime('mm/dd/yyyy', ZConsultaPDV.fieldbyname('INVDDATA').Value) + '''' +
            ' AND INVIPRODPOS=' + ZConsultaPDV.fieldbyname('INVIPRODPOS').AsString);

          ZupdatePDV.ExecSQL;
        end;

        ZConsultaPDV.next;
      end;
    end;
  except
    Application.Title := 'Falha ao Exportar Inventario de Estoque!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim InventarioEstoque}

  {CUPOM_FECHAMENTO}
  try
    ZConsultaPDV.close;
    ZConsultaPDV.SQL.clear;
    ZConsultaPDV.SQL.Text := 'Select * from CUPOM_FECHAMENTO where IMP_SERVIDOR is null ';
    ZConsultaPDV.Open;
    if not ZConsultaPDV.IsEmpty then
    begin
      while not ZConsultaPDV.eof do
      begin
        Application.Title := 'Exportando CUPOM_FECHAMENTO => ' + ZConsultaPDV.fieldbyname('COD_CUPOM_FECHAMENTO').AsString;
        lbStatus.Caption := Application.Title;
        lbStatus.Update;
        Application.ProcessMessages;
            {Abre sql no servidor e tenta achar o registro se achou altera se nao insere!}
        erro := false;
        ZinsereServidor.Close;
        ZinsereServidor.sql.clear;
        ZinsereServidor.sql.Add('Select * from CUPOM_FECHAMENTO where COD_CUPOM_FECHAMENTO = ' + ZConsultaPDV.fieldbyname('COD_CUPOM_FECHAMENTO').AsString);
        ZinsereServidor.open;

        if ZinsereServidor.IsEmpty then
          ZinsereServidor.append
        else
          ZinsereServidor.edit;
            {alimenta os campos no servidor}

        for i := 0 to ZConsultaPDV.FieldCount - 1 do
          if ZConsultaPDV.Fields[i].AsString <> '' then
          begin
            try ZinsereServidor.FieldByName(ZConsultaPDV.Fields[i].FieldName).AsVariant := ZConsultaPDV.Fields[i].AsVariant; except Application.ProcessMessages; end;
          end;

        try
          erro := false;
          ZinsereServidor.post;
        except
          erro := true;
          ZinsereServidor.cancel;
          Application.ProcessMessages;
        end;       

        {troca coluna PENDENTE PARA NAO, Para nao ser mais exportado ao servidor}
        if not erro then
        begin
          ZupdatePDV.Close;
          ZupdatePDV.sql.clear;
          ZupdatePDV.sql.ADD('Update CUPOM_FECHAMENTO Set IMP_SERVIDOR=''S'' where COD_CUPOM_FECHAMENTO = '
                    + ZConsultaPDV.fieldbyname('COD_CUPOM_FECHAMENTO').AsString);
          ZupdatePDV.ExecSQL;
        end;

        ZConsultaPDV.next;
      end;
    end;

    ZconsultaServidor.Close;
    ZconsultaServidor.sql.clear;
    ZconsultaServidor.sql.Text := 'Select max(COD_CUPOM_FECHAMENTO) as cod from CUPOM_FECHAMENTO ';
    ZconsultaServidor.open;

    ZinsereServidor.Close;
    ZinsereServidor.sql.clear;
    ZinsereServidor.sql.Text := ' set generator G_CUPOM_FECHAMENTO to ' + IntToStr(ZconsultaServidor.FieldByName('cod').AsInteger + 1);
    ZinsereServidor.ExecSQL;       
  except
    Application.Title := 'Falha ao Exportar CUPOM_FECHAMENTO!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim CUPOM_FECHAMENTO}

  {CUPOM_FECHAMENTO_ITEM}
  try
    ZConsultaPDV.close;
    ZConsultaPDV.SQL.clear;
    ZConsultaPDV.SQL.Text := 'Select * from CUPOM_FECHAMENTO_ITEM where IMP_SERVIDOR is null ';
    ZConsultaPDV.Open;
    if not ZConsultaPDV.IsEmpty then
    begin
      while not ZConsultaPDV.eof do
      begin
        Application.Title := 'Exportando CUPOM_FECHAMENTO_ITEM => ' + ZConsultaPDV.fieldbyname('COD_CUPOM_FECHAMENTO').AsString;
        lbStatus.Caption := Application.Title;
        lbStatus.Update;
        Application.ProcessMessages;
            {Abre sql no servidor e tenta achar o registro se achou altera se nao insere!}
        erro := false;
        ZinsereServidor.Close;
        ZinsereServidor.sql.clear;
        ZinsereServidor.sql.Add('Select * from CUPOM_FECHAMENTO_ITEM where COD_CUPOM_FECHAMENTO = '
                                + ZConsultaPDV.fieldbyname('COD_CUPOM_FECHAMENTO').AsString
                                + ' and COD_CPRZ = ' + ZConsultaPDV.fieldbyname('COD_CPRZ').AsString);
        ZinsereServidor.open;

        if ZinsereServidor.IsEmpty then
          ZinsereServidor.append
        else
          ZinsereServidor.edit;
            {alimenta os campos no servidor}

        for i := 0 to ZConsultaPDV.FieldCount - 1 do
          if ZConsultaPDV.Fields[i].AsString <> '' then
          begin
            try ZinsereServidor.FieldByName(ZConsultaPDV.Fields[i].FieldName).AsVariant := ZConsultaPDV.Fields[i].AsVariant; except Application.ProcessMessages; end;
          end;

        try
          erro := false;
          ZinsereServidor.post;
        except
          erro := true;
          ZinsereServidor.cancel;
          Application.ProcessMessages;
        end;       

        {troca coluna PENDENTE PARA NAO, Para nao ser mais exportado ao servidor}
        if not erro then
        begin
          ZupdatePDV.Close;
          ZupdatePDV.sql.clear;
          ZupdatePDV.sql.ADD('Update CUPOM_FECHAMENTO_ITEM Set IMP_SERVIDOR=''S'' where COD_CUPOM_FECHAMENTO = '
                    + ZConsultaPDV.fieldbyname('COD_CUPOM_FECHAMENTO').AsString
                    + ' and COD_CPRZ = ' + ZConsultaPDV.fieldbyname('COD_CPRZ').AsString);
          ZupdatePDV.ExecSQL;
        end;

        ZConsultaPDV.next;
      end;
    end;

  except
    Application.Title := 'Falha ao Exportar CUPOM_FECHAMENTO_ITEM!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim CUPOM_FECHAMENTO_ITEM}    

end;

function TFormPrincipal.TrocaVirgulaPorPonto(Numero: string): string;
var Wstr: string;
begin
  if Numero <> '' then
  begin
    Wstr := Numero;
    if Pos(',', Wstr) > 0 then
      TrocaVirgulaPorPonto := Copy(Wstr, 1, Pos(',', Wstr) - 1) + '.' + Copy(Wstr, Pos(',', Wstr) + 1, 3)
    else
      TrocaVirgulaPorPonto := Numero;
  end
  else TrocaVirgulaPorPonto := '0.00';
end;

procedure TFormPrincipal.mnImportaProdutosManualmenteClick(
  Sender: TObject);
var i: integer;
begin
  if lbstatus.caption <> 'Aguardando Proximo Ciclo' then
  begin
    showmessage('Integrador trabalhando! Espere at� o termino do processo para executar essa rotina!');
    exit;
  end;

  Timer.Enabled := False;

  if not Conecta then
    exit;

  {Abre Produto no servidor para achar os registros que serao importados!}
  try
    ZconsultaServidor.Close;
    ZconsultaServidor.sql.clear;
    ZconsultaServidor.sql.Text := 'Select * from produto order by prodicod asc';
    //ZconsultaServidor.RequestLive := False;
    ZconsultaServidor.open;
    if not ZconsultaServidor.IsEmpty then
    begin
      while not ZconsultaServidor.eof do
      begin
        Application.Title := 'Verificando Produto => ' + ZconsultaServidor.fieldbyname('PRODICOD').AsString;
        lbStatus.Caption := Application.Title;
        lbStatus.Update;
        Application.ProcessMessages;
        ZConsultaPDV.close;
        ZConsultaPDV.SQL.clear;
        ZConsultaPDV.SQL.Text := 'Select * from PRODUTO where PRODICOD=' + ZconsultaServidor.fieldbyname('PRODICOD').AsString;
            //ZConsultaPDV.RequestLive := True;
        ZConsultaPDV.Open;
        if ZConsultaPDV.IsEmpty then
        begin
          Application.Title := 'Incluindo Produto => ' + ZconsultaServidor.fieldbyname('PRODICOD').AsString;
          lbStatus.Caption := Application.Title;
          ZConsultaPDV.append;
                {alimenta os campos no Pdv}
          for i := 0 to ZconsultaServidor.FieldCount - 1 do
          begin
            try
              ZConsultaPDV.FieldByName(ZconsultaServidor.Fields[i].FieldName).AsVariant := ZconsultaServidor.Fields[i].AsVariant;
            except
              Application.ProcessMessages;
            end;
          end;

          try
            ZConsultaPDV.post;
          except
            ZConsultaPDV.cancel;
          end;
        end
        else
        begin
                {se difrente edita a linha e atualiza com base na info do servidor}
          if (ZConsultaPDV.fieldbyname('PRODN3VLRVENDA').AsString <> ZconsultaServidor.fieldbyname('PRODN3VLRVENDA').AsString) or
            (ZConsultaPDV.fieldbyname('PRODN3VLRVENDAPROM').AsString <> ZconsultaServidor.fieldbyname('PRODN3VLRVENDAPROM').AsString) then
          begin
            Application.Title := 'Alterando Produto => ' + ZconsultaServidor.fieldbyname('PRODICOD').AsString;
            lbStatus.Caption := Application.Title;
            ZConsultaPDV.edit;

                    {alimenta os campos no Pdv}
            for i := 0 to ZconsultaServidor.FieldCount - 1 do
            begin
              try
                ZConsultaPDV.FieldByName(ZconsultaServidor.Fields[i].FieldName).AsVariant := ZconsultaServidor.Fields[i].AsVariant;
              except
                Application.ProcessMessages;
              end;
            end;

            try
              ZConsultaPDV.post;
            except
              ZConsultaPDV.cancel;
            end;
          end;
        end;

        ZconsultaServidor.Next;
      end;
    end;
    Application.Title := '';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
  except
    Application.Title := 'Falha ao Importar Produtos!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim produtos}

  {Abre Produtobarras no servidor para achar os registros que serao importados!}
  try
    ZconsultaServidor.Close;
    ZconsultaServidor.sql.clear;
    ZconsultaServidor.sql.Text := 'Select * from produtobarras order by prodicod asc';
    //ZconsultaServidor.RequestLive := False;
    ZconsultaServidor.open;
    if not ZconsultaServidor.IsEmpty then
    begin
      while not ZconsultaServidor.eof do
      begin
        Application.Title := 'Verificando Produto Barras => ' + ZconsultaServidor.fieldbyname('PRODICOD').AsString;
        lbStatus.Caption := Application.Title;
        lbStatus.Update;
        Application.ProcessMessages;
        ZConsultaPDV.close;
        ZConsultaPDV.SQL.clear;
        ZConsultaPDV.SQL.Text := 'Select * from PRODUTOBARRAS where PRODICOD=' + ZconsultaServidor.fieldbyname('PRODICOD').AsString + ' and PRBAA15BARRAS=''' + ZconsultaServidor.fieldbyname('PRBAA15BARRAS').AsString + '''';
            //ZConsultaPDV.RequestLive := True;
        ZConsultaPDV.Open;
        if ZConsultaPDV.IsEmpty then
        begin
          Application.Title := 'Incluindo Produto Barras => ' + ZconsultaServidor.fieldbyname('PRODICOD').AsString;
          lbStatus.Caption := Application.Title;
          ZConsultaPDV.append;
                {alimenta os campos no Pdv}
          ZConsultaPDV.fieldbyname('PRODICOD').AsString := ZconsultaServidor.fieldbyname('PRODICOD').AsString;
          ZConsultaPDV.fieldbyname('PRBAA15BARRAS').AsString := ZconsultaServidor.fieldbyname('PRBAA15BARRAS').AsString;
          try
            ZConsultaPDV.post;
          except
            ZConsultaPDV.cancel;
          end;
        end;

        ZconsultaServidor.Next;
      end;
    end;
    Application.Title := '';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
  except
    Application.Title := 'Falha ao Importar Produtos Barras!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim produtosbarras}

  {Abre Marcas no servidor para achar os registros que serao importados!}
  try
    ZconsultaServidor.Close;
    ZconsultaServidor.sql.clear;
    ZconsultaServidor.sql.Text := 'Select * from marca order by marcicod asc';
    //ZconsultaServidor.RequestLive := False;
    ZconsultaServidor.open;
    if not ZconsultaServidor.IsEmpty then
    begin
      while not ZconsultaServidor.eof do
      begin
        Application.Title := 'Verificando Marca => ' + ZconsultaServidor.fieldbyname('marcicod').AsString;
        lbStatus.Caption := Application.Title;
        lbStatus.Update;
        Application.ProcessMessages;
        ZConsultaPDV.close;
        ZConsultaPDV.SQL.clear;
        ZConsultaPDV.SQL.Text := 'Select * from marca where marcicod=' + ZconsultaServidor.fieldbyname('marcicod').AsString;
            //ZConsultaPDV.RequestLive := True;
        ZConsultaPDV.Open;
        if ZConsultaPDV.IsEmpty then
        begin
          Application.Title := 'Incluindo Marca => ' + ZconsultaServidor.fieldbyname('marcicod').AsString;
          lbStatus.Caption := Application.Title;
          ZConsultaPDV.append;
                {alimenta os campos no Pdv}
          ZConsultaPDV.fieldbyname('marcicod').AsString := ZconsultaServidor.fieldbyname('marcicod').AsString;
          ZConsultaPDV.fieldbyname('MARCA60DESCR').AsString := ZconsultaServidor.fieldbyname('MARCA60DESCR').AsString;
          try
            ZConsultaPDV.post;
          except
            ZConsultaPDV.cancel;
          end;
        end
        else
        begin
          if ZConsultaPDV.fieldbyname('MARCA60DESCR').AsString <> ZconsultaServidor.fieldbyname('MARCA60DESCR').AsString then
          begin
            Application.Title := 'Alterando Marca => ' + ZconsultaServidor.fieldbyname('marcicod').AsString;
            lbStatus.Caption := Application.Title;
            ZConsultaPDV.edit;
            ZConsultaPDV.fieldbyname('MARCA60DESCR').AsString := ZconsultaServidor.fieldbyname('MARCA60DESCR').AsString;
            try
              ZConsultaPDV.post;
            except
              ZConsultaPDV.cancel;
            end;
          end;
        end;

        ZconsultaServidor.Next;
      end;
    end;
    Application.Title := '';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
  except
    Application.Title := 'Falha ao Importar Marcas!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim marca}

  {Abre Grupos no servidor para achar os registros que serao importados!}
  try
    ZconsultaServidor.Close;
    ZconsultaServidor.sql.clear;
    ZconsultaServidor.sql.Text := 'Select * from grupo order by GRUPICOD asc';
    //ZconsultaServidor.RequestLive := False;
    ZconsultaServidor.open;
    if not ZconsultaServidor.IsEmpty then
    begin
      while not ZconsultaServidor.eof do
      begin
        Application.Title := 'Verificando Grupo => ' + ZconsultaServidor.fieldbyname('GRUPICOD').AsString;
        lbStatus.Caption := Application.Title;
        lbStatus.Update;
        Application.ProcessMessages;
        ZConsultaPDV.close;
        ZConsultaPDV.SQL.clear;
        ZConsultaPDV.SQL.Text := 'Select * from GRUPO where GRUPICOD=' + ZconsultaServidor.fieldbyname('GRUPICOD').AsString;
            //ZConsultaPDV.RequestLive := True;
        ZConsultaPDV.Open;
        if ZConsultaPDV.IsEmpty then
        begin
          Application.Title := 'Incluindo Grupo => ' + ZconsultaServidor.fieldbyname('GRUPICOD').AsString;
          lbStatus.Caption := Application.Title;
          ZConsultaPDV.append;
                {alimenta os campos no Pdv}
          ZConsultaPDV.fieldbyname('GRUPICOD').AsString := ZconsultaServidor.fieldbyname('GRUPICOD').AsString;
          ZConsultaPDV.fieldbyname('GRUPA60DESCR').AsString := ZconsultaServidor.fieldbyname('GRUPA60DESCR').AsString;
          try
            ZConsultaPDV.post;
          except
            ZConsultaPDV.cancel;
          end;
        end
        else
        begin
          if ZConsultaPDV.fieldbyname('GRUPA60DESCR').AsString <> ZconsultaServidor.fieldbyname('GRUPA60DESCR').AsString then
          begin
            Application.Title := 'Alterando Grupo => ' + ZconsultaServidor.fieldbyname('GRUPICOD').AsString;
            lbStatus.Caption := Application.Title;
            ZConsultaPDV.edit;
            ZConsultaPDV.fieldbyname('GRUPA60DESCR').AsString := ZconsultaServidor.fieldbyname('GRUPA60DESCR').AsString;
            try
              ZConsultaPDV.post;
            except
              ZConsultaPDV.cancel;
            end;
          end;
        end;

        ZconsultaServidor.Next;
      end;
    end;
    Application.Title := '';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
  except
    Application.Title := 'Falha ao Importar Grupos!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim grupo}

  {Abre COREs no servidor para achar os registros que serao importados!}
  try
    ZconsultaServidor.Close;
    ZconsultaServidor.sql.clear;
    ZconsultaServidor.sql.Text := 'Select * from COR order by CORICOD asc';
    //ZconsultaServidor.RequestLive := False;
    ZconsultaServidor.open;
    if not ZconsultaServidor.IsEmpty then
    begin
      while not ZconsultaServidor.eof do
      begin
        Application.Title := 'Verificando Cor => ' + ZconsultaServidor.fieldbyname('CORICOD').AsString;
        lbStatus.Caption := Application.Title;
        lbStatus.Update;
        Application.ProcessMessages;
        ZConsultaPDV.close;
        ZConsultaPDV.SQL.clear;
        ZConsultaPDV.SQL.Text := 'Select * from COR where CORICOD=' + ZconsultaServidor.fieldbyname('CORICOD').AsString;
            //ZConsultaPDV.RequestLive := True;
        ZConsultaPDV.Open;
        if ZConsultaPDV.IsEmpty then
        begin
          Application.Title := 'Incluindo Cor => ' + ZconsultaServidor.fieldbyname('CORICOD').AsString;
          lbStatus.Caption := Application.Title;
          ZConsultaPDV.append;
                {alimenta os campos no Pdv}
          ZConsultaPDV.fieldbyname('CORICOD').AsString := ZconsultaServidor.fieldbyname('CORICOD').AsString;
          ZConsultaPDV.fieldbyname('CORA30DESCR').AsString := ZconsultaServidor.fieldbyname('CORA30DESCR').AsString;
          try
            ZConsultaPDV.post;
          except
            ZConsultaPDV.cancel;
          end;
        end
        else
        begin
          if ZConsultaPDV.fieldbyname('CORA30DESCR').AsString <> ZconsultaServidor.fieldbyname('CORA30DESCR').AsString then
          begin
            Application.Title := 'Alterando Cor => ' + ZconsultaServidor.fieldbyname('CORICOD').AsString;
            lbStatus.Caption := Application.Title;
            ZConsultaPDV.edit;
            ZConsultaPDV.fieldbyname('CORA30DESCR').AsString := ZconsultaServidor.fieldbyname('CORA30DESCR').AsString;
            try
              ZConsultaPDV.post;
            except
              ZConsultaPDV.cancel;
            end;
          end;
        end;

        ZconsultaServidor.Next;
      end;
    end;
    Application.Title := '';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
  except
    Application.Title := 'Falha ao Importar Cores!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim cores}

  {Abre Grades no servidor para achar os registros que serao importados!}
  try
    ZconsultaServidor.Close;
    ZconsultaServidor.sql.clear;
    ZconsultaServidor.sql.Text := 'Select * from grade order by GRADICOD asc';
    //ZconsultaServidor.RequestLive := False;
    ZconsultaServidor.open;
    if not ZconsultaServidor.IsEmpty then
    begin
      while not ZconsultaServidor.eof do
      begin
        Application.Title := 'Verificando Grade => ' + ZconsultaServidor.fieldbyname('GRADICOD').AsString;
        lbStatus.Caption := Application.Title;
        lbStatus.Update;
        Application.ProcessMessages;
        ZConsultaPDV.close;
        ZConsultaPDV.SQL.clear;
        ZConsultaPDV.SQL.Text := 'Select * from GRADE where GRADICOD=' + ZconsultaServidor.fieldbyname('GRADICOD').AsString;
            //ZConsultaPDV.RequestLive := True;
        ZConsultaPDV.Open;
        if ZConsultaPDV.IsEmpty then
        begin
          Application.Title := 'Incluindo Grade => ' + ZconsultaServidor.fieldbyname('GRADICOD').AsString;
          lbStatus.Caption := Application.Title;
          ZConsultaPDV.append;
                {alimenta os campos no Pdv}
          ZConsultaPDV.fieldbyname('GRADICOD').AsString := ZconsultaServidor.fieldbyname('GRADICOD').AsString;
          ZConsultaPDV.fieldbyname('GRADA30DESCR').AsString := ZconsultaServidor.fieldbyname('GRADA30DESCR').AsString;
          try
            ZConsultaPDV.post;
          except
            ZConsultaPDV.cancel;
          end;
        end
        else
        begin
          if ZConsultaPDV.fieldbyname('GRADA30DESCR').AsString <> ZconsultaServidor.fieldbyname('GRADA30DESCR').AsString then
          begin
            Application.Title := 'Alterando Grade => ' + ZconsultaServidor.fieldbyname('GRADICOD').AsString;
            lbStatus.Caption := Application.Title;
            ZConsultaPDV.edit;
            ZConsultaPDV.fieldbyname('GRADA30DESCR').AsString := ZconsultaServidor.fieldbyname('GRADA30DESCR').AsString;
            try
              ZConsultaPDV.post;
            except
              ZConsultaPDV.cancel;
            end;
          end;
        end;

        ZconsultaServidor.Next;
      end;
    end;
    Application.Title := '';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
  except
    Application.Title := 'Falha ao Importar Grades!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim grades}

  {Abre tamanhos no servidor para achar os registros que serao importados!}
  try
    ZconsultaServidor.Close;
    ZconsultaServidor.sql.clear;
    ZconsultaServidor.sql.Text := 'Select * from GRADETAMANHO order by GRADICOD, GRTMICOD asc';
    //ZconsultaServidor.RequestLive := False;
    ZconsultaServidor.open;
    if not ZconsultaServidor.IsEmpty then
    begin
      while not ZconsultaServidor.eof do
      begin
        Application.Title := 'Verificando Grade-Tamanho => ' + ZconsultaServidor.fieldbyname('GRADICOD').AsString + '-' + ZconsultaServidor.fieldbyname('GRTMICOD').AsString;
        lbStatus.Caption := Application.Title;
        lbStatus.Update;
        Application.ProcessMessages;
        ZConsultaPDV.close;
        ZConsultaPDV.SQL.clear;
        ZConsultaPDV.SQL.Text := 'Select * from GRADETAMANHO where GRADICOD=' + ZconsultaServidor.fieldbyname('GRADICOD').AsString + ' and GRTMICOD=' + ZconsultaServidor.fieldbyname('GRTMICOD').AsString;
            //ZConsultaPDV.RequestLive := True;
        ZConsultaPDV.Open;
        if ZConsultaPDV.IsEmpty then
        begin
          Application.Title := 'Incluindo Grade-Tamanho => ' + ZconsultaServidor.fieldbyname('GRADICOD').AsString + '-' + ZconsultaServidor.fieldbyname('GRTMICOD').AsString;
          lbStatus.Caption := Application.Title;
          ZConsultaPDV.append;
                {alimenta os campos no Pdv}
          ZConsultaPDV.fieldbyname('GRADICOD').AsString := ZconsultaServidor.fieldbyname('GRADICOD').AsString;
          ZConsultaPDV.fieldbyname('GRTMICOD').AsString := ZconsultaServidor.fieldbyname('GRTMICOD').AsString;
          ZConsultaPDV.fieldbyname('GRTMA5DESCR').AsString := ZconsultaServidor.fieldbyname('GRTMA5DESCR').AsString;
          try
            ZConsultaPDV.post;
          except
            ZConsultaPDV.cancel;
          end;
        end
        else
        begin
          if ZConsultaPDV.fieldbyname('GRTMA5DESCR').AsString <> ZconsultaServidor.fieldbyname('GRTMA5DESCR').AsString then
          begin
            Application.Title := 'Alterando Grade-Tamanho => ' + ZconsultaServidor.fieldbyname('GRADICOD').AsString + '-' + ZconsultaServidor.fieldbyname('GRTMICOD').AsString;
            lbStatus.Caption := Application.Title;
            ZConsultaPDV.edit;
            ZConsultaPDV.fieldbyname('GRTMA5DESCR').AsString := ZconsultaServidor.fieldbyname('GRTMA5DESCR').AsString;
            try
              ZConsultaPDV.post;
            except
              ZConsultaPDV.cancel;
            end;
          end;
        end;

        ZconsultaServidor.Next;
      end;
    end;
    Application.Title := '';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
  except
    Application.Title := 'Falha ao Importar Grades / Tamanhos!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim gradesTamanho}

  {Abre NCMs no servidor para achar os registros que serao importados!}
  try
    ZconsultaServidor.Close;
    ZconsultaServidor.sql.clear;
    ZconsultaServidor.sql.Text := 'Select NCMICOD, NCMA30CODIGO from NCM';
    //ZconsultaServidor.RequestLive := False;
    ZconsultaServidor.open;
    if not ZconsultaServidor.IsEmpty then
    begin
      while not ZconsultaServidor.eof do
      begin
        Application.Title := 'Verificando NCM => ' + ZconsultaServidor.fieldbyname('NCMICOD').AsString;
        lbStatus.Caption := Application.Title;
        lbStatus.Update;
        Application.ProcessMessages;
        ZConsultaPDV.close;
        ZConsultaPDV.SQL.clear;
        ZConsultaPDV.SQL.Text := 'Select NCMICOD, NCMA30CODIGO from NCM where NCMICOD=' + ZconsultaServidor.fieldbyname('NCMICOD').AsString;
            //ZConsultaPDV.RequestLive := True;
        ZConsultaPDV.Open;
        if ZConsultaPDV.IsEmpty then
        begin
          Application.Title := 'Incluindo NCM => ' + ZconsultaServidor.fieldbyname('NCMICOD').AsString;
          lbStatus.Caption := Application.Title;
          ZConsultaPDV.append;
                {alimenta os campos no Pdv}
          ZConsultaPDV.fieldbyname('NCMICOD').AsString := ZconsultaServidor.fieldbyname('NCMICOD').AsString;
          ZConsultaPDV.fieldbyname('NCMA30CODIGO').AsString := ZconsultaServidor.fieldbyname('NCMA30CODIGO').AsString;
          try
            ZConsultaPDV.post;
          except
            ZConsultaPDV.cancel;
          end;
        end
        else
        begin
          if ZConsultaPDV.fieldbyname('NCMA30CODIGO').AsString <> ZconsultaServidor.fieldbyname('NCMA30CODIGO').AsString then
          begin
            Application.Title := 'Alterando NCM => ' + ZconsultaServidor.fieldbyname('NCMICOD').AsString;
            lbStatus.Caption := Application.Title;
            ZConsultaPDV.edit;
            ZConsultaPDV.fieldbyname('NCMA30CODIGO').AsString := ZconsultaServidor.fieldbyname('NCMA30CODIGO').AsString;
            try
              ZConsultaPDV.post;
            except
              ZConsultaPDV.cancel;
            end;
          end;
        end;

        ZconsultaServidor.Next;
      end;
    end;
    Application.Title := '';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
  except
    Application.Title := 'Falha ao Importar NCMs!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim NCMs}

  {Abre CESTs no servidor para achar os registros que serao importados!}
  try
    ZconsultaServidor.Close;
    ZconsultaServidor.sql.clear;
    ZconsultaServidor.sql.Text := 'Select TABCEST, NCMA30CODIGO, DESCRICAO from TABCEST';
    //ZconsultaServidor.RequestLive := False;
    ZconsultaServidor.open;
    if not ZconsultaServidor.IsEmpty then
    begin
      while not ZconsultaServidor.eof do
      begin
        Application.Title := 'Verificando Tab.CEST => ' + ZconsultaServidor.fieldbyname('TABCEST').AsString;
        lbStatus.Caption := Application.Title;
        lbStatus.Update;
        Application.ProcessMessages;
        ZConsultaPDV.close;
        ZConsultaPDV.SQL.clear;
        ZConsultaPDV.SQL.Text := 'Select TABCEST, NCMA30CODIGO, DESCRICAO from TABCEST where TABCEST=''' + ZconsultaServidor.fieldbyname('TABCEST').AsString + '''';
            //ZConsultaPDV.RequestLive := True;
        ZConsultaPDV.Open;
        if ZConsultaPDV.IsEmpty then
        begin
          Application.Title := 'Incluindo Tab.CEST => ' + ZconsultaServidor.fieldbyname('TABCEST').AsString;
          lbStatus.Caption := Application.Title;
          ZConsultaPDV.append;
                {alimenta os campos no Pdv}
          ZConsultaPDV.fieldbyname('TABCEST').AsString := ZconsultaServidor.fieldbyname('TABCEST').AsString;
          ZConsultaPDV.fieldbyname('NCMA30CODIGO').AsString := ZconsultaServidor.fieldbyname('NCMA30CODIGO').AsString;
          ZConsultaPDV.fieldbyname('DESCRICAO').AsString := ZconsultaServidor.fieldbyname('DESCRICAO').AsString;
          try
            ZConsultaPDV.post;
          except
            ZConsultaPDV.cancel;
          end;
        end
        else
        begin
          if ZConsultaPDV.fieldbyname('TABCEST').AsString <> ZconsultaServidor.fieldbyname('TABCEST').AsString then
          begin
            Application.Title := 'Alterando Tab.CEST => ' + ZconsultaServidor.fieldbyname('TABCEST').AsString;
            lbStatus.Caption := Application.Title;
            ZConsultaPDV.edit;
            ZConsultaPDV.fieldbyname('NCMA30CODIGO').AsString := ZconsultaServidor.fieldbyname('NCMA30CODIGO').AsString;
            ZConsultaPDV.fieldbyname('DESCRICAO').AsString := ZconsultaServidor.fieldbyname('DESCRICAO').AsString;
            try
              ZConsultaPDV.post;
            except
              ZConsultaPDV.cancel;
            end;
          end;
        end;

        ZconsultaServidor.Next;
      end;
    end;
    Application.Title := '';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
  except
    Application.Title := 'Falha ao Importar Tab.CEST!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim CESTs}

  {Derruba Conexao}
  Disconecta;

  Timer.Enabled := True;
end;

procedure TFormPrincipal.MnImportarTabelasConfiguracaoClick(
  Sender: TObject);
var i: integer;
var SalvarRegistro: Boolean;
begin
  {importar do Servidor se tiver online tabelas de configuracoes (numerarios, terminais, ecf, planos, usuarios, icm, etc )}

  {Abre Terminal no servidor para achar os registros que serao importados!}
  try
    ZconsultaServidor.Close;
    ZconsultaServidor.sql.clear;
    ZconsultaServidor.sql.Text := 'Select * from TERMINAL';
    ZconsultaServidor.open;
    if not ZconsultaServidor.IsEmpty then
    begin
      while not ZconsultaServidor.eof do
      begin
        Application.Title := 'Importando Terminais...';
        lbStatus.Caption := 'Importando Terminais...';
        lbStatus.Update;

        ZConsultaPDV.close;
        ZConsultaPDV.SQL.clear;
        ZConsultaPDV.SQL.Text := 'Select * from TERMINAL where termicod = ' + ZconsultaServidor.fieldbyname('termicod').AsString;
            //ZConsultaPDV.RequestLive := True;
        ZConsultaPDV.Open;
        SalvarRegistro := False;
        if ZConsultaPDV.IsEmpty then
        begin
          SalvarRegistro := True;
          ZConsultaPDV.append;
        end
        else
        begin
          if (ZconsultaServidor.findfield('REGISTRO').Value > ZconsultaPDV.findfield('REGISTRO').Value) then
          begin
            SalvarRegistro := True;
            ZConsultaPDV.edit;
          end
          else
            SalvarRegistro := False;
        end;

        if SalvarRegistro then
        begin
                {alimenta os campos no Pdv}
          for i := 0 to ZconsultaServidor.FieldCount - 1 do
            if (ZconsultaServidor.Fields[i].AsString <> '') then
              if (ZconsultaServidor.Fields[i].FieldName <> 'TERMCSTATUSCAIXA') and
                (ZconsultaServidor.Fields[i].FieldName <> 'TERMDSTATUSCAIXA') and
                (ZconsultaServidor.Fields[i].FieldName <> 'TERMA60NOMECOMPUT') then
              begin
                try ZConsultaPDV.FindField(ZConsultaServidor.Fields[i].FieldName).AsVariant := ZconsultaServidor.Fields[i].AsVariant; except Application.ProcessMessages; end;
              end;
          try
            ZConsultaPDV.post;
          except
            ZConsultaPDV.cancel;
            Application.ProcessMessages;
          end;
        end;
        ZconsultaServidor.Next;
      end;
    end;
    Application.Title := '';
    lbStatus.Caption := '';
    lbStatus.Update;
  except
    Application.Title := 'Falha ao Importar Terminais!';
    lbStatus.Caption := 'Falha ao Importar Terminais!';
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim terminal}

  {Abre ECF no servidor para achar os registros que serao importados!}
  try
    ZconsultaServidor.Close;
    ZconsultaServidor.sql.clear;
    ZconsultaServidor.sql.Text := 'Select * from ECF';
    ZconsultaServidor.open;
    if not ZconsultaServidor.IsEmpty then
    begin
      while not ZconsultaServidor.eof do
      begin
        Application.Title := 'Importando ECFs...';
        lbStatus.Caption := 'Importando ECFs...';
        lbStatus.Update;
        ZConsultaPDV.close;
        ZConsultaPDV.SQL.clear;
        ZConsultaPDV.SQL.Text := 'Select * from ECF where ECFA13ID=''' + ZconsultaServidor.fieldbyname('ECFA13ID').AsString + '''';
            //ZConsultaPDV.RequestLive := True;
        ZConsultaPDV.Open;
        SalvarRegistro := False;
        if ZConsultaPDV.IsEmpty then
        begin
          SalvarRegistro := True;
          ZConsultaPDV.append;
        end
        else
        begin
          if (ZconsultaServidor.findfield('REGISTRO').Value > ZconsultaPDV.findfield('REGISTRO').Value) then
          begin
            SalvarRegistro := True;
            ZConsultaPDV.edit;
          end
          else
            SalvarRegistro := False;
        end;

        if SalvarRegistro then
        begin
                {alimenta os campos no Pdv}
          for i := 0 to ZconsultaServidor.FieldCount - 1 do
            if ZconsultaServidor.Fields[i].AsString <> '' then
            begin
              try ZConsultaPDV.FindField(ZConsultaServidor.Fields[i].FieldName).AsVariant := ZconsultaServidor.Fields[i].AsVariant; except Application.ProcessMessages; end;
            end;
          try
            ZConsultaPDV.post;
          except
            ZConsultaPDV.cancel;
            Application.ProcessMessages;
          end;
        end;
        ZconsultaServidor.Next;
      end;
    end;
    Application.Title := '';
    lbStatus.Caption := '';
    lbStatus.Update;
  except
    Application.Title := 'Falha ao Importar ECFs!';
    lbStatus.Caption := 'Falha ao Importar ECFs...';
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim ECF}

  {Abre ECFALIQUOTAICMS no servidor para achar os registros que serao importados!}
  try
    ZconsultaServidor.Close;
    ZconsultaServidor.sql.clear;
    ZconsultaServidor.sql.Text := 'Select * from ECFALIQUOTAICMS';
    ZconsultaServidor.open;
    if not ZconsultaServidor.IsEmpty then
    begin
      while not ZconsultaServidor.eof do
      begin
        Application.Title := 'Importando ECFs/Aliquotas...';
        lbStatus.Caption := 'Importando ECFs/Aliquotas...';
        lbStatus.Update;
        ZConsultaPDV.close;
        ZConsultaPDV.SQL.clear;
        ZConsultaPDV.SQL.Text := 'Select * from ECFALIQUOTAICMS where ECFA13ID=''' + ZconsultaServidor.fieldbyname('ECFA13ID').AsString + ''' and ECALICOD=' + ZconsultaServidor.fieldbyname('ECALICOD').AsString;
            //ZConsultaPDV.RequestLive := True;
        ZConsultaPDV.Open;
        SalvarRegistro := False;
        if ZConsultaPDV.IsEmpty then
        begin
          SalvarRegistro := True;
          ZConsultaPDV.append;
        end
        else
        begin
          if (ZconsultaServidor.findfield('REGISTRO').Value > ZconsultaPDV.findfield('REGISTRO').Value) then
          begin
            SalvarRegistro := True;
            ZConsultaPDV.edit;
          end
          else
            SalvarRegistro := False;
        end;

        if SalvarRegistro then
        begin
                {alimenta os campos no Pdv}
          for i := 0 to ZconsultaServidor.FieldCount - 1 do
            if ZconsultaServidor.Fields[i].AsString <> '' then
            begin
              try ZConsultaPDV.FindField(ZConsultaServidor.Fields[i].FieldName).AsVariant := ZconsultaServidor.Fields[i].AsVariant; except Application.ProcessMessages; end;
            end;
          try
            ZConsultaPDV.post;
          except
            ZConsultaPDV.cancel;
            Application.ProcessMessages;
          end;
        end;

        ZconsultaServidor.Next;
      end;
    end;
    Application.Title := '';
    lbStatus.Caption := '';
    lbStatus.Update;
  except
    Application.Title := 'Falha ao Importar ECFs Aliq!';
    lbStatus.Caption := 'Falha ao Importar ECFs/Aliquotas...';
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim ECFALIQUOTAICMS}

  {Abre NUMERARIO no servidor para achar os registros que serao importados!}
  try
    ZconsultaServidor.Close;
    ZconsultaServidor.sql.clear;
    ZconsultaServidor.sql.Text := 'Select * from NUMERARIO';
    ZconsultaServidor.open;
    if not ZconsultaServidor.IsEmpty then
    begin
      while not ZconsultaServidor.eof do
      begin
        Application.Title := 'Importando Numerarios...';
        lbStatus.Caption := Application.Title;
        lbStatus.Update;
        ZConsultaPDV.close;
        ZConsultaPDV.SQL.clear;
        ZConsultaPDV.SQL.Text := 'Select * from NUMERARIO where NUMEICOD=' + ZconsultaServidor.fieldbyname('NUMEICOD').AsString;
            //ZConsultaPDV.RequestLive := True;
        ZConsultaPDV.Open;
        SalvarRegistro := False;
        if ZConsultaPDV.IsEmpty then
        begin
          SalvarRegistro := True;
          ZConsultaPDV.append;
        end
        else
        begin
          if (ZconsultaServidor.findfield('REGISTRO').Value > ZconsultaPDV.findfield('REGISTRO').Value) then
          begin
            SalvarRegistro := True;
            ZConsultaPDV.edit;
          end
          else
            SalvarRegistro := False;
        end;

        if SalvarRegistro then
        begin
                {alimenta os campos no Pdv}
          for i := 0 to ZconsultaServidor.FieldCount - 1 do
            if ZconsultaServidor.Fields[i].AsString <> '' then
            begin
              try ZConsultaPDV.FindField(ZConsultaServidor.Fields[i].FieldName).AsVariant := ZconsultaServidor.Fields[i].AsVariant; except Application.ProcessMessages; end;
            end;
          try
            ZConsultaPDV.post;
          except
            ZConsultaPDV.cancel;
            Application.ProcessMessages;
          end;
        end;
        ZconsultaServidor.Next;
      end;
    end;
    Application.Title := '';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
  except
    Application.Title := 'Falha ao Importar Numerarios!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim NUMERARIO}

  {Abre NUMERARIOTOTALIZADORECF no servidor para achar os registros que serao importados!}
  try
    ZconsultaServidor.Close;
    ZconsultaServidor.sql.clear;
    ZconsultaServidor.sql.Text := 'Select * from NUMERARIOTOTALIZADORECF';
    ZconsultaServidor.open;
    if not ZconsultaServidor.IsEmpty then
    begin
      while not ZconsultaServidor.eof do
      begin
        Application.Title := 'Importando Numerarios/Totalizadores...';
        lbStatus.Caption := Application.Title;
        lbStatus.Update;
        ZConsultaPDV.close;
        ZConsultaPDV.SQL.clear;
        ZConsultaPDV.SQL.Text := 'Select * from NUMERARIOTOTALIZADORECF where NUMEICOD=' + ZconsultaServidor.fieldbyname('NUMEICOD').AsString + ' and ECFA13ID=''' + ZconsultaServidor.fieldbyname('ECFA13ID').AsString + '''';
            //ZConsultaPDV.RequestLive := True;
        ZConsultaPDV.Open;
        SalvarRegistro := False;
        if ZConsultaPDV.IsEmpty then
        begin
          SalvarRegistro := True;
          ZConsultaPDV.append;
        end
        else
        begin
          if (ZconsultaServidor.findfield('REGISTRO').Value > ZconsultaPDV.findfield('REGISTRO').Value) then
          begin
            SalvarRegistro := True;
            ZConsultaPDV.edit;
          end
          else
            SalvarRegistro := False;
        end;

        if SalvarRegistro then
        begin
                {alimenta os campos no Pdv}
          for i := 0 to ZconsultaServidor.FieldCount - 1 do
            if ZconsultaServidor.Fields[i].AsString <> '' then
            begin
              try ZConsultaPDV.FindField(ZConsultaServidor.Fields[i].FieldName).AsVariant := ZconsultaServidor.Fields[i].AsVariant; except Application.ProcessMessages; end;
            end;
          try
            ZConsultaPDV.post;
          except
            ZConsultaPDV.cancel;
            Application.ProcessMessages;
          end;
        end;
        ZconsultaServidor.Next;
      end;
    end;
    Application.Title := '';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
  except
    Application.Title := 'Falha ao Importar Numerarios ECF!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim NUMERARIOTOTALIZADORECF}

  {Abre PROVEDORCARTAO no servidor para achar os registros que serao importados!}
  try
    ZconsultaServidor.Close;
    ZconsultaServidor.sql.clear;
    ZconsultaServidor.sql.Text := 'Select * from PROVEDORCARTAO';
    ZconsultaServidor.open;
    if not ZconsultaServidor.IsEmpty then
    begin
      while not ZconsultaServidor.eof do
      begin
        Application.Title := 'Importando PROVEDORCARTAO...';
        lbStatus.Caption := Application.Title;
        lbStatus.Update;
        ZConsultaPDV.close;
        ZConsultaPDV.SQL.clear;
        ZConsultaPDV.SQL.Text := 'Select * from PROVEDORCARTAO where PRCAA13ID=''' + ZconsultaServidor.fieldbyname('PRCAA13ID').AsString + '''';
            //ZConsultaPDV.RequestLive := True;
        ZConsultaPDV.Open;
        SalvarRegistro := False;
        if ZConsultaPDV.IsEmpty then
        begin
          SalvarRegistro := True;
          ZConsultaPDV.append;
        end
        else
        begin
          if (ZconsultaServidor.findfield('REGISTRO').Value > ZconsultaPDV.findfield('REGISTRO').Value) then
          begin
            SalvarRegistro := True;
            ZConsultaPDV.edit;
          end
          else
            SalvarRegistro := False;
        end;

        if SalvarRegistro then
        begin
                {alimenta os campos no Pdv}
          for i := 0 to ZconsultaServidor.FieldCount - 1 do
            if ZconsultaServidor.Fields[i].AsString <> '' then
            begin
              try ZConsultaPDV.FindField(ZConsultaServidor.Fields[i].FieldName).AsVariant := ZconsultaServidor.Fields[i].AsVariant; except Application.ProcessMessages; end;
            end;
          try
            ZConsultaPDV.post;
          except
            ZConsultaPDV.cancel;
            Application.ProcessMessages;
          end;
        end;
        ZconsultaServidor.Next;
      end;
    end;
    Application.Title := '';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
  except
    Application.Title := 'Falha ao Importar PROVEDORCARTAO!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim PROVEDORCARTAO}


  {Abre ICMS no servidor para achar os registros que serao importados!}
  try
    ZconsultaServidor.Close;
    ZconsultaServidor.sql.clear;
    ZconsultaServidor.sql.Text := 'Select * from ICMS';
    ZconsultaServidor.open;
    if not ZconsultaServidor.IsEmpty then
    begin
      while not ZconsultaServidor.eof do
      begin
        Application.Title := 'Importando ICMs...';
        lbStatus.Caption := Application.Title;
        lbStatus.Update;
        ZConsultaPDV.close;
        ZConsultaPDV.SQL.clear;
        ZConsultaPDV.SQL.Text := 'Select * from ICMS where ICMSICOD = ' + ZconsultaServidor.fieldbyname('ICMSICOD').AsString;
            //ZConsultaPDV.RequestLive := True;
        ZConsultaPDV.Open;
        SalvarRegistro := False;
        if ZConsultaPDV.IsEmpty then
        begin
          SalvarRegistro := True;
          ZConsultaPDV.append;
        end
        else
        begin
          if (ZconsultaServidor.findfield('REGISTRO').Value > ZconsultaPDV.findfield('REGISTRO').Value) then
          begin
            SalvarRegistro := True;
            ZConsultaPDV.edit;
          end
          else
            SalvarRegistro := False;
        end;

        if SalvarRegistro then
        begin
                {alimenta os campos no Pdv}
          for i := 0 to ZconsultaServidor.FieldCount - 1 do
            if ZconsultaServidor.Fields[i].AsString <> '' then
            begin
              try ZConsultaPDV.FindField(ZConsultaServidor.Fields[i].FieldName).AsVariant := ZconsultaServidor.Fields[i].AsVariant; except Application.ProcessMessages; end;
            end;
          try
            ZConsultaPDV.post;
          except
            ZConsultaPDV.cancel;
            Application.ProcessMessages;
          end;
        end;
        ZconsultaServidor.Next;
      end;
    end;
    Application.Title := '';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
  except
    Application.Title := 'Falha ao Importar Icms!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim ICMS}

  {Abre PLANORECEBIMENTO no servidor para achar os registros que serao importados!}
  try
    ZconsultaServidor.Close;
    ZconsultaServidor.sql.clear;
    ZconsultaServidor.sql.Text := 'Select * from PLANORECEBIMENTO';
    ZconsultaServidor.open;
    if not ZconsultaServidor.IsEmpty then
    begin
      while not ZconsultaServidor.eof do
      begin
        Application.Title := 'Importando Planos...';
        lbStatus.Caption := Application.Title;
        lbStatus.Update;
        ZConsultaPDV.close;
        ZConsultaPDV.SQL.clear;
        ZConsultaPDV.SQL.Text := 'Select * from PLANORECEBIMENTO where PLRCICOD=' + ZconsultaServidor.fieldbyname('PLRCICOD').AsString;
            //ZConsultaPDV.RequestLive := True;
        ZConsultaPDV.Open;
        SalvarRegistro := False;
        if ZConsultaPDV.IsEmpty then
        begin
          SalvarRegistro := True;
          ZConsultaPDV.append;
        end
        else
        begin
          if (ZconsultaServidor.findfield('REGISTRO').Value > ZconsultaPDV.findfield('REGISTRO').Value) then
          begin
            SalvarRegistro := True;
            ZConsultaPDV.edit;
          end
          else
            SalvarRegistro := False;
        end;

        if SalvarRegistro then
        begin
                {alimenta os campos no Pdv}
          for i := 0 to ZconsultaServidor.FieldCount - 1 do
            if ZconsultaServidor.Fields[i].AsString <> '' then
            begin
              try ZConsultaPDV.FindField(ZConsultaServidor.Fields[i].FieldName).AsVariant := ZconsultaServidor.Fields[i].AsVariant; except Application.ProcessMessages; end;
            end;
          try
            ZConsultaPDV.post;
          except
            ZConsultaPDV.cancel;
            Application.ProcessMessages;
          end;
        end;
        ZconsultaServidor.Next;
      end;
    end;
    Application.Title := '';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
  except
    Application.Title := 'Falha ao Importar Planos!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim PLANORECEBIMENTO}

  {Abre PLANORECEBIMENTOPARCELA no servidor para achar os registros que serao importados!}
  try
    ZconsultaServidor.Close;
    ZconsultaServidor.sql.clear;
    ZconsultaServidor.sql.Text := 'Select * from PLANORECEBIMENTOPARCELA';
    ZconsultaServidor.open;
    if not ZconsultaServidor.IsEmpty then
    begin
      while not ZconsultaServidor.eof do
      begin
        ZConsultaPDV.close;
        ZConsultaPDV.SQL.clear;
        ZConsultaPDV.SQL.Text := 'Select * from PLANORECEBIMENTOPARCELA where PLRCICOD=' + ZconsultaServidor.fieldbyname('PLRCICOD').AsString + ' and PLRPINROPARC=' + ZconsultaServidor.fieldbyname('PLRPINROPARC').AsString;
            //ZConsultaPDV.RequestLive := True;
        ZConsultaPDV.Open;
        SalvarRegistro := False;
        if ZConsultaPDV.IsEmpty then
        begin
          SalvarRegistro := True;
          ZConsultaPDV.append;
        end
        else
        begin
          if (ZconsultaServidor.findfield('REGISTRO').Value > ZconsultaPDV.findfield('REGISTRO').Value) then
          begin
            SalvarRegistro := True;
            ZConsultaPDV.edit;
          end
          else
            SalvarRegistro := False;
        end;

        if SalvarRegistro then
        begin
                {alimenta os campos no Pdv}
          for i := 0 to ZconsultaServidor.FieldCount - 1 do
            if ZconsultaServidor.Fields[i].AsString <> '' then
            begin
              try ZConsultaPDV.FindField(ZConsultaServidor.Fields[i].FieldName).AsVariant := ZconsultaServidor.Fields[i].AsVariant; except Application.ProcessMessages; end;
            end;
          try
            ZConsultaPDV.post;
          except
            ZConsultaPDV.cancel;
            Application.ProcessMessages;
          end;
        end;
        ZconsultaServidor.Next;
      end;
    end;
    Application.Title := '';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
  except
    Application.Title := 'Falha ao Importar Planos Parcelas!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim PLANORECEBIMENTOPARCELA}

  {Abre UNIDADE no servidor para achar os registros que serao importados!}
  try
    ZconsultaServidor.Close;
    ZconsultaServidor.sql.clear;
    ZconsultaServidor.sql.Text := 'Select * from UNIDADE';
    ZconsultaServidor.open;
    if not ZconsultaServidor.IsEmpty then
    begin
      while not ZconsultaServidor.eof do
      begin
        ZConsultaPDV.close;
        Application.Title := 'Importando Unidades...';
        lbStatus.Caption := Application.Title;
        lbStatus.Update;
        ZConsultaPDV.SQL.clear;
        ZConsultaPDV.SQL.Text := 'Select * from UNIDADE where UNIDICOD=' + ZconsultaServidor.fieldbyname('UNIDICOD').AsString;
            //ZConsultaPDV.RequestLive := True;
        ZConsultaPDV.Open;
        SalvarRegistro := False;
        if ZConsultaPDV.IsEmpty then
        begin
          SalvarRegistro := True;
          ZConsultaPDV.append;
        end
        else
        begin
          if (ZconsultaServidor.findfield('REGISTRO').Value > ZconsultaPDV.findfield('REGISTRO').Value) then
          begin
            SalvarRegistro := True;
            ZConsultaPDV.edit;
          end
          else
            SalvarRegistro := False;
        end;

        if SalvarRegistro then
        begin
                {alimenta os campos no Pdv}
          for i := 0 to ZconsultaServidor.FieldCount - 1 do
            if ZconsultaServidor.Fields[i].AsString <> '' then
            begin
              try ZConsultaPDV.FindField(ZConsultaServidor.Fields[i].FieldName).AsVariant := ZconsultaServidor.Fields[i].AsVariant; except Application.ProcessMessages; end;
            end;
          try
            ZConsultaPDV.post;
          except
            ZConsultaPDV.cancel;
            Application.ProcessMessages;
          end;
        end;
        ZconsultaServidor.Next;
      end;
    end;
    Application.Title := '';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
  except
    Application.Title := 'Falha ao Importar Unidades!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim UNIDADE}
end;

function TFormPrincipal.ApagaRegistrosExcluidosNoServidor: boolean;
begin
  {Apaga no banco local clientes excluidos no Servidor!}
  try
    Application.Title := 'Verificando Exclusoes de Clientes.';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    ZconsultaServidor.Close;
    ZconsultaServidor.sql.clear;
    ZconsultaServidor.sql.Text := 'Select * from ClientePDVs where TERMICOD=' + TerminalCodigoSTR + ' and EXCLUIR=''S'' ';
    //ZconsultaServidor.RequestLive := False;
    ZconsultaServidor.open;
    if not ZconsultaServidor.IsEmpty then
    begin
      while not ZconsultaServidor.eof do
      begin
        Application.Title := 'Excluindo Cliente => ' + ZconsultaServidor.fieldbyname('CLIEA13ID').AsString;
        lbStatus.Caption := Application.Title;
        lbStatus.Update;

            {apaga no banco local}
        ZupdatePDV.close;
        ZupdatePDV.sql.Clear;
        ZupdatePDV.sql.Text := 'delete from cliente where cliea13id=''' + ZconsultaServidor.fieldbyname('cliea13id').AsString + '''';
        ZupdatePDV.ExecSQL;

        ZapagaServidor.close;
        ZapagaServidor.sql.Clear;
        ZapagaServidor.sql.Text := 'delete from clientepdvs where termicod=' + TerminalCodigoSTR +
          ' and cliea13id=''' + ZconsultaServidor.fieldbyname('cliea13id').AsString + '''';
        ZapagaServidor.ExecSQL;

        ZconsultaServidor.Next;
      end;
    end;
    Application.Title := '';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
  except
    Application.Title := 'Falha ao Excluir Clientes!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim Cliente}

  {Apaga no banco local clientes produto pre�o excluidos no Servidor!}
  try
    Application.Title := 'Verificando Exclusoes de Clientes produto pre�o';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    ZconsultaServidor.Close;
    ZconsultaServidor.sql.clear;
    ZconsultaServidor.sql.Text := 'Select * from ClienteProdutoPrecoPDVs where TERMICOD=' + TerminalCodigoSTR + ' and EXCLUIR=''S'' ';
    //ZconsultaServidor.RequestLive := False;
    ZconsultaServidor.open;
    if not ZconsultaServidor.IsEmpty then
    begin
      while not ZconsultaServidor.eof do
      begin
        Application.Title := 'Excluindo Cliente => ' + ZconsultaServidor.fieldbyname('CLIEA13ID').AsString;
        lbStatus.Caption := Application.Title;
        lbStatus.Update;

            {apaga no banco local}
        ZupdatePDV.close;
        ZupdatePDV.sql.Clear;
        ZupdatePDV.sql.Text := 'delete from clienteprodutopreco where cliea13id=' + QuotedStr(ZconsultaServidor.fieldbyname('cliea13id').AsString) + ' and PRODICOD = ' + QuotedStr(ZconsultaServidor.fieldbyname('PRODICOD').AsString);
        ZupdatePDV.ExecSQL;

        ZapagaServidor.close;
        ZapagaServidor.sql.Clear;
        ZapagaServidor.sql.Text := 'delete from clienteprodutoprecopdvs where termicod=' + TerminalCodigoSTR +
          ' and cliea13id=' + QuotedStr(ZconsultaServidor.fieldbyname('cliea13id').AsString) +
          ' and prodicod=' + QuotedStr(ZconsultaServidor.fieldbyname('prodicod').AsString) ;
        ZapagaServidor.ExecSQL;

        ZconsultaServidor.Next;
      end;
    end;
    Application.Title := '';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
  except
    Application.Title := 'Falha ao Excluir Clientes produto pre�o!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim Cliente produto pre�o}

  {Apaga no banco local produtos excluidos no Servidor!}
  try
    Application.Title := 'Verificando Exclusoes de Produtos.';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    ZconsultaServidor.Close;
    ZconsultaServidor.sql.clear;
    ZconsultaServidor.sql.Text := 'Select * from ProdutoPDVs where TERMICOD=' + TerminalCodigoSTR + ' and EXCLUIR=''S'' ';
    //ZconsultaServidor.RequestLive := False;
    ZconsultaServidor.open;
    if not ZconsultaServidor.IsEmpty then
    begin
      while not ZconsultaServidor.eof do
      begin
        Application.Title := 'Excluindo Produto => ' + ZconsultaServidor.fieldbyname('PRODICOD').AsString;
        lbStatus.Caption := Application.Title;
        lbStatus.Update;

            {apaga no banco local}
        ZupdatePDV.close;
        ZupdatePDV.sql.Clear;
        ZupdatePDV.sql.Text := 'delete from PRODUTO where PRODICOD=' + ZconsultaServidor.fieldbyname('PRODICOD').AsString;
        ZupdatePDV.ExecSQL;

        ZapagaServidor.close;
        ZapagaServidor.sql.Clear;
        ZapagaServidor.sql.Text := 'delete from Produtopdvs where termicod=' + TerminalCodigoSTR +
          ' and prodicod=' + ZconsultaServidor.fieldbyname('prodicod').AsString;
        ZapagaServidor.ExecSQL;

        ZconsultaServidor.Next;
      end;
    end;
    Application.Title := '';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
  except
    Application.Title := 'Falha ao Excluir Produtos!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim produtos}

  {Apaga no banco local ProdutoBarras excluidos no Servidor!}
  try
    Application.Title := 'Verificando Exclusoes de Produtos Barras.';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    ZconsultaServidor.Close;
    ZconsultaServidor.sql.clear;
    ZconsultaServidor.sql.Text := 'Select * from ProdutoBarrasPDVs where TERMICOD=' + TerminalCodigoSTR + ' and EXCLUIR=''S'' ';
    //ZconsultaServidor.RequestLive := False;
    ZconsultaServidor.open;
    if not ZconsultaServidor.IsEmpty then
    begin
      while not ZconsultaServidor.eof do
      begin
        Application.Title := 'Excluindo ProdutoBarras => ' + ZconsultaServidor.fieldbyname('PRODICOD').AsString;
        lbStatus.Caption := Application.Title;
        lbStatus.Update;

            {apaga no banco local}
        ZupdatePDV.close;
        ZupdatePDV.sql.Clear;
        ZupdatePDV.sql.Text := 'delete from PRODUTOBARRAS where PRODICOD=' + ZconsultaServidor.fieldbyname('PRODICOD').AsString +
          ' and PRBAA15BARRAS=''' + ZconsultaServidor.fieldbyname('PRBAA15BARRAS').AsString + '''';
        ZupdatePDV.ExecSQL;

        ZapagaServidor.close;
        ZapagaServidor.sql.Clear;
        ZapagaServidor.sql.Text := 'delete from ProdutoBarraspdvs where termicod=' + TerminalCodigoSTR +
          ' and prodicod=' + ZconsultaServidor.fieldbyname('prodicod').AsString +
          ' and PRBAA15BARRAS=''' + ZconsultaServidor.fieldbyname('PRBAA15BARRAS').AsString + '''';
        ZapagaServidor.ExecSQL;

        ZconsultaServidor.Next;
      end;
    end;
    Application.Title := '';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
  except
    Application.Title := 'Falha ao Excluir ProdutoBarras!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim produtoBarras}

  {Apaga no banco local TABELAPRECOPRODUTOPDVS excluidos no Servidor!}
  try
    Application.Title := 'Verificando Exclusoes de Tabela Precos Especiais.';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    ZconsultaServidor.Close;
    ZconsultaServidor.sql.clear;
    ZconsultaServidor.sql.Text := 'Select * from TABELAPRECOPRODUTOPDVs where TERMICOD=' + TerminalCodigoSTR + ' and EXCLUIR=''S'' ';
    //ZconsultaServidor.RequestLive := False;
    ZconsultaServidor.open;
    if not ZconsultaServidor.IsEmpty then
    begin
      while not ZconsultaServidor.eof do
      begin
        Application.Title := 'Excluindo Tab.Precos Especiais => ' + ZconsultaServidor.fieldbyname('PRODICOD').AsString;
        lbStatus.Caption := Application.Title;
        lbStatus.Update;

            {apaga no banco local}
        ZupdatePDV.close;
        ZupdatePDV.sql.Clear;
        ZupdatePDV.sql.Text := 'delete from TABELAPRECOPRODUTO where PRODICOD=' + ZconsultaServidor.fieldbyname('PRODICOD').AsString;
        ZupdatePDV.ExecSQL;

        ZapagaServidor.close;
        ZapagaServidor.sql.Clear;
        ZapagaServidor.sql.Text := 'delete from TABELAPRECOPRODUTOPDVs where ' +
          ' TERMICOD=' + TerminalCodigoSTR +
          ' and TPRCICOD=' + ZconsultaServidor.fieldbyname('TPRCICOD').AsString +
          ' and PRODICOD=' + ZconsultaServidor.fieldbyname('PRODICOD').AsString;
        ZapagaServidor.ExecSQL;

        ZconsultaServidor.Next;
      end;
    end;
    Application.Title := '';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
  except
    Application.Title := 'Falha ao Excluir TABELAPRECOPRODUTOPDVs!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim TABELAPRECOPRODUTOPDVS}

end;


procedure TFormPrincipal.ImportarNCMs1Click(Sender: TObject);
var i: integer;
begin
  if lbstatus.caption <> 'Aguardando Proximo Ciclo' then
  begin
    showmessage('Integrador trabalhando! Espere at� o termino do processo para executar essa rotina!');
    exit;
  end;

  Timer.Enabled := False;

  if not Conecta then
    exit;

  {apaga no banco local}
  ZupdatePDV.close;
  ZupdatePDV.sql.Clear;
  ZupdatePDV.sql.Text := 'delete from ncm';
  ZupdatePDV.ExecSQL;

  {Abre NCMs no servidor para achar os registros que serao importados!}
  try
    ZconsultaServidor.Close;
    ZconsultaServidor.sql.clear;
    ZconsultaServidor.sql.Text := 'Select NCMICOD, NCMA30CODIGO from NCM';
    //ZconsultaServidor.RequestLive := False;
    ZconsultaServidor.open;
    if not ZconsultaServidor.IsEmpty then
    begin
      while not ZconsultaServidor.eof do
      begin
        Application.Title := 'Verificando NCM => ' + ZconsultaServidor.fieldbyname('NCMICOD').AsString;
        lbStatus.Caption := Application.Title;
        lbStatus.Update;
        Application.ProcessMessages;
        ZConsultaPDV.close;
        ZConsultaPDV.SQL.clear;
        ZConsultaPDV.SQL.Text := 'Select NCMICOD, NCMA30CODIGO from NCM where NCMICOD=' + ZconsultaServidor.fieldbyname('NCMICOD').AsString;
            //ZConsultaPDV.RequestLive := True;
        ZConsultaPDV.Open;
        if ZConsultaPDV.IsEmpty then
        begin
          Application.Title := 'Incluindo NCM => ' + ZconsultaServidor.fieldbyname('NCMICOD').AsString;
          lbStatus.Caption := Application.Title;
          ZConsultaPDV.append;
                {alimenta os campos no Pdv}
          ZConsultaPDV.fieldbyname('NCMICOD').AsString := ZconsultaServidor.fieldbyname('NCMICOD').AsString;
          ZConsultaPDV.fieldbyname('NCMA30CODIGO').AsString := ZconsultaServidor.fieldbyname('NCMA30CODIGO').AsString;
          try
            ZConsultaPDV.post;
          except
            ZConsultaPDV.cancel;
          end;
        end
        else
        begin
          if ZConsultaPDV.fieldbyname('NCMA30CODIGO').AsString <> ZconsultaServidor.fieldbyname('NCMA30CODIGO').AsString then
          begin
            Application.Title := 'Alterando NCM => ' + ZconsultaServidor.fieldbyname('NCMICOD').AsString;
            lbStatus.Caption := Application.Title;
            ZConsultaPDV.edit;
            ZConsultaPDV.fieldbyname('NCMA30CODIGO').AsString := ZconsultaServidor.fieldbyname('NCMA30CODIGO').AsString;
            try
              ZConsultaPDV.post;
            except
              ZConsultaPDV.cancel;
            end;
          end;
        end;

        ZconsultaServidor.Next;
      end;
    end;
    Application.Title := '';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
  except
    Application.Title := 'Falha ao Importar NCMs!';
    lbStatus.Caption := Application.Title;
    lbStatus.Update;
    Application.ProcessMessages;
  end;
  {Fim NCMs}

end;

procedure TFormPrincipal.AtualizaSaldoContaCorrente(ContaCorrente: Integer;
  ValorDebito, ValorCredito: Double);
var
  SaldoAtual, NovoSaldo : Double;
begin
  SaldoAtual := 0;
  NovoSaldo  := 0;
  zAtualizaContaCorrente.SQL.Clear;
  zAtualizaContaCorrente.SQL.Add('SELECT CTCRN2SALDOATUAL FROM CONTACORRENTE where CTCRICOD = '+ IntToStr(ContaCorrente));
  zAtualizaContaCorrente.Open;
  if not zAtualizaContaCorrente.IsEmpty then
    begin
      SaldoAtual := zAtualizaContaCorrente.fieldbyname('CTCRN2SALDOATUAL').AsFloat;
      if ValorDebito > 0 then
        begin
          NovoSaldo := SaldoAtual - ValorDebito;
          zAtualizaContaCorrente.Close;
          zAtualizaContaCorrente.SQL.Clear;
          zAtualizaContaCorrente.SQL.Add('UPDATE CONTACORRENTE SET CTCRN2SALDOATUAL = ' + ConvFloatToStr(NovoSaldo) + ' , CTCRDULTALTSALDO = ''' + FormatDateTime('mm/dd/yyyy',Now) + ''' , Pendente=''S''');
          zAtualizaContaCorrente.SQL.Add('WHERE CTCRICOD = ' + IntToStr(ContaCorrente));
          zAtualizaContaCorrente.ExecSQL;
        end
      else
        begin
          NovoSaldo := SaldoAtual + ValorCredito;
          zAtualizaContaCorrente.Close;
          zAtualizaContaCorrente.SQL.Clear;
          zAtualizaContaCorrente.SQL.Add('UPDATE CONTACORRENTE SET CTCRN2SALDOATUAL = ' + ConvFloatToStr(NovoSaldo) + ' , CTCRDULTALTSALDO = ''' + FormatDateTime('mm/dd/yyyy',Now) + ''', Pendente=''S''');
          zAtualizaContaCorrente.SQL.Add('WHERE CTCRICOD = ' + IntToStr(ContaCorrente));
          zAtualizaContaCorrente.ExecSQL;
        end;
    end;
end;

function TFormPrincipal.ConvFloatToStr(Numero: Double): string;
var
  Wstr : String;
begin
  ConvFloatToStr := '0.00' ;
  if Numero <> null then
  begin
    Wstr := FloatToStr(Numero) ;
    ConvFloatToStr := Wstr ;
    if Pos(',', Wstr) > 0 then
      ConvFloatToStr := Copy(Wstr, 1, Pos(',', Wstr)-1) + '.' + Copy(Wstr, Pos(',', Wstr)+1, 3)
  end
  else ConvFloatToStr := '0.00' ;
end;

end.

