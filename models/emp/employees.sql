with employees as (

    select
        birth_date,
        emp_no,
        emp_title_id,
        first_name,
        last_name,
        sex,
        hire_date

    from PC_FIVETRAN_DB.AVSTEP3.EMPLOYEES
),

salaries as (
    select
        emp_no,
        salary

from PC_FIVETRAN_DB.AVSTEP3.SALARIES
),

departures as (
    select
        emp_no,
        exit_date,
        exit_reason

from PC_FIVETRAN_DB.AVSTEP3.DEPARTURES
),

final as (
    select
        PC_FIVETRAN_DB.AVSTEP3.EMPLOYEES.birth_date,
        PC_FIVETRAN_DB.AVSTEP3.EMPLOYEES.emp_no,
        PC_FIVETRAN_DB.AVSTEP3.EMPLOYEES.emp_title_id,
        PC_FIVETRAN_DB.AVSTEP3.EMPLOYEES.first_name,
        PC_FIVETRAN_DB.AVSTEP3.EMPLOYEES.last_name,
        PC_FIVETRAN_DB.AVSTEP3.EMPLOYEES.sex,
        PC_FIVETRAN_DB.AVSTEP3.EMPLOYEES.hire_date,
        PC_FIVETRAN_DB.AVSTEP3.SALARIES.salary,
        PC_FIVETRAN_DB.AVSTEP3.DEPARTURES.exit_date,
        PC_FIVETRAN_DB.AVSTEP3.DEPARTURES.exit_reason

    FROM PC_FIVETRAN_DB.AVSTEP3.EMPLOYEES

    left join PC_FIVETRAN_DB.AVSTEP3.SALARIES using (emp_no)
    left join PC_FIVETRAN_DB.AVSTEP3.DEPARTURES using (emp_no)

    )

    select * from final

