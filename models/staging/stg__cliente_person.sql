with
    fonte_person as (
        select *
        from {{ source('fonte_aw', 'person') }}
    )


    , renomeacao as (
        select cast (BUSINESSENTITYID as int) as PK_CLIENTE
             , cast (PERSONTYPE as varchar) as TIPO_PESSOA
 --          , cast (NAMESTYLE as varchar) as 
 --          , cast (TITLE as
             , cast (FIRSTNAME || ' ' || LASTNAME as varchar) as NOME_CLIENTE
 --          , cast (MIDDLENAME as varchar) as
 --          , cast (SUFFIX as 
 --          , cast (EMAILPROMOTION as varchar) as 
 --          , cast (ADDITIONALCONTACTINFO as varchar) as 
 --          , cast (DEMOGRAPHICS as varchar) as 
 --          , cast (ROWGUID as varchar) as 
 --          , cast (MODIFIEDDATE as date) as DT_ALTERACAO
        from fonte_person
    )


select *
from renomeacao