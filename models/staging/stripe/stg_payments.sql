with payments as (

    select
        id as customer_id,
        amount

    from raw.stripe.payment

)

select * from payments