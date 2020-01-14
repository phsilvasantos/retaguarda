unit CadastroProdutoRapidoTodos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EDBNum, RxLookup, StdCtrls, Mask, DBCtrls, Buttons, Math,
  AdvOfficeStatusBar, ExtCtrls, AdvOfficeStatusBarStylers, DB, DBTables, RxQuery,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Grids, DBGrids;

type
  TFormCadastroProdutoRapidoTodos = class(TForm)
    AdvOfficeStatusBarOfficeStyler1: TAdvOfficeStatusBarOfficeStyler;
    ScrollBoxTopo: TScrollBox;
    PanelCabecalho: TPanel;
    LabelTitulo: TLabel;
    PanelNavigator: TPanel;
    AdvPanelNavigator: TAdvOfficeStatusBar;
    BtnFecharTela: TSpeedButton;
    LabelGravar: TSpeedButton;
    Label9: TLabel;
    ComboUnidade: TRxDBLookupCombo;
    Label34: TLabel;
    ComboICMS: TRxDBLookupCombo;
    DSTemplate: TDataSource;
    SQLTemplate: TRxQuery;
    SQLTemplatePRODICOD: TIntegerField;
    SQLTemplatePRODIAGRUPGRADE: TIntegerField;
    SQLTemplatePRODA30ADESCRREDUZ: TStringField;
    SQLTemplateGRADICOD: TIntegerField;
    SQLTemplateGRTMICOD: TIntegerField;
    SQLTemplateCORICOD: TIntegerField;
    SQLTemplateICMSICOD: TIntegerField;
    SQLTemplateCLFSICOD: TIntegerField;
    SQLTemplateUNIDICOD: TIntegerField;
    SQLTemplateMARCICOD: TIntegerField;
    SQLTemplateGRUPICOD: TIntegerField;
    SQLTemplateSUBGICOD: TIntegerField;
    SQLTemplateVARIICOD: TIntegerField;
    SQLTemplatePRODICODPAI: TIntegerField;
    SQLTemplatePRODCTIPOBAIXA: TStringField;
    SQLTemplatePRODA60CODBAR: TStringField;
    SQLTemplatePRODA60REFER: TStringField;
    SQLTemplatePRODICODBALANCA: TIntegerField;
    SQLTemplatePRODA15APAVIM: TStringField;
    SQLTemplatePRODA15RUA: TStringField;
    SQLTemplatePRODA15PRATEL: TStringField;
    SQLTemplatePRODN3PESOBRUTO: TFloatField;
    SQLTemplatePRODN3PESOLIQ: TFloatField;
    SQLTemplatePRODN3CAPACEMBAL: TFloatField;
    SQLTemplatePRODDCAD: TDateTimeField;
    SQLTemplatePRODDULTALTER: TDateTimeField;
    SQLTemplatePRODDINIPROMO: TDateTimeField;
    SQLTemplatePRODDFIMPROMO: TDateTimeField;
    SQLTemplatePRODN2COMISVISTA: TFloatField;
    SQLTemplatePRODN3VLRCOMPRA: TFloatField;
    SQLTemplatePRODN3VLRCOMPRAMED: TFloatField;
    SQLTemplatePRODN3VLRCUSTO: TFloatField;
    SQLTemplatePRODDIMOBOLIZ: TDateTimeField;
    SQLTemplatePRODN3VLRVENDA: TFloatField;
    SQLTemplatePRODN3QTDEBAIXA: TFloatField;
    SQLTemplatePRODA60DESCR: TStringField;
    SQLTemplatePRODN3VLRVENDAPROM: TFloatField;
    SQLTemplatePRODN3VLRCUSTOMED: TFloatField;
    SQLTemplatePRODN3PERCIPI: TFloatField;
    SQLTemplatePRODN3PERCMARGLUCR: TFloatField;
    SQLTemplatePRODCATIVO: TStringField;
    SQLTemplatePRODCSERVICO: TStringField;
    SQLTemplatePRODCGERACOMIS: TStringField;
    SQLTemplatePENDENTE: TStringField;
    SQLTemplateREGISTRO: TDateTimeField;
    SQLTemplatePRODN2COMISPRAZO: TFloatField;
    SQLTemplatePRODIORIGEM: TIntegerField;
    SQLTemplatePRODDULTATUALIZ: TDateTimeField;
    SQLTemplatePRODA60DIMENSAO: TStringField;
    SQLTemplatePRODISITTRIB: TIntegerField;
    SQLTemplatePRODICODETIQBAL: TIntegerField;
    SQLTemplatePRODIDIASVALIDADE: TIntegerField;
    SQLTemplatePRODN3DOLARCUSTO: TFloatField;
    SQLTemplatePRODN3DOLARCOMPRA: TFloatField;
    SQLTemplatePRODN3DOLARVENDA: TFloatField;
    SQLTemplatePRODITIPOPRODBALAN: TStringField;
    SQLTemplatePRODBIMAGEM: TBlobField;
    SQLTemplatePRODCSUBSTRIB: TStringField;
    SQLTemplatePRODCTEMNROSERIE: TStringField;
    SQLTemplatePRODN2PERCFRETE: TFloatField;
    SQLTemplatePRODA03GARANTIA: TStringField;
    SQLTemplatePRODA30INF01ETQBARRAS: TStringField;
    SQLTemplatePRODA30INF02ETQBARRAS: TStringField;
    SQLTemplateCOLEICOD: TIntegerField;
    SQLTemplatePRODCTIPO: TStringField;
    SQLTemplatePRODN2PERDA: TFloatField;
    SQLTemplatePRODN2PIS: TFloatField;
    SQLTemplatePRODN3ALTURA: TFloatField;
    SQLTemplatePRODN3COMPRIMENTO: TFloatField;
    SQLTemplatePRODN3DIMENTOTAL: TFloatField;
    SQLTemplatePRODN3LARGURA: TFloatField;
    SQLTemplatePRODN2PERCDESP: TFloatField;
    SQLTemplatePRODN2PERCSUBST: TFloatField;
    SQLTemplatePRODN3PERCMARGLUC2: TFloatField;
    SQLTemplatePRODN3PERCMGLVFIXA: TFloatField;
    SQLTemplatePRODN3PERCMGLAFIXA: TFloatField;
    SQLTemplatePRODDULTCOMPRA: TDateTimeField;
    SQLTemplatePRODDULTVENDA: TDateTimeField;
    SQLTemplatePRODN3QTDULTCOMPRA: TFloatField;
    SQLTemplatePRODN2PERCDIFICM: TFloatField;
    SQLTemplatePRODIPRINCIPAL: TIntegerField;
    SQLTemplatePRODCPERMITETROCA: TStringField;
    SQLTemplatePRODDPREVCOMPRA: TDateTimeField;
    SQLTemplatePRODCCOFINS: TStringField;
    SQLTemplatePRODN3VLRVENDA2: TFloatField;
    SQLTemplatePRODCIMPETIQCDBAR: TStringField;
    SQLTemplatePRODN3QTDVOLUME: TFloatField;
    SQLTemplatePRODCVDESTNEG: TStringField;
    SQLTemplatePRODA2CSTIPI: TStringField;
    SQLTemplatePRODA2CSTCOFINS: TStringField;
    SQLTemplatePRODA2CSTPIS: TStringField;
    SQLTemplatePRODN2ALIQCOFINS: TFloatField;
    SQLTemplatePRODN2ALIQPIS: TFloatField;
    SQLTemplatePRODCBLOQVPRAZO: TStringField;
    SQLTemplateNCMICOD: TIntegerField;
    SQLTemplatePRODA1TIPO: TStringField;
    SQLTemplatePRODA1MODBCST: TStringField;
    SQLTemplatePRODA1MODBC: TStringField;
    SQLTemplatePRODN2DESCMAX: TFloatField;
    SQLTemplatePRODA20BARRAUNIDADE: TStringField;
    SQLTemplatePRODA2TIPOITEM: TStringField;
    SQLTemplatePRODA30COZINHA: TStringField;
    SQLTemplatePRODCIMPCOZINHA: TStringField;
    SQLTemplatePRODCIMPVALE: TStringField;
    SQLTemplatePRODA3CSTIPIENTRADA: TStringField;
    SQLTemplatePRODA3CSTCOFINSENTRADA: TStringField;
    SQLTemplatePRODA3CSTPISENTRADA: TStringField;
    SQLTemplatePRODN2PERCIPIENTRADA: TFloatField;
    SQLTemplatePRODA1CSTSERVICO: TStringField;
    SQLTemplatePRODICODLISTASERVICO: TIntegerField;
    SQLTemplateUNIDICOD2: TIntegerField;
    SQLTemplatePRODCRAPIDO: TStringField;
    SQLTemplatePRODCMIX: TStringField;
    SQLTemplatePRODN3QTDVENDA2835D: TFloatField;
    SQLTemplatePRODN3QTDVENDA283542D: TFloatField;
    SQLTemplatePRODN2VLRVENDA2835D: TFloatField;
    SQLTemplatePRODN2VLRVENDA283542D: TFloatField;
    DSSQLUnidade: TDataSource;
    SQLUnidade: TRxQuery;
    SQLUnidadeUNIDICOD: TIntegerField;
    SQLUnidadeUNIDA5DESCR: TStringField;
    SQLUnidadeUNIDA15DESCR: TStringField;
    DSSQLIcms: TDataSource;
    SQLIcms: TRxQuery;
    SQLIcmsICMSICOD: TIntegerField;
    SQLIcmsICMSA60DESCR: TStringField;
    SQLIcmsICMSN2ALIQUOTA: TFloatField;
    SQLIcmsICMSICODSITTRIB: TIntegerField;
    DSSQLGrupo: TDataSource;
    SQLGrupo: TRxQuery;
    SQLGrupoGRUPICOD: TIntegerField;
    SQLGrupoGRUPA60DESCR: TStringField;
    Label1: TLabel;
    ComboColecao: TRxDBLookupCombo;
    Label15: TLabel;
    ComboGrupo: TRxDBLookupCombo;
    SQLTemplatePRODA255DESCRTEC: TMemoField;
    lbMarcaAdd: TLabel;
    lbGrupoAdd: TLabel;
    SQLTemplatePRODN2MGVENDA283542D: TFloatField;
    SQLTemplatePRODN2MGVENDA2835D: TFloatField;
    SQLTemplateTABCEST: TStringField;
    SQLColecao: TRxQuery;
    SQLColecaoCOLEICOD: TIntegerField;
    SQLColecaoCOLEA60DESCR: TStringField;
    SQLColecaoPENDENTE: TStringField;
    SQLColecaoREGISTRO: TDateTimeField;
    DSSQLColecao: TDataSource;
    sqlMax: TRxQuery;
    procedure FormCreate(Sender: TObject);
    procedure LabelGravarClick(Sender: TObject);
    procedure BtnFecharTelaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboColecaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ComboGrupoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lbMarcaAddClick(Sender: TObject);
    procedure lbGrupoAddClick(Sender: TObject);
    procedure ComboICMSExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    procedure addGrupo;
    procedure addColecao;
  public
    { Public declarations }
    CdFornec, CdReferencia: string;
    vCompraEmbalagem, vDescEmbalagem: Double;
  end;

