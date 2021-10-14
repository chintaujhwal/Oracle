-- interchange salaries of 110 and 120
declare
    v_salary_110 employees.salary%type;
begin
    select salary into v_salary_110
    from employees
    where employee_id = 110;

    -- Change salary of 110 to salary of 120
    update employees
    set salary = (select salary from employees where employee_id = 120)
    where employee_id = 110;

    -- Change salary of 120 to salary of 110
    update employees set salary = v_salary_110
    where employee_id = 120;

    rollback;

end;