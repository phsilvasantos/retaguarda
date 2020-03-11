create or alter procedure SP_POST_PRODUTO_SALDO (
    ID_PRODUTO integer,
    DATA_MOVIMENTO date,
    ID_EMPRESA integer,
    QTDE numeric(15,3),
    CAMINHO_BANCO varchar(200))
as
declare variable XSQL varchar(3000);
begin

  XSQL = 'insert into LOG_PRODUTO_SALDO (PRODICOD, QTDE, DATA_MOVIMENTO, EMPRICOD) values (' || :ID_PRODUTO || ',''' || :QTDE || ''',''' || :DATA_MOVIMENTO || ''',' || :ID_EMPRESA || ')';

  execute statement :XSQL on external :CAMINHO_BANCO as user 'SYSDBA' password 'masterkey' with common transaction;

  suspend;
end