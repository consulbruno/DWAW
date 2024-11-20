with
    address as (
        select *
        from {{ ref('stg__cliente_address') }}
    )

    , stateprovince as (
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

    , endereco_completo as (
        select address.PK_ENDERECO
             , address.NOME_CIDADE
             , endereco_preparacao.NOME_ESTADO
             , endereco_preparacao.NOME_PAIS
             , MAX (address.DT_ALTERACAO) as DT_ALTERACAO
        from address
        left join endereco_preparacao on address.FK_ESTADO = endereco_preparacao.PK_ESTADO
        group by address.PK_ENDERECO
               , address.NOME_CIDADE
               , endereco_preparacao.NOME_ESTADO
               , endereco_preparacao.NOME_PAIS
    )

    select *
    from endereco_completo
