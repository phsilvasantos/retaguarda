create or alter procedure SP_EXCLUI_MOVIMENTO_ESTOQUE (
    ID_NOTA char(13),
    ID_PRODUTO integer,
    EMPRESA integer,
    QTDE numeric(15,3))
as
begin
  delete from MOVIMENTOESTOQUE M
  where M.EMPRICOD = :EMPRESA and
        M.PRODICOD = :ID_PRODUTO and
        M.NOFIA13ID = :ID_NOTA;

  if (QTDE > 0) then
    update PRODUTOSALDO PS
    set PS.PSLDN3QTDE = PS.PSLDN3QTDE + :QTDE,
        PENDENTE = "S",
        REGISTRO = (select cast('NOW' as timestamp)
                    from RDB$DATABASE)
    where PS.EMPRICOD = :EMPRESA and
          PS.PRODICOD = :ID_PRODUTO;
  suspend;
end