var
  FormCadastroProdutoRapidoTodos: TFormCadastroProdutoRapidoTodos;

implementation

uses
  DataModulo, UnitLibrary;

{$R *.dfm}

procedure TFormCadastroProdutoRapidoTodos.FormCreate(Sender: TObject);
begin
  SQLColecao.Open;
  sqlGrupo.Open;
  sqlunidade.Open;
  SQLIcms.Open;
  SQLTemplate.Open;
end;

procedure TFormCadastroProdutoRapidoTodos.LabelGravarClick(Sender: TObject);
var
  erro: boolean;
begin
  if ComboUnidade.Value = '' then
  begin
    showmessage('Unidade de Venda não informada!');
    exit;
  end;
  if ComboICMS.Value = '' then
  begin
    showmessage('ICMS de Venda não informado!');
    exit;
  end;

  if (SQLIcmsICMSICOD.IsNull) then
  begin
    showmessage('CST Icms campo obrigatorio!');
    exit;
  end;
  Close;
  ModalResult := mrOk;
end;

procedure TFormCadastroProdutoRapidoTodos.BtnFecharTelaClick(Sender: TObject);
begin
  Close;
end;

procedure TFormCadastroProdutoRapidoTodos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TFormCadastroProdutoRapidoTodos.addGrupo;
var
  cod: integer;
