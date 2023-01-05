declare
    v_salary employees.salary%type;
begin
    select salary into v_salary from employees
    where first_name = 'Diana';
    dbms_output.put_line(v_salary);
exception
    when no_data_found then null;
end;


declare
    v_sum number(10);
begin
    select sum(salary) into v_sum from employees
    where department_id = 80;
    if v_sum is null then
    dbms_output.put_line('employees not found');
    else
    dbms_output.put_line(v_sum);
    end if;
end;