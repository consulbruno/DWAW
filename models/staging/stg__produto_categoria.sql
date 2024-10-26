with
    fonte_categoria as (
        select *
        from {{ source('fonte_aw', 'ProductCategory') }}
    )


    , renomeacao as (
        select cast (PRODUCTCATEGORYID as int) as PK_TIPO_PRODUTO
             , cast (NAME as varchar) as TIPO_PRODUTO
 --          , cast (ROWGUID as varchar) as
             , cast (max (MODIFIEDDATE) as date) as DT_ALTERACAO
        from fonte_categoria
        group by PK_TIPO_PRODUTO
               , TIPO_PRODUTO
    )

select *
from renomeacao