var
  Grupo: string;
begin
  Grupo := UpperCase(InputBox('Adiciona Grupo', 'Grupo', Grupo));
  sqlmax.Close;
  sqlmax.SQL.clear;
  sqlmax.SQL.Text := 'Select Max(grupicod) from grupo';
  sqlmax.Open;
  try
    cod := sqlmax.FieldByName('MAX').AsInteger + 1;
  except
    cod := 1;
  end;
  sqlGrupo.Append;
  SQLGrupoGRUPICOD.Value := cod;
  SQLGrupoGRUPA60DESCR.Value := Grupo;
  SQLGrupo.post;
  SQLGrupo.close;
  SQLGrupo.Open;
  combogrupo.KeyValue := Cod;
  ComboGrupo.SetFocus;
end;

procedure TFormCadastroProdutoRapidoTodos.ComboColecaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = 43 then
    addColecao;
  if Key = 13 then
  begin
    if ComboColecao.IsDropDown then
    begin
      ComboColecao.CloseUp(True);
      Application.ProcessMessages;
    end;
  end;
end;

procedure TFormCadastroProdutoRapidoTodos.ComboGrupoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = 43 then
    addGrupo;
end;

procedure TFormCadastroProdutoRapidoTodos.lbMarcaAddClick(Sender: TObject);
begin
  addColecao;
