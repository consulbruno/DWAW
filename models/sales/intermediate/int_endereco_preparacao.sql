with
    stateprovince as (
        select *
        from {{ ref('stg__cliente_stateprovince') }}
    )

    , countryregion as (
        select *
        from {{ ref('stg__cliente_countryregion') }}
    )

    , endereco_preparacao as (
        select stateprovince.PK_ESTADO
             , stateprovince.NOME_ESTADO
             , countryregion.NOME_PAIS
        from stateprovince
        left join countryregion on stateprovince.COD_PAIS = countryregion.COD_PAIS
    )

    select *
    from endereco_preparacao
