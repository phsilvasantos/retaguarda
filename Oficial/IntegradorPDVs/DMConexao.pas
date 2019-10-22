unit DMConexao;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr;

type
  TDMConection = class(TDataModule)
    SQLConnection: TSQLConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMConection: TDMConection;

implementation

{$R *.dfm}

end.
