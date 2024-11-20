with 
   pedido as (
        select *
        from {{ ref('fato_pedido') }}
    )

    , teste as (
        select ROUND(SUM(VALOR_UNITARIO * QUANTIDADE)) as Fat
        from pedido a
        where DT_PEDIDO >= '2011-01-01' and DT_PEDIDO < '2012-01-01'
    )

select Fat
from teste
where Fat <> 12646112


