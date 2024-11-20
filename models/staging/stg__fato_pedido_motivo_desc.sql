with
    fonte_pedido_motivo_desc as (
        select *
        from {{ source('fonte_aw', 'SalesReason') }}
    )


    , renomeacao as (
        select cast (SALESREASONID as int) as PK_MOTIVO_PEDIDO
             , cast (NAME as varchar) as MOTIVO_PEDIDO
             , cast (REASONTYPE as varchar) as TIPO_MOTIVO
             , cast (MODIFIEDDATE as date) as DT_ALTERACAO
        from fonte_pedido_motivo_desc
    )

select *
from renomeacao