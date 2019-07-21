unit CadastroNCMUF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadastroTEMPLATE, AdvOfficeStatusBar, AdvOfficeStatusBarStylers,
  DBTables, DBActns, ActnList, DB, RxQuery, Menus, StdCtrls, Mask,
  AdvPanel, Grids, DBGrids, ComCtrls, RXCtrls, Buttons, ExtCtrls, DBCtrls,
  RxDBComb;

type
  TFormCadastroNCMUF = class(TFormCadastroTEMPLATE)
    SQLTemplateNCMICOD: TIntegerField;
    SQLTemplateUF: TStringField;
    SQLTemplateMVAINTERNO: TFloatField;
    SQLTemplatePERC_RED_MVA: TFloatField;
    SQLTemplatePERC_RED_MVA_GERAL: TFloatField;
    SQLTemplateAJUSTAR_MVA: TStringField;
    SQLTemplatePERC_ICMS_INTERNO: TFloatField;
    SQLTemplateOBS_LEI: TStringField;
    SQLTemplatePERC_RED_BASE_ST: TFloatField;
    SQLTemplatePERC_RED_BASE_ST_SIMPLES: TFloatField;
    SQLTemplatePERC_RED_MVA_CLI_GERAL: TFloatField;
    SQLTemplatePERC_RED_MVA_CLI_SIMPLES: TFloatField;
    Label38: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit8: TDBEdit;
    Label8: TLabel;
    DBEdit9: TDBEdit;
    Label9: TLabel;
    DBEdit10: TDBEdit;
    Label10: TLabel;
    DBEdit11: TDBEdit;
    Label11: TLabel;
    DBEdit12: TDBEdit;
    Label12: TLabel;
    DBEdit13: TDBEdit;
    Label1: TLabel;
    ComboUFRes: TRxDBComboBox;
    Label13: TLabel;
    DBEdit3: TDBEdit;
    SQLTemplateICMUA30NOMEESTADO: TStringField;
    DBCheckBox1: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure SQLTemplateNewRecord(DataSet: TDataSet);
    procedure ComboUFResChange(Sender: TObject);
    procedure SQLTemplateCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroNCMUF: TFormCadastroNCMUF;

implementation

{$R *.dfm}

procedure TFormCadastroNCMUF.FormCreate(Sender: TObject);
begin
  inherited;
  Tabela := 'NCM_UF';
end;

procedure TFormCadastroNCMUF.SQLTemplateNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FindField('NCMICOD').Value := DataSet.DataSource.DataSet.FindField('NCMICOD').Value;
end;

procedure TFormCadastroNCMUF.ComboUFResChange(Sender: TObject);
begin
  inherited;
  If SQLTemplate.State in ([dsInsert, dsEdit]) then
    if      ComboUFRes.Text = 'AC' then SQLTemplateICMUA30NOMEESTADO.AsString := 'ACRE'
    else if ComboUFRes.Text = 'AL' then SQLTemplateICMUA30NOMEESTADO.AsString := 'ALAGOAS'
    else if ComboUFRes.Text = 'AM' then SQLTemplateICMUA30NOMEESTADO.AsString := 'AMAZONAS'
    else if ComboUFRes.Text = 'AP' then SQLTemplateICMUA30NOMEESTADO.AsString := 'AMAPA'
    else if ComboUFRes.Text = 'BA' then SQLTemplateICMUA30NOMEESTADO.AsString := 'BAHIA'
    else if ComboUFRes.Text = 'CE' then SQLTemplateICMUA30NOMEESTADO.AsString := 'CEARA'
    else if ComboUFRes.Text = 'DF' then SQLTemplateICMUA30NOMEESTADO.AsString := 'DISTRITO FEDERAL'
    else if ComboUFRes.Text = 'ES' then SQLTemplateICMUA30NOMEESTADO.AsString := 'ESPIRITO SANTO'
    else if ComboUFRes.Text = 'GO' then SQLTemplateICMUA30NOMEESTADO.AsString := 'GOIAS'
    else if ComboUFRes.Text = 'MA' then SQLTemplateICMUA30NOMEESTADO.AsString := 'MARANHÃO'
    else if ComboUFRes.Text = 'MG' then SQLTemplateICMUA30NOMEESTADO.AsString := 'MINAS GERAIS'
    else if ComboUFRes.Text = 'MS' then SQLTemplateICMUA30NOMEESTADO.AsString := 'MATO GROSSO DO SUL'
    else if ComboUFRes.Text = 'PA' then SQLTemplateICMUA30NOMEESTADO.AsString := 'PARA'
    else if ComboUFRes.Text = 'PB' then SQLTemplateICMUA30NOMEESTADO.AsString := 'PARAIBA'
    else if ComboUFRes.Text = 'PE' then SQLTemplateICMUA30NOMEESTADO.AsString := 'PERNAMBUCO'
    else if ComboUFRes.Text = 'PI' then SQLTemplateICMUA30NOMEESTADO.AsString := 'PIAUI'
    else if ComboUFRes.Text = 'PR' then SQLTemplateICMUA30NOMEESTADO.AsString := 'PARANA'
    else if ComboUFRes.Text = 'MT' then SQLTemplateICMUA30NOMEESTADO.AsString := 'MATO GROSSO'
    else if ComboUFRes.Text = 'RJ' then SQLTemplateICMUA30NOMEESTADO.AsString := 'RIO DE JANEIRO'
    else if ComboUFRes.Text = 'RN' then SQLTemplateICMUA30NOMEESTADO.AsString := 'RIO GRANDE DO NORTE'
    else if ComboUFRes.Text = 'RO' then SQLTemplateICMUA30NOMEESTADO.AsString := 'RONDONIA'
    else if ComboUFRes.Text = 'RR' then SQLTemplateICMUA30NOMEESTADO.AsString := 'RORAIMA'
    else if ComboUFRes.Text = 'RS' then SQLTemplateICMUA30NOMEESTADO.AsString := 'RIO GRANDE DO SUL'
    else if ComboUFRes.Text = 'SC' then SQLTemplateICMUA30NOMEESTADO.AsString := 'SANTA CATARINA'
    else if ComboUFRes.Text = 'SE' then SQLTemplateICMUA30NOMEESTADO.AsString := 'SERGIPE'
    else if ComboUFRes.Text = 'SP' then SQLTemplateICMUA30NOMEESTADO.AsString := 'SAO PAULO'
    else if ComboUFRes.Text = 'TO' then SQLTemplateICMUA30NOMEESTADO.AsString := 'TOCANTINS'
    else if ComboUFRes.Text = 'EX' then SQLTemplateICMUA30NOMEESTADO.AsString := 'EXTERIOR';