end;

procedure TFormCadastroProdutoRapidoTodos.lbGrupoAddClick(Sender: TObject);
begin
  addGrupo;
end;

procedure TFormCadastroProdutoRapidoTodos.ComboICMSExit(Sender: TObject);
begin
  if not SQLIcmsICMSICODSITTRIB.IsNull then
    SQLTemplatePRODISITTRIB.Value := SQLIcmsICMSICODSITTRIB.Value;
end;

procedure TFormCadastroProdutoRapidoTodos.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then
    Perform(Wm_NextDlgCtl, 0, 0);
end;

procedure TFormCadastroProdutoRapidoTodos.addColecao;
var
  cod: integer;
  Colecao: string;
begin
  Colecao := UpperCase(InputBox('Adiciona Colecao', 'Colecao', Colecao));
  sqlmax.Close;
  sqlmax.SQL.clear;
  sqlmax.SQL.Text := 'Select Max(COLEICOD) from Colecao';
  sqlmax.Open;
  try
    cod := sqlmax.FieldByName('MAX').AsInteger + 1;
  except
    cod := 1;
  end;
  SQLColecao.Append;
  SQLColecaoCOLEICOD.Value := cod;
  SQLColecaoCOLEA60DESCR.Value := Colecao;
  SQLColecao.post;
  SQLColecao.close;
  SQLColecao.Open;
  ComboColecao.KeyValue := Cod;
  ComboColecao.SetFocus;
end;

end.

