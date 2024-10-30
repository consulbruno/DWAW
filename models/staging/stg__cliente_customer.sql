with
    fonte_customer as (
        select *
        from {{ source('fonte_aw', 'Customer') }}
    )


    , renomeacao as (
        select cast (CUSTOMERID as int) as PK_CLIENTE
             , cast (PERSONID as int) as FK_PESSOA
 --          , cast (STOREID as varchar) as
 --          , cast (TERRITORYID as varchar) as
 --          , cast (ROWGUID as varchar) as
             , cast (max (MODIFIEDDATE) as date) as DT_ALTERACAO
        from fonte_customer
    )

select *
from renomeacao
