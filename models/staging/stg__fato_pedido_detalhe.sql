with
    fonte_pedido_detalhe as (
        select *
        from {{ source('fonte_aw', 'SalesOrderDetail') }}
    )


    , renomeacao as (
        select cast (SALESORDERID as int) as FK_PEDIDO
             , cast (SALESORDERDETAILID as int) as PK_PEDIDO_DETALHE
             , cast (CARRIERTRACKINGNUMBER as int) as RASTREIO 
             , cast (ORDERQTY as int) as QUANTIDADE
             , cast (PRODUCTID as int) as FK_PRODUTO
--           , cast (SPECIALOFFERID as varchar) as
             , cast (UNITPRICE as float) as VALOR_UNITARIO
             , cast (UNITPRICEDISCOUNT as float) as DESCONTO_UNITARIO
--           , cast (ROWGUID as varchar) as
             , cast (max (MODIFIEDDATE) as date) as DT_ALTERACAO
        from fonte_pedido_detalhe
        group by SALESORDERID
               , SALESORDERDETAILID
               , CARRIERTRACKINGNUMBER
               , ORDERQTY
               , PRODUCTID
               , UNITPRICE
               , UNITPRICEDISCOUNT
    )

select *
from renomeacao