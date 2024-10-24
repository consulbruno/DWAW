with
    fonte_businessentityaddress as (
        select *
        from {{ source('fonte_aw', 'BusinessEntityAddress') }}
    )


    , renomeacao as (
        select cast (BUSINESSENTITYID as int) as PK_CLIENTE
             , cast (ADDRESSID as int) as FK_ENDERECO
             , cast (ADDRESSTYPEID as int) as FK_TIPO_ENDERECO
--             , cast (ROWGUID as varchar) as 
--             , cast (MODIFIEDDATE as varchar) as 
        from fonte_businessentityaddress
    )

select *
from renomeacao
