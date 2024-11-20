with
    motivo as (
        select *
        from {{ ref('stg__fato_pedido_motivo_desc') }}
    )

    , motivo_join as (
        select *
        from {{ ref('stg__fato_pedido_motivo') }}
    )

    , pedido_motivo as (
        select b.FK_PEDIDO
             , a.PK_MOTIVO_PEDIDO
             , a.MOTIVO_PEDIDO
             , a.TIPO_MOTIVO
             , MAX (b.DT_ALTERACAO) as DT_ALTERACAO
        from motivo_join b
        left join motivo a on b.FK_MOTIVO_PEDIDO = a.PK_MOTIVO_PEDIDO
        group by b.FK_PEDIDO
               , a.PK_MOTIVO_PEDIDO
               , a.MOTIVO_PEDIDO
               , a.TIPO_MOTIVO
    )

    select *
    from pedido_motivo