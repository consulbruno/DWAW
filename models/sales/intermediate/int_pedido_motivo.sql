with
    motivo_join as (
        select *
        from {{ ref('stg__fato_pedido_motivo') }}
    )

    , motivo as (
        select *
        from {{ ref('stg__fato_pedido_motivo_desc') }}
    )

    , pedido_motivo as (
        select motivo_join.FK_PEDIDO
             , motivo.MOTIVO_PEDIDO
             , max (motivo.DT_ALTERACAO)
        from motivo_join
        left join motivo on motivo_join.FK_MOTIVO_PEDIDO = motivo.PK_MOTIVO_PEDIDO
        group by motivo_join.FK_PEDIDO
               , motivo.MOTIVO_PEDIDO
    )

    select *
    from pedido_motivo