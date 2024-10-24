with
    endereco_preparacao as (
        select *
        from {{ ref('int_endereco_preparacao') }}
    )

    , tipo_endereco as (
        select *
        from {{ ref('int_endereco_tipo_endereco') }}
    )

    , endereco as (
        select tipo_endereco.PK_CLIENTE
             , endereco_preparacao.PK_ENDERECO
             , endereco_preparacao.NOME_CIDADE
             , endereco_preparacao.NOME_ESTADO
             , endereco_preparacao.NOME_PAIS
             , tipo_endereco.TIPO_ENDERECO
             , endereco_preparacao.DT_ALTERACAO
        from endereco_preparacao
        left join tipo_endereco on endereco_preparacao.PK_ENDERECO = tipo_endereco.FK_ENDERECO
    )

    select *
    from endereco
