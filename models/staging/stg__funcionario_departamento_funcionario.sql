with
    departamento_funcionario as (
        select *
        from {{ source('fonte_aw', 'EmployeeDepartmentHistory') }}
    )


    , renomeacao as (
        select cast (BUSINESSENTITYID as int) as PK_FUNCIONARIO
             , cast (DEPARTMENTID as int) as FK_DEPTO
--           , cast (SHIFTID as int) as
--           , cast (STARTDATE as date) as
             , cast (ENDDATE as date) as DT_FINAL
 --          , cast (max (MODIFIEDDATE) as date) as DT_ALTERACAO
        from departamento_funcionario
        where ENDDATE is null
    )

select *
from renomeacao
