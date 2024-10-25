with

    addresstype as (
        select *
        from {{ ref('stg__cliente_addresstype') }}
    )

    , businessentityaddress as (
        select *
        from {{ ref('stg__cliente_businessentityaddress') }}
    )

    , tipo_endereco as (
        select businessentityaddress.PK_CLIENTE
             , businessentityaddress.FK_ENDERECO
             , addresstype.TIPO_ENDERECO
        from businessentityaddress
        left join addresstype on businessentityaddress.FK_TIPO_ENDERECO = addresstype.PK_TIPO_ENDERECO
    )

    select *
    from tipo_endereco
