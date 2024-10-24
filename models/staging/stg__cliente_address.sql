with
    fonte_address as (
        select *
        from {{ source('fonte_aw', 'Address') }}
    )


    , renomeacao as (
        select cast (ADDRESSID as int) as PK_ENDERECO
 --         ,  cast (ADDRESSLINE1 as varchar) as 
 --         ,  cast (ADDRESSLINE2 as varchar) as 
            ,  cast (CITY as varchar) as NOME_CIDADE
            ,  cast (STATEPROVINCEID as int) as FK_ESTADO_EUA
 --         ,  cast (POSTALCODE as varchar) as 
 --         ,  cast (SPATIALLOCATION as varchar) as 
 --         ,  cast (ROWGUID as varchar) as
            ,  cast (MODIFIEDDATE as date) as DT_ALTERACAO
        from fonte_address
    )


select *
from renomeacao