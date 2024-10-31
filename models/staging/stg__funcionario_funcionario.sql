with
    fonte_funcionario as (
        select *
        from {{ source('fonte_aw', 'Employee') }}
    )


    , renomeacao as (
        select cast (BUSINESSENTITYID as int) as PK_FUNCIONARIO
--           , cast (NATIONALIDNUMBER as int) as
             , cast (LOGINID as varchar) as LOGIN_FUNCIONARIO
             , cast (JOBTITLE as varchar) as CARGO_FUNCIONARIO
             , cast (BIRTHDATE as date) as DT_NASCIMENTO_FUNCIONARIO
 --          , cast (MARITALSTATUS as varchar) as
             , cast (GENDER as varchar) as GENERO_FUNCIONARIO
             , cast (HIREDATE as date) as DT_CONTRATACAO_FUNCIONARIO
 --          , cast (SALARIEDFLAG as varchar) as
 --          , cast (VACATIONHOURS as varchar) as
 --          , cast (SICKLEAVEHOURS as varchar) as
 --          , cast (CURRENTFLAG as varchar) as
 --          , cast (ROWGUID as varchar) as
             , cast (max (MODIFIEDDATE) as date) as DT_ALTERACAO
 --          , cast (ORGANIZATIONNODE as varchar) as 
        from fonte_funcionario
        group by BUSINESSENTITYID
               , LOGINID
               , JOBTITLE
               , BIRTHDATE 
               , GENDER
               , HIREDATE
    )

select *
from renomeacao