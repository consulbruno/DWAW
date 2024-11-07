with
    pedido_desc as (
        select *
        from {{ ref('stg__fato_pedido_detalhe') }}
    )

    , pedido_detalhe as (
        select FK_PEDIDO
             , PK_PEDIDO_DETALHE
             , FK_PRODUTO
             , QUANTIDADE
             , VALOR_UNITARIO
             , DESCONTO_UNITARIO
             , DT_ALTERACAO
        from pedido_desc
    )

    select *
    from pedido_detalhe
