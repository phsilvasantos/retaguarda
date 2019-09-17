unit RelatorioNotaServicoEmitida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RelatorioTemplate, AdvOfficeStatusBar,
  AdvOfficeStatusBarStylers, DBTables, Placemnt, DB, StdCtrls, Mask,
  ToolEdit, RxLookup, Buttons, ExtCtrls, ComCtrls, RxQuery, UCrpe32;

type
  TFormRelatorioNotaServicoEmitidas = class(TFormRelatorioTEMPLATE)
    SQLNotaServico: TRxQuery;
    DSSQLOperEstoque: TDataSource;
    SQLNotaServicoID: TIntegerField;
    SQLNotaServicoNUMERO_NOTA: TIntegerField;
    SQLNotaServicoNUMERO_RPS: TStringField;
    SQLNotaServicoDATA_EMISSAO: TDateTimeField;
    SQLNotaServicoSTATUS: TStringField;
    SQLNotaServicoID_SERVICO: TIntegerField;
    SQLNotaServicoVALOR_SERVICO: TFloatField;
    SQLNotaServicoVALOR_DEDUCAO: TFloatField;
    SQLNotaServicoALIQUOTA_ISS: TFloatField;
    SQLNotaServicoVALOR_ISS: TFloatField;
    SQLNotaServicoVALOR_PIS: TFloatField;
    SQLNotaServicoVALOR_COFINS: TFloatField;
    SQLNotaServicoVALOR_INSS: TFloatField;
    SQLNotaServicoVALOR_IRPJ: TFloatField;
    SQLNotaServicoVALOR_TOTAL: TFloatField;
    SQLNotaServicoVALOR_DESCONTO: TFloatField;
    SQLNotaServicoVALOR_FRETE: TFloatField;
    SQLNotaServicoCLIEA60RAZAOSOC: TStringField;
    SQLNotaServicoNOME_SERVICO: TStringField;
    RadioOrder: TRadioGroup;
    GroupFiltro: TGroupBox;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ComboTipoServico: TRxDBLookupCombo;
    ComboCliente: TRxDBLookupCombo;
    ComboStatus: TComboBox;
    GroupBox5: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    EditNroInicial: TEdit;
    EditNroFinal: TEdit;
    DSSQLCliente: TDataSource;
    SQLCliente: TRxQuery;
    SQLTipoServico: TRxQuery;
    DSSQLTipoServico: TDataSource;
    SQLTipoServicoID_SERVICO: TIntegerField;
    SQLTipoServicoNOME_SERVICO: TStringField;
    TblTemporariaID: TIntegerField;
    TblTemporariaNUMERO_NOTA: TIntegerField;
    TblTemporariaNUMERO_RPS: TStringField;
    TblTemporariaDATA_EMISSAO: TDateField;
    TblTemporariaSTATUS: TStringField;
    TblTemporariaID_SERVICO: TIntegerField;
    TblTemporariaVALOR_SERVICO: TFloatField;
    TblTemporariaVALOR_DEDUCAO: TFloatField;
    TblTemporariaALIQUOTA_ISS: TFloatField;
    TblTemporariaVALOR_ISS: TFloatField;
    TblTemporariaVALOR_PIS: TFloatField;
    TblTemporariaVALOR_COFINS: TFloatField;
    TblTemporariaVALOR_INSS: TFloatField;
    TblTemporariaVALOR_IRPJ: TFloatField;
    TblTemporariaVALOR_TOTAL: TFloatField;
    TblTemporariaVALOR_DESCONTO: TFloatField;
    TblTemporariaVALOR_FRETE: TFloatField;
    TblTemporariaCLIEA60RAZAOSOC: TStringField;
    TblTemporariaNOME_SERVICO: TStringField;
    Report: TCrpe;
    SQLNotaServicoEMPRICOD: TIntegerField;
    TblTemporariaEMPRICOD: TIntegerField;
    procedure ExecutarBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRelatorioNotaServicoEmitidas: TFormRelatorioNotaServicoEmitidas;

implementation

uses DataModulo;

{$R *.dfm}

procedure TFormRelatorioNotaServicoEmitidas.ExecutarBtnClick(
  Sender: TObject);
var
  i : Integer;
