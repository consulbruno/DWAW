with
    fonte_countryregion as (
        select *
        from {{ source('fonte_aw', 'CountryRegion') }}
    )


    , renomeacao as (
        select cast (COUNTRYREGIONCODE as varchar) as COD_PAIS
             , cast (NAME as varchar) as NOME_PAIS
             , cast (MODIFIEDDATE as date) as DT_ALTERACAO
        from fonte_countryregion
        group by COUNTRYREGIONCODE
               , NAME
    )

select *
from renomeacao