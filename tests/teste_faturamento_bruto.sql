with 
    pedido_detalhe as (
        select *
        from {{ ref('dim_pedido_detalhe') }}
    )

    , pedido as (
        select *
        from {{ ref('fato_pedido') }}
    )

    , teste as (
        select ROUND(SUM(b.VALOR_UNITARIO * b.QUANTIDADE)) as Fat
        from pedido a
        left join pedido_detalhe b on a.PK_PEDIDO = b.FK_PEDIDO
        where a.DT_PEDIDO >= '2011-01-01' and a.DT_PEDIDO < '2012-01-01'
    )

select Fat
from teste
where Fat <> 12646112