begin
  inherited;
  SQLNotaServico.Close;

  SQLNotaServico.MacrobyName('Empresa').Value := SQLDeLista(ComboEmpresa, ListaEmpresas,'','NotaServico','') ;

  SQLNotaServico.MacroByName('CampoData').Value   := 'NFS.DATA_EMISSAO';
  SQLNotaServico.MacroByName('DataInicial').Value := ' "' + FormatDateTime('mm/dd/yyyy',De.Date)  + '" ';
  SQLNotaServico.MacroByName('DataFinal').Value   := ' "' + FormatDateTime('mm/dd/yyyy',Ate.Date) + '" ';

  SQLNotaServico.MacroByName('Status').Value := '0=0';
  Case ComboStatus.ItemIndex of
    0 : SQLNotaServico.MacroByName('Status').Value := 'NFS.STATUS = "A"';
    1 : SQLNotaServico.MacroByName('Status').Value := 'NFS.STATUS = "E"';
    2 : SQLNotaServico.MacroByName('Status').Value := 'NFS.STATUS = "C"';
  end;

  if (ComboTipoServico.KeyValue <> null) and (ComboTipoServico.KeyValue > 0) then
    SQLNotaServico.MacroByName('SERVICO').Value := 'NFS.ID_SERVICO = ' + IntToStr(ComboTipoServico.KeyValue)
  else
    SQLNotaServico.MacroByName('SERVICO').Value := '0=0';

  if (ComboCliente.KeyValue <> null) and (ComboCliente.KeyValue > 0) then
    SQLNotaServico.MacroByName('Cliente').Value := 'NFS.CLIEA13ID = "' + ComboCliente.KeyValue + '"'
  else
    SQLNotaServico.MacroByName('Cliente').Value := '0=0';

  if EditNroInicial.Text <> '' then
    SQLNotaServico.MacroByName('NROInicial').Value := 'NFS.NUMERO_NOTA >= '+ EditNroInicial.Text;

  if EditNroFinal.Text <> '' then
    SQLNotaServico.MacroByName('NROFinal').Value   := 'NFS.NUMERO_NOTA <= '+ EditNroFinal.Text;

   Case RadioOrder.ItemIndex of
     0 : SQLNotaServico.MacroByName('MOrdem').Value := 'C.CLIEA60RAZAOSOC';
     1 : SQLNotaServico.MacroByName('MOrdem').Value := 'NFS.DATA_EMISSAO';
     2 : SQLNotaServico.MacroByName('MOrdem').Value := 'NFS.NUMERO_NOTA';
   end;

  SQLNotaServico.Open;
  if not TblTemporaria.Active then
    TblTemporaria.Open;

  SQLNotaServico.First ;

  while not SQLNotaServico.Eof do
    begin
      TblTemporaria.Append ;
      for i := 0 to SQLNotaServico.FieldCount-1 do
        if SQLNotaServico.Fields[i].AsString <> '' then
          TblTemporaria.FieldByName(SQLNotaServico.Fields[i].FieldName).AsVariant := SQLNotaServico.Fields[i].AsVariant ;
      TblTemporaria.Post ;
      SQLNotaServico.Next ;
    end ;

   TblTemporaria.First ;

   Report.ReportName := DM.SQLConfigGeralCFGEA255PATHREPORT.Value + '\Listagem de Notas Serviço Emitidas.rpt' ;
   Report.Formulas.Retrieve;
   Report.Formulas.Name := 'Emissao';
   Report.Formulas.Formula.Text := '"' + FormatDateTime('dd/mm/yyyy hh:mm:ss',Now) + '"';
   Report.Formulas.Name := 'PeriodoEmissao';
   Report.Formulas.Formula.Text := '"' + De.Text + ' até ' + Ate.Text + '"';
   Report.Formulas.Name := 'StatusFiltro';
   Report.Formulas.Formula.Text := '"' + ComboStatus.Text + '"';
   if (ComboTipoServico.KeyValue <> null) and (ComboTipoServico.KeyValue > 0) then
     begin
       Report.Formulas.Name := 'TipoServico';
       Report.Formulas.Formula.Text := '"' + ComboTipoServico.DisplayValue + '"';
     End;
   if (ComboCliente.KeyValue <> null) and (ComboCliente.KeyValue > 0) then
     begin
       Report.Formulas.Name := 'Cliente';
       Report.Formulas.Formula.Text := '"' + ComboCliente.DisplayValue + '"';
     end;
   Report.Formulas.Name := 'Ordem';
   Case RadioOrder.ItemIndex of
     0 : Report.Formulas.Formula.Text := '"' + 'Cliente' + '"';
     1 : Report.Formulas.Formula.Text := '"' + 'Data de Emissão' + '"';
     2 : Report.Formulas.Formula.Text := '"' + 'Nro Nota Serviço' + '"';
   end;
   Report.Formulas.Send;
   Report.ReportTitle       := 'Relatório de Notas Serviço Emitidas' ;
   Report.WindowStyle.Title := 'Relatório de Notas Serviço Emitidas' ;
   Report.Execute;
end;

procedure TFormRelatorioNotaServicoEmitidas.FormShow(Sender: TObject);
begin
  inherited;
  SQLTipoServico.Close;
  SQLTipoServico.Open;
  SQLCliente.Close;
  SQLCliente.Open;
end;

end.
