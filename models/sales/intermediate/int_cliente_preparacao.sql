with
    person as (
        select *
        from {{ ref('stg__cliente_person') }}
    )

    , customer as (
        select *
        from {{ ref('stg__cliente_customer') }}
    )

    , cliente as (
        select customer.PK_CLIENTE
             , person.NOME_CLIENTE
             , MAX (person.DT_ALTERACAO) as DT_ALTERACAO
        from customer
        left join person on customer.FK_PESSOA = person.PK_PESSOA
        group by customer.PK_CLIENTE
               , person.NOME_CLIENTE
        order by person.NOME_CLIENTE
    )

    select *
    from cliente
