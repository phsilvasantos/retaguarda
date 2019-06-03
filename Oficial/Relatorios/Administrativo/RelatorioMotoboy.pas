unit RelatorioMotoboy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RelatorioTemplate, AdvOfficeStatusBar,
  AdvOfficeStatusBarStylers, DBTables, Placemnt, DB, StdCtrls, Mask,
  ToolEdit, RxLookup, Buttons, ExtCtrls, ComCtrls, RxQuery, UCrpe32;

type
  TFormRelatorioMotoboy = class(TFormRelatorioTEMPLATE)
    GroupBox3: TGroupBox;
    ComboMotoboy: TRxDBLookupCombo;
    SQLMotoboy: TQuery;
    GroupBox2: TGroupBox;
    ComboCidade: TRxDBLookupCombo;
    SQLCidade: TRxQuery;
    DSSQLCidade: TDataSource;
    SQLMotoboyMTBYICOD: TIntegerField;
    SQLMotoboyMTBYA30DESCR: TStringField;
    DSSQLMotoboy: TDataSource;
    SQLCidadeID: TStringField;
    SQLCidadeNOME: TStringField;
    SQLCidadeSIGLA: TStringField;
    SQLVendas: TRxQuery;
    SQLVendasCLIEA60RAZAOSOC: TStringField;
    SQLVendasMTBYA30DESCR: TStringField;
    SQLVendasCUPODEMIS: TDateTimeField;
    SQLVendasVALOR_TOTAL: TFloatField;
    SQLVendasCLIEA60CIDRES: TStringField;
    SQLVendasCLIEA60BAIRES: TStringField;
    Report: TCrpe;
    TblTemporariaCLIEA60RAZAOSOC: TStringField;
    TblTemporariaMTBYA30DESCR: TStringField;
    TblTemporariaCUPODEMIS: TDateField;
    TblTemporariaVALOR_TOTAL: TFloatField;
    TblTemporariaCLIEA60CIDRES: TStringField;
    TblTemporariaCLIEA60BAIRES: TStringField;
    procedure ExecutarBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRelatorioMotoboy: TFormRelatorioMotoboy;

implementation

uses
  UnitLibrary, DataModulo;

{$R *.dfm}

procedure TFormRelatorioMotoboy.ExecutarBtnClick(Sender: TObject);
var
  i : integer;
begin
  inherited;
  SQLVendas.Close;
  SQLVendas.MacrobyName('MEmpresa').Value := SQLDeLista(ComboEmpresa, ListaEmpresas,'','CF','');

  SQLVendas.MacroByName('MDATA').AsString       := 'CF.CUPODEMIS >= ''' + FormatDateTime('mm/dd/yyyy', De.Date)  + ''' and ' +
                                                   'CF.CUPODEMIS <= ''' + FormatDateTime('mm/dd/yyyy', Ate.Date) + '''';
  if (ComboMotoboy.KeyValue <> null) and (ComboMotoboy.KeyValue > 0) then
    SQLVendas.MacroByName('MMotoboy').Value := 'CF.MTBYICOD = ' + IntToStr(ComboMotoboy.KeyValue)
  else
    SQLVendas.MacroByName('MMotoboy').Value := '0=0';

  if (ComboCidade.KeyValue <> null) and (ComboCidade.KeyValue > 0) then
    SQLVendas.MacroByName('MCidade').Value := 'CL.CLIEA60CIDRES = ' + QuotedStr(SQLCidadeNOME.AsString)
  else
    SQLVendas.MacroByName('MCidade').Value := '0=0';
  SQLVendas.Open;

  if SQLVendas.IsEmpty then
    begin
      Showmessage('Não existem dados para ser impressos!');
      Exit;
    end;

  TblTemporaria.Close;
  try
    TblTemporaria.DeleteTable;
    TblTemporaria.CreateTable;
  except
    TblTemporaria.CreateTable;
  end;
  TblTemporaria.Open;

  SQLVendas.First ;
  while not SQLVendas.Eof do
    begin
      TblTemporaria.Append ;

      for i := 0 to SQLVendas.FieldCount-1 do
        if SQLVendas.Fields[i].AsString <> '' then
          TblTemporaria.FieldByName(SQLVendas.Fields[i].FieldName).AsVariant := SQLVendas.Fields[i].AsVariant ;
      TblTemporaria.Post ;
      SQLVendas.Next ;
    end ;
  Report.ReportName        := DM.SQLConfigGeralCFGEA255PATHREPORT.Value + '\Entregas Motoboy.rpt' ;
  Report.ReportTitle       := 'Relatorio de Entregas Motoboy';
  Report.WindowStyle.Title := 'Relatorio de Entregas Motoboy';
  Report.Formulas.Retrieve;
  //--------------------------------------------------------------------------\\
  Report.Formulas.Name         := 'Emissao' ;
  Report.Formulas.Formula.Text := '''' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + '''' ;
  //--------------------------------------------------------------------------\\
  Report.Formulas.Name         := 'PeriodoEmissao' ;
  Report.Formulas.Formula.Text := '''' + FormatDateTime('dd/mm/yyyy', De.Date) + ' até ' +
                                  FormatDateTime('dd/mm/yyyy', Ate.Date) + '''' ;
  Report.Execute;
end;

procedure TFormRelatorioMotoboy.FormCreate(Sender: TObject);
var
  Sigla : String;
begin
  inherited;
  if not SQLEmpresa.Active then SQLEmpresa.Open;
  if not SQLMotoboy.Active then SQLMotoboy.Open;
  if not SQLCidade.Active then
  begin
    Sigla := SQLLocate('EMPRESA','EMPRICOD','EMPRA2UF',EmpresaPadrao);
    if Sigla = '' then
      Sigla := 'RS';
    SQLCidade.MacroByName('MCidade').Value   := 'SIGLA = ' + QuotedStr(Sigla);
    SQLCidade.Open;
  end;
end;

end.