end;

procedure TFormCadastroNCMUF.SQLTemplateCalcFields(DataSet: TDataSet);
begin
  inherited;
    if      ComboUFRes.Text = 'AC' then SQLTemplateICMUA30NOMEESTADO.AsString := 'ACRE'
    else if ComboUFRes.Text = 'AL' then SQLTemplateICMUA30NOMEESTADO.AsString := 'ALAGOAS'
    else if ComboUFRes.Text = 'AM' then SQLTemplateICMUA30NOMEESTADO.AsString := 'AMAZONAS'
    else if ComboUFRes.Text = 'AP' then SQLTemplateICMUA30NOMEESTADO.AsString := 'AMAPA'
    else if ComboUFRes.Text = 'BA' then SQLTemplateICMUA30NOMEESTADO.AsString := 'BAHIA'
    else if ComboUFRes.Text = 'CE' then SQLTemplateICMUA30NOMEESTADO.AsString := 'CEARA'
    else if ComboUFRes.Text = 'DF' then SQLTemplateICMUA30NOMEESTADO.AsString := 'DISTRITO FEDERAL'
    else if ComboUFRes.Text = 'ES' then SQLTemplateICMUA30NOMEESTADO.AsString := 'ESPIRITO SANTO'
    else if ComboUFRes.Text = 'GO' then SQLTemplateICMUA30NOMEESTADO.AsString := 'GOIAS'
    else if ComboUFRes.Text = 'MA' then SQLTemplateICMUA30NOMEESTADO.AsString := 'MARANHÃO'
    else if ComboUFRes.Text = 'MG' then SQLTemplateICMUA30NOMEESTADO.AsString := 'MINAS GERAIS'
    else if ComboUFRes.Text = 'MS' then SQLTemplateICMUA30NOMEESTADO.AsString := 'MATO GROSSO DO SUL'
    else if ComboUFRes.Text = 'PA' then SQLTemplateICMUA30NOMEESTADO.AsString := 'PARA'
    else if ComboUFRes.Text = 'PB' then SQLTemplateICMUA30NOMEESTADO.AsString := 'PARAIBA'
    else if ComboUFRes.Text = 'PE' then SQLTemplateICMUA30NOMEESTADO.AsString := 'PERNAMBUCO'
    else if ComboUFRes.Text = 'PI' then SQLTemplateICMUA30NOMEESTADO.AsString := 'PIAUI'
    else if ComboUFRes.Text = 'PR' then SQLTemplateICMUA30NOMEESTADO.AsString := 'PARANA'
    else if ComboUFRes.Text = 'MT' then SQLTemplateICMUA30NOMEESTADO.AsString := 'MATO GROSSO'
    else if ComboUFRes.Text = 'RJ' then SQLTemplateICMUA30NOMEESTADO.AsString := 'RIO DE JANEIRO'
    else if ComboUFRes.Text = 'RN' then SQLTemplateICMUA30NOMEESTADO.AsString := 'RIO GRANDE DO NORTE'
    else if ComboUFRes.Text = 'RO' then SQLTemplateICMUA30NOMEESTADO.AsString := 'RONDONIA'
    else if ComboUFRes.Text = 'RR' then SQLTemplateICMUA30NOMEESTADO.AsString := 'RORAIMA'
    else if ComboUFRes.Text = 'RS' then SQLTemplateICMUA30NOMEESTADO.AsString := 'RIO GRANDE DO SUL'
    else if ComboUFRes.Text = 'SC' then SQLTemplateICMUA30NOMEESTADO.AsString := 'SANTA CATARINA'
    else if ComboUFRes.Text = 'SE' then SQLTemplateICMUA30NOMEESTADO.AsString := 'SERGIPE'
    else if ComboUFRes.Text = 'SP' then SQLTemplateICMUA30NOMEESTADO.AsString := 'SAO PAULO'
    else if ComboUFRes.Text = 'TO' then SQLTemplateICMUA30NOMEESTADO.AsString := 'TOCANTINS'
    else if ComboUFRes.Text = 'EX' then SQLTemplateICMUA30NOMEESTADO.AsString := 'EXTERIOR';

end;

end.
