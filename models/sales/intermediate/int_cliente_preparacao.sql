with
    person as (
        select *
        from {{ ref('stg__cliente_person') }}
    )

    , endereco as (
        select *
        from {{ ref('int_endereco_completo') }}
    )

    , customer as (
        select *
        from {{ ref('stg__cliente_customer') }}
    )

    , cliente as (
        select customer.FK_PESSOA as PK_CLIENTE
             , person.NOME_CLIENTE
             , endereco.NOME_CIDADE as CIDADE_CLIENTE
             , endereco.NOME_ESTADO as ESTADO_CLIENTE
             , endereco.NOME_PAIS as PAIS_CLIENTE
             , endereco.TIPO_ENDERECO
             , endereco.DT_ALTERACAO
        from person
        left join endereco on person.PK_CLIENTE = endereco.PK_CLIENTE
        left join customer on person.PK_CLIENTE = customer.FK_PESSOA
    )

    select *
    from cliente
