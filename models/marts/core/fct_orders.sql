with orderpayments as (

    select
        raw.jaffle_shop.orders.id as order_id,
        raw.jaffle_shop.customers.id as customer_id,
        amount

    from raw.stripe.payment
    left join raw.jaffle_shop.orders on (customer_id)
)

select * from payments