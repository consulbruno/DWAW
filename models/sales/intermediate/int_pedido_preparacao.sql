with
    pedido as (
        select *
        from {{ ref('stg__fato_pedido_main') }}
    )

    , cartao as (
        select *
        from {{ ref('stg__fato_pedido_cartao') }}
    )

    , pedido_detalhe as (
        select *
        from {{ ref('stg__fato_pedido_detalhe') }}
    )

    , pedido_preparacao as (
        select pedido.PK_PEDIDO
             , pedido.FK_CLIENTE
             , pedido.FK_FUNCIONARIO
             , pedido_detalhe.FK_PRODUTO
             , pedido.FK_ENDERECO
             , pedido.DT_PEDIDO
             , pedido_detalhe.QUANTIDADE
             , pedido_detalhe.VALOR_UNITARIO
             , pedido_detalhe.DESCONTO_UNITARIO
             , CAST ((pedido.SUBTOTAL) as float) as SUBTOTAL
             , pedido.TAXA
             , pedido.FRETE
             , pedido.VALOR_TOTAL
             , cartao.TIPO_CARTAO as TIPO_CARTAO
             , CAST ((CASE WHEN pedido.TIPO_VENDA = 'TRUE' THEN 'ONLINE' ELSE 'LOJA' END) as varchar) as TIPO_PEDIDO
             , CAST ((CASE WHEN pedido.STATUS = 1 THEN 'In process' WHEN pedido.STATUS = 2 THEN 'Approved' WHEN pedido.STATUS = 3 THEN 'Backordered' WHEN pedido.STATUS = 4 THEN 'Rejected' WHEN pedido.STATUS = 5 THEN 'Shipped' WHEN pedido.STATUS = 6 THEN 'Cancelled' END) as varchar) as STATUS
             , MAX (pedido.DT_ALTERACAO) as DT_ALTERACAO
        from pedido
        left join cartao on pedido.FK_CARTAO = cartao.PK_CARTAO
        left join pedido_detalhe on pedido.PK_PEDIDO = pedido_detalhe.FK_PEDIDO
        group by pedido.PK_PEDIDO
               , pedido.FK_CLIENTE
               , pedido.FK_FUNCIONARIO
               , pedido_detalhe.FK_PRODUTO
               , pedido.FK_ENDERECO
               , pedido.DT_PEDIDO
               , pedido_detalhe.QUANTIDADE
               , pedido_detalhe.VALOR_UNITARIO
               , pedido_detalhe.DESCONTO_UNITARIO
               , pedido.SUBTOTAL
               , pedido.TAXA
               , pedido.FRETE
               , pedido.VALOR_TOTAL
               , cartao.TIPO_CARTAO
               , pedido.TIPO_VENDA
               , pedido.STATUS
        order by pedido.PK_PEDIDO
    )

    select *
    from pedido_preparacao
