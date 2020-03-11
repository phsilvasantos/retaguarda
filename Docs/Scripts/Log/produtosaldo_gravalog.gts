CREATE OR ALTER trigger produtosaldo_gravalog for produtosaldo
active after update position 0
as
declare variable VCAMINHO_BANCO_LOG type of column CONFIGGERAL.CAMINHO_BANCO_LOG;
begin
  for select CAMINHO_BANCO_LOG
      from CONFIGGERAL
      into :VCAMINHO_BANCO_LOG
  do
  begin
  end
  if (VCAMINHO_BANCO_LOG <> '') then
    execute procedure SP_POST_PRODUTO_SALDO(new.PRODICOD, (select cast('NOW' as timestamp) from RDB$DATABASE),
        new.EMPRICOD, (coalesce(new.PSLDN3QTDE, 0) - coalesce(old.PSLDN3QTDE, 0)), :VCAMINHO_BANCO_LOG);
end