create or alter procedure SP_LIMITE_SANGRIA (
    DATAINICIAL date,
    DATAFINAL date,
    TERMINAL integer)
returns (
    TOTAL_SANGRIA numeric(15,2))
as
declare variable VVALOR_SANGRIA numeric(15,2);
declare variable VVALOR_VENDA numeric(15,2);
begin
  for select sum(MOVIMENTOCAIXA.MVCXN2VLRCRED)
      from MOVIMENTOCAIXA
      inner join NUMERARIO on NUMERARIO.NUMEICOD = MOVIMENTOCAIXA.NUMEICOD
      where NUMERARIO.NUMEA5TIPO = 'DIN' and
            MOVIMENTOCAIXA.TERMICOD = :TERMINAL and
            MOVIMENTOCAIXA.MVCXDMOV between :DATAINICIAL and :DATAFINAL
      into :VVALOR_VENDA
  do
  begin
  end
  for select sum(MVCXN2VLRDEB)
      from MOVIMENTOCAIXA
      inner join OPERACAOCAIXA on OPERACAOCAIXA.OPCXICOD = MOVIMENTOCAIXA.OPCXICOD
      where OPCXA5SIGLA = 'SANGR' and
            MOVIMENTOCAIXA.TERMICOD = :TERMINAL and
            MOVIMENTOCAIXA.MVCXDMOV between :DATAINICIAL and :DATAFINAL

      into :VVALOR_SANGRIA
  do
  begin

  end

  TOTAL_SANGRIA = COALESCE(:VVALOR_VENDA,0) - COALESCE(:VVALOR_SANGRIA,0);
  suspend;
end;