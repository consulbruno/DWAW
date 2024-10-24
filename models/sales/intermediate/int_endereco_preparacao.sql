with
    person as (
        select *
        from {{ ref('stg__cliente_person') }}
    )

    , stateprovince as (
        select *
        from {{ ref('stg__cliente_stateprovince') }}
    )

    , address as (
        select *
        from {{ ref('stg__cliente_address') }}
    )

    , countryregion as (
        select *
        from {{ ref('stg__cliente_countryregion') }}
    )

    , endereco_preparacao as (
        select address.PK_ENDERECO
             , address.NOME_CIDADE
             , stateprovince.NOME_ESTADO
             , countryregion.NOME_PAIS
             , address.DT_ALTERACAO
        from stateprovince
        left join address on stateprovince.PK_ESTADO_EUA = address.FK_ESTADO_EUA
        left join countryregion on stateprovince.COD_PAIS = countryregion.COD_PAIS
    )

    select *
    from endereco_preparacao
