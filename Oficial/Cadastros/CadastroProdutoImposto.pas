unit CadastroProdutoImposto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadastroTEMPLATE, AdvOfficeStatusBar, AdvOfficeStatusBarStylers,
  DBTables, DBActns, ActnList, DB, RxQuery, Menus, StdCtrls, Mask,
  AdvPanel, Grids, DBGrids, ComCtrls, RXCtrls, Buttons, ExtCtrls, DBCtrls,
  RxDBComb, RxLookup, FormResources, VarSYS;

type
  TFormCadastroProdutoImposto = class(TFormCadastroTEMPLATE)
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    SQLTemplatePRODICOD: TIntegerField;
    SQLTemplatePRODISITTRIB: TIntegerField;
    SQLTemplatePRODN2ALIQPIS: TFloatField;
    SQLTemplatePRODN2ALIQCOFINS: TFloatField;
    SQLTemplatePERC_REDUCAO_BASE_CALCULO: TFloatField;
    SQLTemplatePRODA1MODBC: TStringField;
    SQLTemplatePRODA1MODBCST: TStringField;
    SQLTemplatePERC_REDUCAO_BASE_CALCULO_ST: TFloatField;
    gbICMS: TGroupBox;
    Label68: TLabel;
    Label36: TLabel;
    Label105: TLabel;
    Label103: TLabel;
    Label57: TLabel;
    ComboSitTrib: TRxDBComboBox;
    DBEdit7: TDBEdit;
    ComboDetBaseCalcICM: TRxDBComboBox;
    ComboDetBaseCalcICMST: TRxDBComboBox;
    DBEdit12: TDBEdit;
    gbPisCofins: TGroupBox;
    Label118: TLabel;
    Label113: TLabel;
    Label117: TLabel;
    Label119: TLabel;
    RxDBComboBox10: TRxDBComboBox;
    DBEdit51: TDBEdit;
    RxDBComboBox9: TRxDBComboBox;
    DBEdit60: TDBEdit;
    SQLIcms: TRxQuery;
    SQLIcmsICMSICOD: TIntegerField;
    SQLIcmsICMSA60DESCR: TStringField;
    SQLIcmsICMSN2ALIQUOTA: TFloatField;
    SQLIcmsICMSICODSITTRIB: TIntegerField;
    DSSQLIcms: TDataSource;
    Label34: TLabel;
    ComboICMS: TRxDBLookupCombo;
    AcessaICMS: TSpeedButton;
    comboTipo: TRxDBComboBox;
    lblTipo: TLabel;
    SQLTemplateTIPO: TStringField;
    SQLTemplatePRODA2CSTPIS: TStringField;
    SQLTemplatePRODA2CSTCOFINS: TStringField;
    SQLTemplateLookUpICMS: TStringField;
    SQLTemplateICMSICOD: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure AcessaICMSClick(Sender: TObject);
    procedure SQLTemplateNewRecord(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroProdutoImposto: TFormCadastroProdutoImposto;

implementation

uses
  CadastroICMS;

{$R *.dfm}

procedure TFormCadastroProdutoImposto.FormCreate(Sender: TObject);
begin
  inherited;
  TABELA := 'PRODUTO_IMPOSTO';
end;

procedure TFormCadastroProdutoImposto.AcessaICMSClick(Sender: TObject);
begin
  inherited;
  ComboICMS.SetFocus;
  FieldLookup := DsTemplate.DataSet.FieldByName('ICMSICOD');
  FieldOrigem := 'ICMSICOD';
  DataSetLookup := SQLIcms;
  CriaFormulario(TFormCadastroIcms, 'FormCadastroIcms', False, True, True, 'Produto ' + IntToStr(SQLTemplatePRODICOD.Value));

end;

procedure TFormCadastroProdutoImposto.SQLTemplateNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  DataSet.FindField('PRODICOD').Value   := DataSet.DataSource.DataSet.FindField('PRODICOD').Value;

end;

procedure TFormCadastroProdutoImposto.FormShow(Sender: TObject);
begin
  inherited;
  SQLIcms.Open;
end;

end.
