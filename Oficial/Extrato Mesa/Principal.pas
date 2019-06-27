unit Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, ExtCtrls, ComCtrls, RDprint, Inifiles, ppPrnabl,
  ppClass, ppCtrls, ppCache, ppBands, ppComm, ppRelatv, ppProd, ppReport,
  StdCtrls, ACBrNFeDANFEClass, ACBrNFeDANFeESCPOS, ACBrBase, ACBrPosPrinter,
  RXCtrls;

type
  TFormPrincipal = class(TForm)
    TblPedidoFinanceiro: TTable;
    TblPedidoFinanceiroPedICod: TStringField;
    TblPedidoFinanceiroVencimento: TDateField;
    TblPedidoFinanceiroValor: TFloatField;
    TblPreVendaItem: TTable;
    TblPedidoFinanceiroNumerario: TStringField;
    Memo: TMemo;
    ACBrPosPrinter: TACBrPosPrinter;
    TblPedidoFinanceiroTipopadrao: TStringField;
    lbEmpresa: TRxLabel;
    TblPreVendaItemTERMICOD: TIntegerField;
    TblPreVendaItemPRVDICOD: TIntegerField;
    TblPreVendaItemPVITIPOS: TIntegerField;
    TblPreVendaItemPRODICOD: TIntegerField;
    TblPreVendaItemDescricaoRed: TStringField;
    TblPreVendaItemPVITN3QTD: TFloatField;
    TblPreVendaItemPVITN3VLRUNIT: TFloatField;
    TblPreVendaItemPVITCSTATUS: TStringField;
    TblPreVendaItemVENDICOD: TIntegerField;
    TblPreVendaItemTotalItem: TFloatField;
    TblPreVendaItemMarcado: TBooleanField;
    TblPreVendaItemVendedor: TStringField;
    TblPreVendaItemMesaICod: TIntegerField;
    TblPreVendaItemContaICod: TIntegerField;
    TblPreVendaItemValorServico: TFloatField;
    TblPreVendaItemBORDA01: TStringField;
    TblPreVendaItemBORDA02: TStringField;
    TblPreVendaItemBORDA03: TStringField;
    TblPreVendaItemSABOR01: TStringField;
    TblPreVendaItemSABOR02: TStringField;
    TblPreVendaItemSABOR03: TStringField;
    TblPreVendaItemSABOR04: TStringField;
    TblPreVendaItemSABOR05: TStringField;
    TblPreVendaItemSABOR06: TStringField;
    TblPreVendaItemValorDesconto: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

uses
  DataModulo;


{$R *.dfm}

procedure TFormPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ACBrPosPrinter.Device.Desativar;
  Action := cafree;
end;

procedure TFormPrincipal.FormShow(Sender: TObject);
var
  Inifile: TInifile;
var
  ImpMarca, ImpCaixaPorta, ImpCaixaVeloc, EmpresaNome, Saltar: string;
var
  Total, TotalDesconto: Double;
begin
  try
    try
      TotalDesconto := 0;
      memo.Lines.Clear;
      TblPreVendaItem.Open;
      Inifile := TIniFile.Create('C:\Easy2Solutions\Gestao\Parceiro.ini');
      EmpresaNome := Inifile.ReadString('IB_Software', 'EmpresaNome', '');
      ImpMarca := Inifile.ReadString('Restaurante', 'ImpMarca', '');
      ImpCaixaPorta := Inifile.ReadString('Restaurante', 'ImpCaixaPorta', '');
      ImpCaixaVeloc := Inifile.ReadString('Restaurante', 'ImpCaixaVeloc', '9600');
      Saltar := Inifile.ReadString('IB_SOFTWARE', 'Saltar', '');
      Inifile.Free;

      if ImpMarca = 'EPSON' then
        ACBrPosPrinter.Modelo := ppEscPosEpson;
      if ImpMarca = 'BEMATECH' then
        ACBrPosPrinter.Modelo := ppEscBematech;
      if ImpMarca = 'ELGIN' then
        ACBrPosPrinter.Modelo := ppEscVox;
      if ImpMarca = 'DR700' then
        ACBrPosPrinter.Modelo := ppEscDaruma;
      if ImpMarca = 'DR800' then
        ACBrPosPrinter.Modelo := ppEscDaruma;

      ACBrPosPrinter.Device.Porta := ImpCaixaPorta;
      ACBrPosPrinter.Device.Baud := StrToint(ImpCaixaVeloc);
      ACBrPosPrinter.Device.Desativar;

      memo.Lines.Add(' ');
      memo.Lines.Add(' ');
      memo.Lines.Add('</ae><e>' + EmpresaNome + '</e>');
      memo.Lines.Add('</fn></ce>');
      memo.Lines.Add(' ');
      memo.Lines.Add('</ae><e>EXTRATO</e>');
      memo.Lines.Add(' ');
      memo.Lines.Add('</ae><e>MESA/COMANDA => ' + TblPreVendaItemMesaICod.AsString + '/' + TblPreVendaItemContaICod.AsString + '</e></fn>');
      memo.Lines.Add('------------------------------------------------');
      memo.Lines.Add(' Descricao                                      ');
      memo.Lines.Add('       Quantidade     Valor Unit       Vlr.Total');
      memo.Lines.Add('------------------------------------------------');
      TblPreVendaItem.First;
      while not TblPreVendaItem.eof do
      begin
        memo.Lines.Add('</ae>' + TblPreVendaItemDescricaoRed.AsString);
        memo.Lines.Add('</ad>         ' + FormatFloat('##00.00', TblPreVendaItemPVITN3QTD.Value) + '     ' + FormatFloat('R$ ##0.00', TblPreVendaItemPVITN3VLRUNIT.Value) + '          ' + FormatFloat('R$ ##0.00', TblPreVendaItemTotalItem.Value) + '   </n>');
        Total := Total + TblPreVendaItemTotalItem.Value;
        TotalDesconto := TotalDesconto + TblPreVendaItemValorDesconto.Value;
        TblPreVendaItem.Next;
      end;

    // Final Venda
      memo.Lines.Add('</ae>------------------------------------------------');
      memo.Lines.Add('</ad>ITENS R$ ' + FormatFloat('##0.00',Total)+'   ');
//      memo.Lines.Add('Troco   R$ ' + FormatFloat('##0.00',TblPreVendaCabTroco.Value)+'   ');
      memo.Lines.Add('Descto  R$ ' + FormatFloat('##0.00',TotalDesconto)+'   ');
      memo.Lines.Add('TOTAL   R$ ' + FormatFloat('##0.00',Total - TotalDesconto)+'   ');

//      memo.Lines.Add('------------------------------------------------');
//      memo.Lines.Add('</ad><n>TOTAL   R$ ' + FormatFloat('##0.00', Total) + '   </n>');
//      memo.Lines.Add('</ae>------------------------------------------------');
      memo.Lines.Add(' ');
      memo.Lines.Add(' ');
      memo.Lines.Add('</corte_parcial>');

      ACBrPosPrinter.Device.Ativar;
      ACBrPosPrinter.LinhasEntreCupons := StrToInt(Saltar);
      ACBrPosPrinter.Imprimir(Memo.Lines.Text);

    except
      on e: exception do
      begin
        showmessage('Ocorreu o seguinte erro: ' + e.message);
      end;
    end;

  finally
    TblPreVendaItem.Close;
    Application.Terminate;

  end;

end;

end.

