declare
    v_salary employees.salary%type;
begin
    select salary into v_salary from employees
    where employee_id = 180;

    if employee_id is not null then
    update employees set salary = v_salary
    where employee_id = 150;
    else
    dbms_output.put_line('employee not found');
    end if;
end;

