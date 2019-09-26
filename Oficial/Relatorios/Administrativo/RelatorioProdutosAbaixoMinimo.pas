unit RelatorioProdutosAbaixoMinimo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RelatorioTemplate, DBTables, Placemnt, DB, StdCtrls, Mask,
  ToolEdit, RxLookup, ExtCtrls, Buttons, jpeg, ComCtrls, ppDB, ppDBPipe,
  ppDBBDE, ppBands, ppClass, ppCtrls, ppVar, ppPrnabl, ppCache, ppComm,
  ppRelatv, ppProd, ppReport, RxQuery, ppViewr, AdvOfficeStatusBar,
  AdvOfficeStatusBarStylers;

type
  TFormRelatorioProdutosAbaixoMinimo = class(TFormRelatorioTEMPLATE)
    SQLProduto: TRxQuery;
    Report: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    NomeEmpresa: TppLabel;
    ppLabel11: TppLabel;
    ppLabel5: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText7: TppDBText;
    ppDBText1: TppDBText;
    ppCODPROD: TppDBText;
    ppFooterBand1: TppFooterBand;
    GroupCodDesc: TGroupBox;
    OrdemCodigo: TRadioButton;
    OrdemDescricao: TRadioButton;
    dsProduto: TDataSource;
    SQLProdutoPRODICOD: TIntegerField;
    SQLProdutoPRODA60DESCR: TStringField;
    SQLProdutoPRODN3VLRVENDA: TFloatField;
    SQLProdutoPRODN3VLRCOMPRA: TFloatField;
    SQLProdutoPRODN3VLRCUSTO: TFloatField;
    SQLProdutoUNIDA5DESCR: TStringField;
    SQLProdutoSALDOATUAL: TFloatField;
    SQLProdutoMINIMO: TFloatField;
    SQLProdutoMAXIMO: TFloatField;
    Pipe: TppBDEPipeline;
    GroupBox2: TGroupBox;
    ComboFornecedor: TRxDBLookupCombo;
    Label11: TLabel;
    ComboGrupo: TRxDBLookupCombo;
    Label5: TLabel;
    ComboMarca: TRxDBLookupCombo;
    SQLMarca: TRxQuery;
    SQLMarcaMARCICOD: TIntegerField;
    SQLMarcaMARCA60DESCR: TStringField;
    DSSQLMarca: TDataSource;
    SQLGrupo: TRxQuery;
    SQLGrupoGRUPICOD: TIntegerField;
    SQLGrupoGRUPA60DESCR: TStringField;
    DSSQLGrupo: TDataSource;
    SQLFornecedor: TRxQuery;
    DSSQLFornecedor: TDataSource;
    NomeGrupo: TppLabel;
    NomeMarca: TppLabel;
    NomeFornecedor: TppLabel;
    procedure ExecutarBtnClick(Sender: TObject);
    procedure ReportPreviewFormCreate(Sender: TObject);
    procedure ppHeaderBand1BeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRelatorioProdutosAbaixoMinimo: TFormRelatorioProdutosAbaixoMinimo;

implementation

{$R *.dfm}

procedure TFormRelatorioProdutosAbaixoMinimo.ExecutarBtnClick(
  Sender: TObject);
begin
  inherited;
  SQLProduto.Close;
  if ComboEmpresa.Value <> 'Todas' then
    SQLProduto.MacroByName('MEmpresa').Value := 'PRODUTOSALDO.EMPRICOD = ' + ComboEmpresa.Value
  else
    SQLProduto.MacroByName('MEmpresa').Value := '0=0';

  if ComboFornecedor.Value <> '' then
     SQLProduto.MacroByName('Fornecedor').Value := 'PRODUTO.PRODICOD IN (Select PRODICOD From PRODUTOFORNECEDOR Where FORNICOD = '+ComboFornecedor.Value+')'
  else
     SQLProduto.MacroByName('Fornecedor').Value := '0=0';

  if ComboGrupo.Value <> '' then
    SQLProduto.MacroByName('Grupo').Value := 'PRODUTO.GRUPICOD = ' + ComboGrupo.Value
  else
    SQLProduto.MacroByName('Grupo').Value := '0=0';

  if ComboMarca.Value <> '' then
    SQLProduto.MacroByName('Marca').Value      := 'PRODUTO.MARCICOD = ' + ComboMarca.Value
  else
    SQLProduto.MacroByName('Marca').Value      := '0=0';

  if OrdemCodigo.Checked then
    SQLProduto.MacroByName('MOrdem').Value := 'PRODUTO.PRODICOD'
  else
    SQLProduto.MacroByName('MOrdem').Value := 'PRODUTO.PRODA60DESCR';

  SQLProduto.Open;

  if SQLProduto.IsEmpty then
    begin
      ShowMessage('Nenhum Registro Encontrado!');
      Abort;
      Exit;
    end;

  Report.Print;
end;

procedure TFormRelatorioProdutosAbaixoMinimo.ReportPreviewFormCreate(
  Sender: TObject);
begin
  inherited;
  Report.PreviewForm.WindowState := wsMaximized;
  TppViewer(Report.PreviewForm.Viewer).ZoomPercentage := 100;
end;

procedure TFormRelatorioProdutosAbaixoMinimo.ppHeaderBand1BeforePrint(
  Sender: TObject);
begin
  inherited;
  if ComboEmpresa.Value <> 'Todas' then
    NomeEmpresa.Caption := 'Empresa: ' + ComboEmpresa.Text
  else
    NomeEmpresa.Caption := 'Empresa: Todas';

  if ComboGrupo.Value <> EmptyStr then
    NomeGrupo.Caption := 'Grupo: ' + ComboGrupo.Text
  else
    NomeGrupo.Caption := 'Grupo: Todos';

  if ComboMarca.Value <> EmptyStr then
    NomeMarca.Caption := 'Marca: ' + ComboMarca.Text
  else
    NomeMarca.Caption := 'Marca: Todas';

  if ComboFornecedor.Value <> EmptyStr then
    NomeFornecedor.Caption := 'Fornecedor: ' + ComboFornecedor.Text
  else
    NomeFornecedor.Caption := 'Fornecedor: Todos';

end;

procedure TFormRelatorioProdutosAbaixoMinimo.FormCreate(Sender: TObject);
begin
  inherited;
  SQLGrupo.Open;
  SQLMarca.Open;
  SQLFornecedor.Open;
end;

end.
