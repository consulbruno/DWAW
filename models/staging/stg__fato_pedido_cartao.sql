with
    fonte_cartao as (
        select *
        from {{ source('fonte_aw', 'CreditCard') }}
    )


    , renomeacao as (
        select cast (CREDITCARDID as int) as PK_CARTAO
             , cast (CARDTYPE as varchar) as TIPO_CARTAO
--           , cast (CARDNUMBER as varchar) as
--           , cast (EXPMONTH as varchar) as
--           , cast (EXPYEAR as varchar) as
             , cast (max(MODIFIEDDATE) as date) as DT_ALTERACAO
        from fonte_cartao
        group by CREDITCARDID
               , CARDTYPE
    )

select *
from renomeacao