unit CadastroClienteProdutoPreco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadastroTEMPLATE, AdvOfficeStatusBar, AdvOfficeStatusBarStylers,
  DBTables, DBActns, ActnList, DB, RxQuery, Menus, StdCtrls, Mask,
  AdvPanel, Grids, DBGrids, ComCtrls, RXCtrls, Buttons, ExtCtrls, EDBNum,
  DBCtrls, VarSYS, FormResources, DataModulo;

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
    SQLClientePdvs: TRxQuery;
    SQLTemplatePENDENTE: TStringField;
    SQLClienteProdutoPDVs: TRxQuery;
    procedure FormCreate(Sender: TObject);
    procedure AcessaProdutosClick(Sender: TObject);
    procedure SQLTemplateNewRecord(DataSet: TDataSet);
    procedure DBEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SQLTemplatePRODICODChange(Sender: TField);
    procedure SQLTemplateAfterPost(DataSet: TDataSet);
    procedure SQLTemplateBeforePost(DataSet: TDataSet);
    procedure SQLTemplateBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
    function EnviaClientePDVs(Tipo: string): boolean;
    function EnviaClienteProdutoPrecoPDVs(Tipo: string): boolean;

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

function TFormCadastroClienteProdutoPreco.EnviaClientePDVs(
  Tipo: string): boolean;
var i: integer;
begin
  {Atualiza a tabela ClientePDVs}

  {Filtra Terminais que devem receber carga}
  dm.sqlconsulta.Close;
  dm.sqlconsulta.sql.clear;
  dm.sqlconsulta.sql.Text := 'Select Termicod from TERMINAL where TERMCTIPO = ''C''';
  dm.sqlconsulta.Open;
  if not dm.sqlconsulta.IsEmpty then
  begin
    while not dm.sqlconsulta.eof do
    begin
      SQLClientePdvs.close;
      SQLClientePdvs.MacroByName('MFiltro').Value := 'CLIEA13ID=''' + SQLTemplateCLIEA13ID.AsString + ''' and TERMICOD=' + dm.sqlconsulta.fieldbyname('TERMICOD').AsString;
      SQLClientePdvs.Open;
      if SQLClientePdvs.IsEmpty then
      begin
        SQLClientePdvs.Append;
        SQLClientePdvs.fieldbyname('TERMICOD').AsString := dm.SQLConsulta.fieldbyname('TERMICOD').AsString;
        SQLClientePdvs.fieldbyname('CLIEA13ID').AsString := SQLTemplateCLIEA13ID.AsString;
        SQLClientePdvs.fieldbyname('EXCLUIR').AsString := Tipo;
        SQLClientePdvs.Post;
      end;
          {PULA Terminal}
      dm.sqlconsulta.next;
    end;
  end;
end;

procedure TFormCadastroClienteProdutoPreco.SQLTemplateAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  EnviaClientePDVs('N');
end;

procedure TFormCadastroClienteProdutoPreco.SQLTemplateBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  SQLTemplatePENDENTE.AsString := 'S';
end;

function TFormCadastroClienteProdutoPreco.EnviaClienteProdutoPrecoPDVs(
  Tipo: string): boolean;
var i: integer;
begin
  {Atualiza a tabela ClientePDVs}

  {Filtra Terminais que devem receber carga}
  dm.sqlconsulta.Close;
  dm.sqlconsulta.sql.clear;
  dm.sqlconsulta.sql.Text := 'Select Termicod from TERMINAL where TERMCTIPO = ''C''';
  dm.sqlconsulta.Open;
  if not dm.sqlconsulta.IsEmpty then
  begin
    while not dm.sqlconsulta.eof do
    begin
      SQLClienteProdutoPDVs.close;
      SQLClienteProdutoPDVs.MacroByName('MFiltro').Value := 'CLIEA13ID=''' + SQLTemplateCLIEA13ID.AsString + ''' and TERMICOD=' + dm.sqlconsulta.fieldbyname('TERMICOD').AsString + ' and PRODICOD=' + SQLTemplatePRODICOD.AsString;
      SQLClienteProdutoPDVs.Open;
      if SQLClienteProdutoPDVs.IsEmpty then
      begin
        SQLClienteProdutoPDVs.Append;
        SQLClienteProdutoPDVs.fieldbyname('TERMICOD').AsString := dm.SQLConsulta.fieldbyname('TERMICOD').AsString;
        SQLClienteProdutoPDVs.fieldbyname('CLIEA13ID').AsString := SQLTemplateCLIEA13ID.AsString;
        SQLClienteProdutoPDVs.fieldbyname('PRODICOD').AsInteger := SQLTemplatePRODICOD.AsInteger;
        SQLClienteProdutoPDVs.fieldbyname('EXCLUIR').AsString := Tipo;
        SQLClienteProdutoPDVs.Post;
      end;
          {PULA Terminal}
      dm.sqlconsulta.next;
    end;
  end;
end;

procedure TFormCadastroClienteProdutoPreco.SQLTemplateBeforeDelete(
  DataSet: TDataSet);
begin
  inherited;
  EnviaClienteProdutoPrecoPDVs('S');
end;

end.
