with
    department as (
        select *
        from {{ ref('stg__funcionario_departamento') }}
    )

    , employeedepartmenthistory as (
        select *
        from {{ ref('stg__funcionario_departamento_funcionario') }}
    )

    , funcionario_departamento as (
        select cast (employeedepartmenthistory.PK_FUNCIONARIO as int) as PK_FUNCIONARIO
             , cast (department.NOME_DEPTO as varchar) as NOME_DEPTO
             , cast (department.GRUPO_DEPTO as varchar) as GRUPO_DEPTO
--           , cast (MAX (employeedepartmenthistory.DT_ALTERACAO) as date) as DT_ALTERACAO
        from employeedepartmenthistory
        left join department on employeedepartmenthistory.FK_DEPTO = department.PK_DEPTO
    )

    select *
    from funcionario_departamento
    