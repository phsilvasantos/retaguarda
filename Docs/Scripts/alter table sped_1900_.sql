CREATE OR ALTER VIEW SPED_1900(
    VLR_ICMS_ST,
    VLR_ICMS,
    TIPO,
    EMPRESA,
    DT_EMISSAO,
    CHAVEACESSO,
    CST,
    STATUS,
    NRO_NOTA,
    SERIE,
    COD_PRODUTO,
    CLIFOR,
    MODELO,
    ALIQ_ICMS_ST,
    ALIQ_RED_BASE_ST,
    TOTAL_ITEM)
AS
select coalesce(NCI.NOCIN3VLRSUBST, 0), coalesce(NCI.NOCIN3VLRICMS, 0), 'NFE', NC.EMPRICOD, NC.NOCPDEMISSAO,
       NC.NOFIA44CHAVEACESSO, NCI.NOCIA3CSTICMS, NC.NOCPCSTATUS, NC.NOCPA30NRO, NC.NOCPA5SERIE, NCI.PRODICOD,
       NC.FORNICOD, '55', 0, 0, 0
from NOTACOMPRA NC
inner join NOTACOMPRAITEM NCI on NC.NOCPA13ID = NCI.NOCPA13ID
where NC.NOCPCSTATUS = 'E' and
      NC.NOFIA44CHAVEACESSO is not null
union
select
       case
         when NFI.NFITN2VLRICMS > 0 then 0
         else coalesce(NFI.NFITN3QUANT, 0) * coalesce(NFI.NFITN2VLRUNIT, 0)
       end,
       coalesce(NFI.NFITN2VLRICMS, 0), 'NFS', NF.EMPRICOD, NF.NOFIDEMIS, NF.NOFIA44CHAVEACESSO, NFI.NFITICST,
       NF.NOFICSTATUS, NF.NOFIINUMERO, NF.SERIA5COD, NFI.PRODICOD, NF.CLIEA13ID, '55', N.ALIQ_ICMSST,
       N.ALIQ_RED_BASE_ST,((NFI.NFITN3QUANT * NFI.NFITN2VLRUNIT) - NFI.NFITN2VLRDESC) TOTAL_ITEM
from NOTAFISCAL NF
inner join NOTAFISCALITEM NFI on NF.NOFIA13ID = NFI.NOFIA13ID
inner join PRODUTO P on P.PRODICOD = NFI.PRODICOD
left join NCM N on P.NCMICOD = N.NCMICOD
where NF.NOFICSTATUS = 'E'
union
select
       case
         when CFI.CPITN2VLRICMS > 0 then 0
         else coalesce(CFI.CPITN3QTD, 0) * coalesce(CFI.CPITN3VLRUNIT, 0)
       end,
       coalesce(CFI.CPITN2VLRICMS, 0), 'NFS', CF.EMPRICOD, CF.CUPODEMIS, CF.CHAVEACESSO, P.PRODISITTRIB, 'E',
       CF.CUPOINRO, CF.TERMICOD, CFI.PRODICOD, CF.CUPOA13ID, '65', N.ALIQ_ICMSST, N.ALIQ_RED_BASE_ST, CFI.TOTAL_ITEM
from CUPOM CF
inner join CUPOMITEM CFI on CF.CUPOA13ID = CFI.CUPOA13ID
inner join PRODUTO P on P.PRODICOD = CFI.PRODICOD
left join NCM N on P.NCMICOD = N.NCMICOD
where CF.STNFE is not null
;