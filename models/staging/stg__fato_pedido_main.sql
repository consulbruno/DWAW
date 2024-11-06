with
    fonte_pedido_main as (
        select *
        from {{ source('fonte_aw', 'SalesOrderHeader') }}
    )


    , renomeacao as (
        select cast (SALESORDERID as int) as PK_PEDIDO
--           , cast (REVISIONNUMBER as varchar) as
             , cast (ORDERDATE as date) as DT_PEDIDO
             , cast (DUEDATE as date) as DT_LIMITE_PEDIDO
--           , cast (SHIPDATE as varchar) as
             , cast (STATUS as int) as STATUS
             , cast (ONLINEORDERFLAG as varchar) as TIPO_VENDA
--           , cast (PURCHASEORDERNUMBER as varchar) as
--           , cast (ACCOUNTNUMBER as varchar) as
             , cast (CUSTOMERID as int) as FK_CLIENTE
             , cast (SALESPERSONID as int) as FK_FUNCIONARIO
--           , cast (TERRITORYID as varchar) as
--           , cast (BILLTOADDRESSID as varchar) as
             , cast (SHIPTOADDRESSID as int) as FK_ENDERECO_ENTREGA
--           , cast (SHIPMETHODID as varchar) as
             , cast (CREDITCARDID as int) as FK_CARTAO
--           , cast (CREDITCARDAPPROVALCODE as varchar) as
--           , cast (CURRENCYRATEID as varchar) as
             , cast (SUBTOTAL as float) as SUB_TOTAL
             , cast (TAXAMT as float) as TAXA
             , cast (FREIGHT as float) as FRETE
             , cast (TOTALDUE as float) as VALOR_TOTAL
--           , cast (COMMENT as varchar) as
--           , cast (ROWGUID as varchar) as
             , cast (MODIFIEDDATE as date) as DT_ALTERACAO
        from fonte_pedido_main
    )

select *
from renomeacao