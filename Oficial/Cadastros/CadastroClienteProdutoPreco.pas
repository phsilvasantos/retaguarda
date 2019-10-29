unit CadastroClienteProdutoPreco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadastroTEMPLATE, AdvOfficeStatusBar, AdvOfficeStatusBarStylers,
  DBTables, DBActns, ActnList, DB, RxQuery, Menus, StdCtrls, Mask,
  AdvPanel, Grids, DBGrids, ComCtrls, RXCtrls, Buttons, ExtCtrls, EDBNum,
  DBCtrls, VarSYS, FormResources;

type
  TFormCadastroClienteProdutoPreco = class(TFormCadastroTEMPLATE)
    SQLTemplateCLIEA13ID: TStringField;
    SQLTemplatePRODICOD: TIntegerField;
    SQLTemplatePRECO: TFloatField;
    SQLTemplateREGISTRO: TDateTimeField;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    AcessaProdutos: TSpeedButton;
    DBEdit6: TDBEdit;
    Label22: TLabel;
    EvDBNumEdit2: TEvDBNumEdit;
    TblProduto: TTable;
    TblProdutoPRODICOD: TIntegerField;
    TblProdutoPRODA30ADESCRREDUZ: TStringField;
    SQLTemplateProdutoLookup: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure AcessaProdutosClick(Sender: TObject);
    procedure SQLTemplateNewRecord(DataSet: TDataSet);
    procedure DBEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SQLTemplatePRODICODChange(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroClienteProdutoPreco: TFormCadastroClienteProdutoPreco;

implementation

uses
  CadastroProdutos, UnitLibrary;

{$R *.dfm}

procedure TFormCadastroClienteProdutoPreco.FormCreate(Sender: TObject);
begin
  inherited;
  Tabela := 'CLIENTEPRODUTOPRECO';

end;

procedure TFormCadastroClienteProdutoPreco.AcessaProdutosClick(
  Sender: TObject);
begin
  inherited;
  FieldLookup := DsTemplate.DataSet.FieldByName('PRODICOD');
  FieldOrigem := 'PRODICOD' ;
  DataSetLookup := TblProduto;
  CriaFormulario(TFormCadastroProduto,'FormCadastroProduto',False,True,True,'Cliente ') ;

end;

procedure TFormCadastroClienteProdutoPreco.SQLTemplateNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  DataSet.FindField('CLIEA13ID').Value := DataSet.DataSource.DataSet.FindField('CLIEA13ID').Value;
end;

procedure TFormCadastroClienteProdutoPreco.DBEdit2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  If Key=VK_F2 Then
    AcessaProdutos.Click;
end;

procedure TFormCadastroClienteProdutoPreco.SQLTemplatePRODICODChange(
  Sender: TField);
begin
  inherited;
  if SQLTemplatePRODICOD.AsInteger > 0 then
    SQLTemplatePRECO.AsFloat := StrToFloatDef(SQLLocate('PRODUTO','PRODICOD','PRODN3VLRVENDA', SQLTemplatePRODICOD.AsString),0);
end;

end.
