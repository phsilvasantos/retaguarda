unit RelatorioRepresentanteNSerie;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RelatorioTemplate, AdvOfficeStatusBar,
  AdvOfficeStatusBarStylers, DBTables, Placemnt, DB, StdCtrls, Mask,
  ToolEdit, RxLookup, Buttons, ExtCtrls, ComCtrls, RxQuery, UnitLibrary,
  UCrpe32;

type
  TFormRelatorioRepresentanteNSerie = class(TFormRelatorioTEMPLATE)
    SQLRepresNSerie: TRxQuery;
    GroupBox4: TGroupBox;
    ComboRepresentante: TRxDBLookupCombo;
    GroupProduto: TGroupBox;
    ComboProduto: TRxDBLookupCombo;
    DSSQLProduto: TDataSource;
    SQLProduto: TRxQuery;
    SQLRepresentante: TRxQuery;
    DSSQLRepresentante: TDataSource;
    SQLRepresentanteREPRICOD: TIntegerField;
    SQLRepresentanteREPRA60RAZAOSOC: TStringField;
    SQLRepresentanteREPRA60NOMEFANT: TStringField;
    TblTemporariaREPRICOD: TIntegerField;
    TblTemporariaREPRA60RAZAOSOC: TStringField;
    TblTemporariaPRODICOD: TIntegerField;
    TblTemporariaPRODA60DESCR: TStringField;
    TblTemporariaPRSEA60NROSERIE: TStringField;
    TblTemporariaDATA_REGISTRO: TDateField;
    SQLRepresNSerieREPRICOD: TIntegerField;
    SQLRepresNSerieREPRA60RAZAOSOC: TStringField;
    SQLRepresNSeriePRODICOD: TIntegerField;
    SQLRepresNSeriePRODA60DESCR: TStringField;
    SQLRepresNSeriePRSEA60NROSERIE: TStringField;
    SQLRepresNSerieDATA_REGISTRO: TDateTimeField;
    Report: TCrpe;
    procedure FormCreate(Sender: TObject);
    procedure ExecutarBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRelatorioRepresentanteNSerie: TFormRelatorioRepresentanteNSerie;

implementation

uses DataModulo;

{$R *.dfm}

procedure TFormRelatorioRepresentanteNSerie.FormCreate(Sender: TObject);
begin
  inherited;
  SQLRepresentante.Open;
  SQLProduto.Open;
end;

procedure TFormRelatorioRepresentanteNSerie.ExecutarBtnClick(
  Sender: TObject);
begin
  inherited;
  SQLRepresNSerie.Close ;
  SQLRepresNSerie.MacrobyName('MEmpresa').Value := SQLDeLista(ComboEmpresa, ListaEmpresas, ' ', 'PR', 'EMPRICOD');
  SQLRepresNSerie.MacroByName('MData').Value := 'PR.DATA_REGISTRO >= ' + '"' + FormatDateTime('mm/dd/yyyy', De.Date) + '"' + ' AND ' + 'PR.DATA_REGISTRO <= ' + '"' + FormatDateTime('mm/dd/yyyy', Ate.Date) + '"';
  if ComboRepresentante.Text <> '' then
    SQLRepresNSerie.MacroByName('MRepresentante').Value := ' PR.REPRICOD = ' + ComboRepresentante.Value;
  if ComboProduto.Text <> '' then
    SQLRepresNSerie.MacroByName('MProduto').Value := ' PR.PRODICOD = ' + ComboProduto.Value;
  SQLRepresNSerie.Open;
  if SQLRepresNSerie.IsEmpty then
    begin
      Showmessage('Não existem dados para ser impressos!');
      Exit;
    end;

  SQLRepresNSerie.Last;
  SQLRepresNSerie.First;
  Progresso.Min := 0;
  Progresso.Max := SQLRepresNSerie.RecordCount;
  Progresso.Position := 0;

  try
    TblTemporaria.Close;
    TblTemporaria.DeleteTable;
    TblTemporaria.CreateTable;
  except
    TblTemporaria.CreateTable;
  end;

  TblTemporaria.Open ;
  SQLRepresNSerie.First ;
  CopyQueryTable(SQLRepresNSerie, TblTemporaria);

  Report.ReportName := DM.SQLConfigGeralCFGEA255PATHREPORT.Value + '\Representante NumSerie.rpt';
  Report.ReportTitle := 'Relatório Representante por Número Série';
  Report.WindowStyle.Title := 'Relatório Representante por Número Série';
      //SETAR FORMULAS NO RPT
  Report.Formulas.Retrieve;
      //--------------------------------------------------------------------------\\
  Report.Formulas.Name := 'Emissao';
  Report.Formulas.Formula.Text := '"' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + '"';
  Report.Formulas.Name := 'Periodo';
  Report.Formulas.Formula.Text := '"' + 'De' + FormatDateTime('dd/mm/yyyy', De.Date) + ' Até ' + FormatDateTime('dd/mm/yyyy', Ate.Date) + '"';
  Report.Formulas.Name := 'Empresa';
  Report.Formulas.Formula.Text := '"' + ComboEmpresa.Text + '"';
      //--------------------------------------------------------------------------\\
  Report.Execute;

end;

end.
