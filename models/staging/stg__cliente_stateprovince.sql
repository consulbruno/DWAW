with
    fonte_stateprovince as (
        select *
        from {{ source('fonte_aw', 'StateProvince') }}
    )


    , renomeacao as (
        select cast (STATEPROVINCEID as int) as PK_ESTADO_EUA
 --          , cast (STATEPROVINCECODE as varchar) as
             , cast (COUNTRYREGIONCODE as varchar) as COD_PAIS
             , cast (ISONLYSTATEPROVINCEFLAG as boolean) as FLAG_EH_SO_ESTADO
             , cast (NAME as varchar) as NOME_ESTADO
 --          , cast (TERRITORYID as varchar) as
 --          , cast (ROWGUID as varchar) as
 --          , cast (MODIFIEDDATE as varchar) as
        from fonte_stateprovince
    )

select *
from renomeacao