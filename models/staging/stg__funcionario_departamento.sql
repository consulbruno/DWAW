with
    departamento as (
        select *
        from {{ source('fonte_aw', 'Department') }}
    )


    , renomeacao as (
        select cast (DEPARTMENTID as int) as PK_DEPTO
             , cast (NAME as varchar) as NOME_DEPTO
             , cast (GROUPNAME as varchar) as GRUPO_DEPTO
             , cast (max (MODIFIEDDATE) as date) as DT_ALTERACAO
        from departamento
        group by DEPARTMENTID
               , NAME
               , GROUPNAME
    )

select *
from renomeacao