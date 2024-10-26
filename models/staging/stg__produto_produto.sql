with
    fonte_produto as (
        select *
        from {{ source('fonte_aw', 'Product') }}
    )


    , renomeacao as (
        select cast (PRODUCTID as int) as PK_PRODUTO
             , cast (NAME as varchar) as NOME_PRODUTO
--           , cast (PRODUCTNUMBER as varchar) as
--           , cast (MAKEFLAG as varchar) as
--           , cast (FINISHEDGOODSFLAG as varchar) as
             , cast (COLOR as varchar) as COR_PRODUTO
--           , cast (SAFETYSTOCKLEVEL as varchar) as
--           , cast (REORDERPOINT as varchar) as
             , cast (STANDARDCOST as varchar) as VALOR_UNITARIO
--           , cast (LISTPRICE as varchar) as
--           , cast (SIZE as varchar) as
--           , cast (SIZEUNITMEASURECODE as varchar) as
--           , cast (WEIGHTUNITMEASURECODE as varchar) as
--           , cast (WEIGHT as varchar) as
--           , cast (DAYSTOMANUFACTURE as varchar) as
--           , cast (PRODUCTLINE as varchar) as
--           , cast (CLASS as varchar) as
--           , cast (STYLE as varchar) as
             , cast (PRODUCTSUBCATEGORYID as int) as FK_SUBTIPO_PRODUTO
             , cast (PRODUCTMODELID as int) as FK_MODELO_PRODUTO
--           , cast (SELLSTARTDATE as varchar) as
--           , cast (SELLENDDATE as varchar) as
--           , cast (DISCONTINUEDDATE as varchar) as
--           , cast (ROWGUID as varchar) as
             , cast (MODIFIEDDATE as date) as DT_ALTERACAO
        from fonte_produto
    )


select *
from renomeacao