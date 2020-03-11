CREATE OR ALTER trigger atualizasaldoestoque for movimentoestoque
active after insert position 0
as
begin
  in autonomous transaction do
  begin
  if (NEW.MVESN3QTDENTRADA > 0) then
    update PRODUTOSALDO
    set PRODUTOSALDO.PSLDN3QTDE = PRODUTOSALDO.PSLDN3QTDE + NEW.MVESN3QTDENTRADA,
        PENDENTE = "S",
        REGISTRO =
        (select cast('NOW' as timestamp)
                    from RDB$DATABASE)
    where PRODUTOSALDO.EMPRICOD = NEW.EMPRICOD and
          PRODUTOSALDO.PRODICOD = NEW.PRODICOD;
  else
    update PRODUTOSALDO
    set PRODUTOSALDO.PSLDN3QTDE = PRODUTOSALDO.PSLDN3QTDE - NEW.MVESN3QTDSAIDA,
        PENDENTE = "S",
        REGISTRO = (select cast('NOW' as timestamp)
                    from RDB$DATABASE)
    where PRODUTOSALDO.EMPRICOD = NEW.EMPRICOD and
          PRODUTOSALDO.PRODICOD = NEW.PRODICOD;
   end
end