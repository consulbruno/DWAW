with
    motivo as (
        select *
        from {{ ref('int_pedido_motivo') }}
    )

    , pedido as (
        select *
        from {{ ref('stg__fato_pedido_main') }}
    )

    , pedido_desc as (
        select *
        from {{ ref('stg__fato_pedido_detalhe') }}
    )

    , endereco as (
        select *
        from {{ ref('int_endereco_completo') }}
    )

    , pedido_completo as (
        select pedido.PK_PEDIDO
             , pedido.FK_CLIENTE
             , pedido_desc.FK_PRODUTO
             , pedido.FK_FUNCIONARIO
             , pedido.DT_PEDIDO
             , endereco.NOME_CIDADE as CIDADE_DESTINATARIO
             , endereco.NOME_ESTADO as ESTADO_DESTINATARIO
             , endereco.NOME_PAIS as PAIS_DESTINATARIO
             , pedido_desc.QUANTIDADE
             , CAST ((pedido_desc.VALOR_UNITARIO - pedido_desc.DESCONTO_UNITARIO) as float) as VALOR_UNITARIO
             , CAST ((pedido.VALOR_TOTAL - pedido.FRETE) as float) as VALOR_TOTAL
             , CAST ((CASE WHEN pedido.TIPO_VENDA = 'TRUE' THEN 'ONLINE' ELSE 'LOJA' END) as varchar) as TIPO_PEDIDO
             , motivo.MOTIVO_PEDIDO
             , CAST ((CASE WHEN pedido.STATUS = 1 THEN 'In process' WHEN pedido.STATUS = 2 THEN 'Approved' WHEN pedido.STATUS = 3 THEN 'Backordered' WHEN pedido.STATUS = 4 THEN 'Rejected' WHEN pedido.STATUS = 5 THEN 'Shipped' WHEN pedido.STATUS = 6 THEN 'Cancelled' END) as varchar) as STATUS
             , pedido.DT_ALTERACAO
        from pedido
        left join endereco on pedido.FK_ENDERECO_ENTREGA = endereco.PK_ENDERECO
        left join pedido_desc on pedido.PK_PEDIDO = pedido_desc.FK_PEDIDO
        left join motivo on pedido.PK_PEDIDO = motivo.FK_PEDIDO
    )

    select *
    from pedido_completo
