with
    fonte_modelo as (
        select *
        from {{ source('fonte_aw', 'ProductModel') }}
    )

    , renomeacao as (
        select cast (PRODUCTMODELID as int) as PK_MODELO_PRODUTO
             , cast (NAME as varchar) as MODELO_PRODUTO
--           , cast (CATALOGDESCRIPTION as varchar) as
--           , cast (INSTRUCTIONS as varchar) as
--           , cast (ROWGUID as varchar) as
             , cast (max (MODIFIEDDATE) as date) as DT_ALTERACAO
        from fonte_modelo
        group by PK_MODELO_PRODUTO
               , MODELO_PRODUTO
        order by PK_MODELO_PRODUTO
    )

select *
from renomeacao