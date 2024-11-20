with   
    categoria as (
        select *
        from {{ ref('stg__produto_categoria') }}
    )

    , subcategoria as (
        select *
        from {{ ref('stg__produto_subcategoria') }}
    )

    , produto as (
        select *
        from {{ ref('stg__produto_produto') }}
    )

    , modelo as (
        select *
        from {{ ref('stg__produto_modelo') }}
    )

    , pedido_detalhe as (
        select *
        from {{ ref('stg__fato_pedido_detalhe') }}
    )

    , produto_categoria as (
        select subcategoria.PK_SUBTIPO_PRODUTO
             , categoria.TIPO_PRODUTO as TIPO_PRODUTO
             , subcategoria.SUBTIPO_PRODUTO as SUBTIPO_PRODUTO
        from categoria
        left join subcategoria on categoria.PK_TIPO_PRODUTO = subcategoria.FK_TIPO_PRODUTO
    )

    , produto_completo as (
        select produto.PK_PRODUTO
             , produto.NOME_PRODUTO
             , produto.COR_PRODUTO
             , produto_categoria.TIPO_PRODUTO
             , produto_categoria.SUBTIPO_PRODUTO
             , modelo.MODELO_PRODUTO
             , produto.VALOR_PADRAO
             , MAX (produto.DT_ALTERACAO) as DT_ALTERACAO
        from produto
        left join produto_categoria on produto.FK_SUBTIPO_PRODUTO = produto_categoria.PK_SUBTIPO_PRODUTO
        left join modelo on produto.FK_MODELO_PRODUTO = modelo.PK_MODELO_PRODUTO
        group by produto.PK_PRODUTO
             , produto.NOME_PRODUTO
             , produto.COR_PRODUTO
             , produto_categoria.TIPO_PRODUTO
             , produto_categoria.SUBTIPO_PRODUTO
             , modelo.MODELO_PRODUTO
             , produto.VALOR_PADRAO
        order by PK_PRODUTO
    )

select *
from produto_completo
