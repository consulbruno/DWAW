with   
    categoria as (
        select *
        from {{ ref('int_produto_categoria') }}
    )

    , produto as (
        select *
        from {{ ref('stg__produto_produto') }}
    )

    , modelo as (
        select *
        from {{ ref('stg__produto_modelo') }}
    )

    , produto_completo as (
        select produto.PK_PRODUTO
             , produto.NOME_PRODUTO
             , produto.COR_PRODUTO
             , categoria.TIPO_PRODUTO
             , categoria.SUBTIPO_PRODUTO
             , modelo.MODELO_PRODUTO
             , produto.VALOR_UNITARIO
             , produto.DT_ALTERACAO
        from produto
        left join categoria on produto.FK_SUBTIPO_PRODUTO = categoria.PK_SUBTIPO_PRODUTO
        left join modelo on produto.FK_MODELO_PRODUTO = modelo.PK_MODELO_PRODUTO
        order by PK_PRODUTO
    )

select *
from produto_completo
