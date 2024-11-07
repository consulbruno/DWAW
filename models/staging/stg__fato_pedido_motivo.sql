with
    fonte_pedido_motivo as (
        select *
        from {{ source('fonte_aw', 'SalesOrderHeaderSalesReason') }}
    )


    , renomeacao as (
        select cast (SALESORDERID as int) as FK_PEDIDO
             , cast (SALESREASONID as int) as FK_MOTIVO_PEDIDO
             , cast (max (MODIFIEDDATE) as date) as DT_ALTERACAO
        from fonte_pedido_motivo
        group by SALESORDERID
               , SALESREASONID
    )

select *
from renomeacao