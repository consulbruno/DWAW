with
    pedido as (
        select *
        from {{ ref('stg__fato_pedido_main') }}
    )

    , cartao as (
        select *
        from {{ ref('stg__fato_pedido_cartao') }}
    )

    , pedido_preparacao as (
        select pedido.PK_PEDIDO
             , pedido.FK_CLIENTE
             , pedido.FK_FUNCIONARIO
             , pedido.FK_ENDERECO
             , pedido.DT_PEDIDO
             , CAST ((pedido.SUBTOTAL) as float) as SUBTOTAL
             , pedido.TAXA
             , pedido.FRETE
             , pedido.VALOR_TOTAL
             , cartao.TIPO_CARTAO as TIPO_CARTAO
             , CAST ((CASE WHEN pedido.TIPO_VENDA = 'TRUE' THEN 'ONLINE' ELSE 'LOJA' END) as varchar) as TIPO_PEDIDO
             , CAST ((CASE WHEN pedido.STATUS = 1 THEN 'In process' WHEN pedido.STATUS = 2 THEN 'Approved' WHEN pedido.STATUS = 3 THEN 'Backordered' WHEN pedido.STATUS = 4 THEN 'Rejected' WHEN pedido.STATUS = 5 THEN 'Shipped' WHEN pedido.STATUS = 6 THEN 'Cancelled' END) as varchar) as STATUS
             , pedido.DT_ALTERACAO
        from pedido
        left join cartao on pedido.FK_CARTAO = cartao.PK_CARTAO
    )

    select *
    from pedido_preparacao
