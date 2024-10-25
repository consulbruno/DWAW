with
    fonte_countryregion as (
        select *
        from {{ source('fonte_aw', 'CountryRegion') }}
    )


    , renomeacao as (
        select cast (COUNTRYREGIONCODE as varchar) as COD_PAIS
             , cast (NAME as varchar) as NOME_PAIS
 --          , cast (MODIFIEDDATE as varchar) as
        from fonte_countryregion
    )

select *
from renomeacao