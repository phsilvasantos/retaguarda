CREATE OR ALTER trigger notaservico_comunicacao_ai0 for notaservico_comunicacao
active after insert position 0
AS
begin
  if (new.TIPO = '1') then
    update NOTASERVICO set STATUS = 'E' where ID = new.ID_NOTASERVICO;
  else
    if (new.TIPO = '2') then
    update NOTASERVICO set STATUS = 'C' where ID = new.ID_NOTASERVICO;
end;