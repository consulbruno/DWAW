with   
    employee as (
        select *
        from {{ ref('stg__funcionario_funcionario') }}
    )

    , person as (
        select *
        from {{ ref('stg__cliente_person') }}
    )

    , departamento as (
        select *
        from {{ ref('int_funcionario_departamento') }}
    )

    , funcionario as (
        select cast (employee.PK_FUNCIONARIO as int) as PK_FUNCIONARIO
             , cast (person.NOME_CLIENTE as varchar) as NOME_FUNCIONARIO
             , cast (employee.DT_NASCIMENTO_FUNCIONARIO as date) as DT_NASCIMENTO_FUNCIONARIO
             , cast (employee.GENERO_FUNCIONARIO as varchar) as GENERO_FUNCIONARIO
             , cast (employee.LOGIN_FUNCIONARIO as varchar) as LOGIN_FUNCIONARIO
             , cast (employee.CARGO_FUNCIONARIO as varchar) as CARGO_FUNCIONARIO
             , cast (employee.DT_CONTRATACAO_FUNCIONARIO as date) as DT_CONTRATACAO_FUNCIONARIO
             , cast (departamento.NOME_DEPTO as varchar) as DEPTO_FUNCIONARIO
             , cast (departamento.GRUPO_DEPTO as varchar) as GRUPO_DEPTO
--           , cast (employee.DT_ALTERACAO as date) as DT_ALTERACAO
        from employee
        left join person on employee.PK_FUNCIONARIO = person.PK_PESSOA
        left join departamento on employee.PK_FUNCIONARIO = departamento.PK_FUNCIONARIO
    )

    select *
    from funcionario
    