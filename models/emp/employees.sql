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

dept_emp as (
    select
        dept_no,
        emp_no

from PC_FIVETRAN_DB.AVSTEP3.DEPT_EMP
),

titles as (
    select
        title,
        title_id

from PC_FIVETRAN_DB.AVSTEP3.TITLES
),

final AS (
    SELECT
        e.birth_date,
        e.emp_no,
        e.emp_title_id,
        e.first_name,
        e.last_name,
        e.sex,
        e.hire_date,
        s.salary,
        d.exit_date,
        d.exit_reason,
        t.title,
        de.dept_no
    FROM PC_FIVETRAN_DB.AVSTEP3.EMPLOYEES e
    LEFT JOIN PC_FIVETRAN_DB.AVSTEP3.SALARIES s
        ON e.emp_no = s.emp_no
    LEFT JOIN PC_FIVETRAN_DB.AVSTEP3.DEPARTURES d
        ON e.emp_no = d.emp_no
    LEFT JOIN PC_FIVETRAN_DB.AVSTEP3.TITLES t
        ON e.emp_title_id = t.title_id
    LEFT JOIN PC_FIVETRAN_DB.AVSTEP3.DEPT_EMP de
        ON e.emp_no = de.emp_no
)
SELECT * FROM final

