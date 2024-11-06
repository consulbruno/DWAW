with
    address as (
        select *
        from {{ ref('stg__cliente_address') }}
    )

    , endereco_preparacao as (
        select *
        from {{ ref('int_endereco_preparacao') }}
    )

    , endereco_completo as (
        select address.PK_ENDERECO
             , address.NOME_CIDADE
             , endereco_preparacao.NOME_ESTADO
             , endereco_preparacao.NOME_PAIS
             , address.DT_ALTERACAO
        from address
        left join endereco_preparacao on address.FK_ESTADO = endereco_preparacao.PK_ESTADO
    )

    select *
    from endereco_completo
