create or alter procedure SP_GRAVA_MOVIMENTO_ESTOQUE (
    ID_EMPRESA integer,
    ID_PRODUTO integer,
    DATA_MOVIMENTO date,
    ID_OPERACAO integer,
    QTDE_ENTRADA numeric(15,3),
    QTDE_SAIDA numeric(15,3),
    ID_CUPOM char(13),
    ESTOQUE_OK char(1),
    PENDENTE char(1),
    DATA_REGISTRO date)
as
declare variable XCONTADOR integer;
begin

  for select coalesce(max(MVESICOD), 0) + 1 as CONTADOR
      from MOVIMENTOESTOQUE
      where EMPRICOD = :ID_EMPRESA and
            MVESDMOV = :DATA_MOVIMENTO
      into :XCONTADOR
  do
  begin
  end
    insert into MOVIMENTOESTOQUE (EMPRICOD, MVESDMOV, MVESICOD, PRODICOD, OPESICOD, MVESN3QTDENTRADA, MVESN3QTDSAIDA,
                                  CUPOA13ID, MVESCESTOQUEOK, PENDENTE, REGISTRO)
    values (:ID_EMPRESA, :DATA_MOVIMENTO, :XCONTADOR, :ID_PRODUTO, :ID_OPERACAO, :QTDE_ENTRADA, :QTDE_SAIDA, :ID_CUPOM,
            :ESTOQUE_OK, :PENDENTE, :DATA_REGISTRO);

end