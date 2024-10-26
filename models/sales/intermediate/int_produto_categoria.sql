with   
    categoria as (
        select *
        from {{ ref('stg__produto_categoria') }}
    )

    , subcategoria as (
        select *
        from {{ ref('stg__produto_subcategoria') }}
    )

    , produto_categoria as (
        select subcategoria.PK_SUBTIPO_PRODUTO
             , categoria.TIPO_PRODUTO as TIPO_PRODUTO
             , subcategoria.SUBTIPO_PRODUTO as SUBTIPO_PRODUTO
        from categoria
        left join subcategoria on categoria.PK_TIPO_PRODUTO = subcategoria.FK_TIPO_PRODUTO
    )

select *
from produto_categoria
