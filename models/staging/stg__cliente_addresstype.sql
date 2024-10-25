with
    fonte_addresstype as (
        select *
        from {{ source('fonte_aw', 'AddressType') }}
    )


    , renomeacao as (
        select cast (ADDRESSTYPEID as int) as PK_TIPO_ENDERECO
             , cast (NAME as varchar) as TIPO_ENDERECO
--           , cast (ROWGUID as varchar) as
--           , cast (MODIFIEDDATE as varchar) as
        from fonte_addresstype
    )

select *
from renomeacao