with
    fonte_subcategoria as (
        select *
        from {{ source('fonte_aw', 'ProductSubcategory') }}
    )


    , renomeacao as (
        select cast (PRODUCTSUBCATEGORYID as int) as PK_SUBTIPO_PRODUTO
             , cast (PRODUCTCATEGORYID as int) as FK_TIPO_PRODUTO
             , cast (NAME as varchar) as SUBTIPO_PRODUTO
--           , cast (ROWGUID as varchar) as
             , cast (max (MODIFIEDDATE) as date) as DT_ALTERACAO
        from fonte_subcategoria
        group by PK_SUBTIPO_PRODUTO
               , FK_TIPO_PRODUTO
               , SUBTIPO_PRODUTO
    )

select *
from renomeacao