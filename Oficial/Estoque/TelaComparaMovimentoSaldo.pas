unit TelaComparaMovimentoSaldo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TelaGeralTEMPLATE, AdvOfficeStatusBar, UnitLibrary,VarSYS,
  AdvOfficeStatusBarStylers, Buttons, StdCtrls, ExtCtrls, Grids, DBGrids,
  Mask, ToolEdit, DBTables, RxQuery, DB, DBCtrls, Menus;

type
  TFormTelaGeralComparaMovimentoSaldo = class(TFormTelaGeralTEMPLATE)
    BtnSelecionarDoc: TSpeedButton;
    BtnAtualizarSaldo: TSpeedButton;
    PanelTopBxDocREc: TPanel;
    CKAtivos: TCheckBox;
    DBGridLista: TDBGrid;
    TblMovimentoTemp: TTable;
    TblMovimentoTempCodigo: TIntegerField;
    TblMovimentoTempDescricao: TStringField;
    dsProdutosTemp: TDataSource;
    SQLMovimentoSaldo: TRxQuery;
    TblMovimentoTempSaldoMovimento: TFloatField;
    TblMovimentoTempSaldoProduto: TFloatField;
    TblMovimentoTempMarcar: TBooleanField;
    Label1: TLabel;
    CodProd: TEdit;
    BtnProduto: TSpeedButton;
    DescrProd: TLabel;
    ppmSelecionarTodos: TPopupMenu;
    Selecionartodosregistros1: TMenuItem;
    procedure BtnSelecionarDocClick(Sender: TObject);
    procedure CodProdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnProdutoClick(Sender: TObject);
    procedure DBGridListaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridListaColExit(Sender: TObject);
    procedure DBGridListaColEnter(Sender: TObject);
    procedure DBGridListaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGridListaCellClick(Column: TColumn);
    procedure BtnAtualizarSaldoClick(Sender: TObject);
    procedure Selecionartodosregistros1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    OriginalOptions : TDBGridOptions;
    Marcar : Boolean;
    procedure SaveBoolean(Grid : TDBGrid) ;

  public
    { Public declarations }
  end;

var
  FormTelaGeralComparaMovimentoSaldo: TFormTelaGeralComparaMovimentoSaldo;

implementation

uses Math, TelaConsultaProdutoGeral, DataModulo;

{$R *.dfm}

procedure TFormTelaGeralComparaMovimentoSaldo.BtnSelecionarDocClick(
  Sender: TObject);
begin
  inherited;
  try
    TblMovimentoTemp.Close;
    TblMovimentoTemp.DeleteTable;
    TblMovimentoTemp.CreateTable;
  except
    TblMovimentoTemp.CreateTable;
  end;

  TblMovimentoTemp.Open ;

  SQLMovimentoSaldo.Close ;
  SQLMovimentoSaldo.MacroByName('MAtivo').Value   := '0=0';
  SQLMovimentoSaldo.MacroByName('MEmpresa').Value := 'EMPRICOD = ' + dm.SQLEmpresaEMPRICOD.AsString ;
  if CodProd.Text <> EmptyStr then
    SQLMovimentoSaldo.MacroByName('MProduto').Value    := 'PRODICOD = "' + CodProd.Text + '"';

  if CKAtivos.Checked then
    SQLMovimentoSaldo.MacroByName('MAtivo').Value := 'PRODCATIVO = ''S''';

  SQLMovimentoSaldo.Open;

  SQLMovimentoSaldo.First;
  SQLMovimentoSaldo.DisableControls;
  try
    while not SQLMovimentoSaldo.EOF do
    begin
      TblMovimentoTemp.Append;
      TblMovimentoTempCodigo.Value         := SQLMovimentoSaldo.fieldbyname('PRODICOD').Value;
      TblMovimentoTempDescricao.Value      := SQLMovimentoSaldo.fieldbyname('PRODA60DESCR').Value;
      TblMovimentoTempSaldoMovimento.Value := SQLMovimentoSaldo.fieldbyname('SALDO_MOVIMENTO').Value;
      TblMovimentoTempSaldoProduto.Value   := SQLMovimentoSaldo.fieldbyname('SALDO_PRODUTO').Value;
      TblMovimentoTempMarcar.Value         := False;
      TblMovimentoTemp.Post;
      SQLMovimentoSaldo.Next;
      Application.ProcessMessages;
    end;
  finally
    SQLMovimentoSaldo.EnableControls;
  end;
  SQLMovimentoSaldo.Close;
  TblMovimentoTemp.Close;
  TblMovimentoTemp.Open;
end;

procedure TFormTelaGeralComparaMovimentoSaldo.CodProdKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
    BtnProduto.Click;
  if (Key = VK_Return) and (CodProd.Text <> '') then
  begin
    if SQLLocate('PRODUTO','PRODICOD','PRODA60DESCR', CodProd.Text) <> EmptyStr then
    begin
      DescrProd.Caption := SQLLocate('PRODUTO','PRODICOD','PRODA60DESCR', CodProd.Text);
      DescrProd.Update;
      DescrProd.Refresh;
    end
    else
    begin
      Informa('Produto não encontrado !');
      DescrProd.Caption := '';
      CodProd.SetFocus;
    end;
  end;
end;

procedure TFormTelaGeralComparaMovimentoSaldo.BtnProdutoClick(
  Sender: TObject);
