unit TelaGeralCBenef;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TelaGeralTEMPLATE, AdvOfficeStatusBar,
  AdvOfficeStatusBarStylers, Buttons, StdCtrls, ExtCtrls, DBTables,
  RxQuery, DB, Grids, DBGrids;

type
  TFormTelaGeralCBenef = class(TFormTelaGeralTEMPLATE)
    BtnSelecionarDoc: TSpeedButton;
    dsSQLCBenef: TDataSource;
    SQLCBenef: TRxQuery;
    DBGridLista: TDBGrid;
    SQLCBenefID: TIntegerField;
    SQLCBenefCODIGO: TStringField;
    SQLCBenefUF: TStringField;
    SQLCBenefDESCRICAO: TStringField;
    SQLCBenefOBS: TStringField;
    SQLCBenefDTINICIO: TDateTimeField;
    SQLCBenefDTFINAL: TDateTimeField;
    SQLCBenefCST_00: TStringField;
    SQLCBenefCST_10: TStringField;
    SQLCBenefCST_20: TStringField;
    SQLCBenefCST_30: TStringField;
    SQLCBenefCST_40: TStringField;
    SQLCBenefCST_41: TStringField;
    SQLCBenefCST_50: TStringField;
    SQLCBenefCST_51: TStringField;
    SQLCBenefCST_60: TStringField;
    SQLCBenefCST_70: TStringField;
    SQLCBenefCST_90: TStringField;
    PanelTopBxDocREc: TPanel;
    Label1: TLabel;
    CodCBenef: TEdit;
    procedure BtnSelecionarDocClick(Sender: TObject);
    procedure CodCBenefKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTelaGeralCBenef: TFormTelaGeralCBenef;

implementation

{$R *.dfm}

procedure TFormTelaGeralCBenef.BtnSelecionarDocClick(Sender: TObject);
begin
  inherited;
  SQLCBenef.Close ;
  if CodCBenef.Text <> EmptyStr then
    SQLCBenef.MacroByName('MCodigo').Value := 'CODIGO = "' + CodCBenef.Text + '"'
  else
    SQLCBenef.MacroByName('MCodigo').Value := '0=0';

  SQLCBenef.Open;
end;

procedure TFormTelaGeralCBenef.CodCBenefKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = vk_return then
    BtnSelecionarDocClick(Sender);
end;

end.