begin
  inherited;
  CodProd.SetFocus;
  ProdutoReferencia := '';
  ProdutoDescricao := '';
  Application.CreateForm(TFormTelaConsultaProdutoGeral, FormTelaConsultaProdutoGeral);
  FormTelaConsultaProdutoGeral.ShowModal;
  if FormTelaConsultaProdutoGeral.ModalResult = 2 then
  begin
    CodProd.Text := ProdutoReferencia;
    ProdutoReferencia := '';
    ProdutoDescricao := '';
  end;

end;

procedure TFormTelaGeralComparaMovimentoSaldo.SaveBoolean(Grid: TDBGrid);
begin
  Grid.SelectedField.Dataset.Edit ;
  Grid.SelectedField.AsBoolean := not Grid.SelectedField.AsBoolean ;
  Grid.SelectedField.Dataset.Post ;
end;

procedure TFormTelaGeralComparaMovimentoSaldo.DBGridListaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ( Key = VK_SPACE ) and ( DBGridLista.SelectedField.DataType = ftBoolean ) then
    SaveBoolean(DBGridLista);
  if Key = VK_Return then
    if TblMovimentoTemp.State in DsEditModes then
      TblMovimentoTemp.Post;
end;

procedure TFormTelaGeralComparaMovimentoSaldo.DBGridListaColExit(
  Sender: TObject);
begin
  inherited;
  if DBGridLista.SelectedField.DataType = ftBoolean then
    DBGridLista.Options := OriginalOptions;
end;

procedure TFormTelaGeralComparaMovimentoSaldo.DBGridListaColEnter(
  Sender: TObject);
begin
  inherited;
  if DBGridLista.SelectedField.DataType = ftBoolean then
    begin
      OriginalOptions := DBGridLista.Options ;
      DBGridLista.Options := DBGridLista.Options - [dgEditing] ;
    end ;
end;

procedure TFormTelaGeralComparaMovimentoSaldo.DBGridListaDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Const
  CtrlState : array[Boolean] of Integer = (DFCS_BUTTONCHECK,
                                           DFCS_BUTTONCHECK or DFCS_CHECKED);
begin
  inherited;
  DBGridLista.DefaultDrawColumnCell(Rect, DataCol, Column, State);

  if Column.Field.DataType = ftBoolean then
    begin
      DBGridLista.Canvas.FillRect(Rect);
      DrawFrameControl(DBGridLista.Canvas.Handle,
                       Rect,
                       DFC_BUTTON,
                       CtrlState[Column.Field.AsBoolean]);
    end;
end;

procedure TFormTelaGeralComparaMovimentoSaldo.DBGridListaCellClick(
  Column: TColumn);
begin
  inherited;
  if DBGridLista.SelectedField.DataType = ftBoolean then
    SaveBoolean(DBGridLista) ;
end;

procedure TFormTelaGeralComparaMovimentoSaldo.BtnAtualizarSaldoClick(
  Sender: TObject);
var
  erro : Boolean;
begin
  inherited;
  TblMovimentoTemp.DisableControls;
  try
    TblMovimentoTemp.First;
    while not TblMovimentoTemp.EOF do
      begin
        if TblMovimentoTempMarcar.Value then
          begin
            try
              erro := False;
              dm.SQLTemplate.Close;
              DM.SQLTemplate.SQL.Clear;
              dm.SQLTemplate.sql.Text := 'update produtosaldo set PSLDN3QTDE = ''' + (TrocaVirgulaPorPonto(TblMovimentoTempSaldoMovimento.AsString)) + '''';
              dm.SQLTemplate.SQL.Text := dm.SQLTemplate.SQL.Text + ' where PRODICOD = ' + TblMovimentoTempCodigo.AsString;
              dm.SQLTemplate.SQL.Text := dm.SQLTemplate.SQL.Text + ' and EMPRICOD = ' + EmpresaPadrao;
              dm.SQLTemplate.Prepare;
              dm.SQLTemplate.ExecSQL;
              Application.ProcessMessages;
            except
              erro := True;
              Application.ProcessMessages;
            end;
          end;
        TblMovimentoTemp.Next;
      end;
    ShowMessage('Concluido com Sucesso!');

  finally
    TblMovimentoTemp.EnableControls;
  end;

  TblMovimentoTemp.First;
  while not TblMovimentoTemp.EOF do
  begin
    if TblMovimentoTempMarcar.Value then
    begin
      TblMovimentoTemp.Delete;
    end
    else
      TblMovimentoTemp.Next;
  end;
  TblMovimentoTemp.First;
  
end;

procedure TFormTelaGeralComparaMovimentoSaldo.Selecionartodosregistros1Click(
  Sender: TObject);
begin
  inherited;
  TblMovimentoTemp.First;
  TblMovimentoTemp.DisableControls;
  try
    while not TblMovimentoTemp.Eof do
    begin
      TblMovimentoTemp.Edit;
      TblMovimentoTempMarcar.AsBoolean := not TblMovimentoTempMarcar.AsBoolean;
      TblMovimentoTemp.Post;
      TblMovimentoTemp.Next;
    end;
    if not Marcar then
    begin
      Selecionartodosregistros1.Caption := 'Desmarcar todos';
      Marcar := True;
    end
    else
    begin
      Selecionartodosregistros1.Caption := 'Marcar todos';
      Marcar := False;
    end;

  finally
    TblMovimentoTemp.EnableControls;
  end;
end;

procedure TFormTelaGeralComparaMovimentoSaldo.FormShow(Sender: TObject);
begin
  inherited;
  Marcar := False;
end;

end.
