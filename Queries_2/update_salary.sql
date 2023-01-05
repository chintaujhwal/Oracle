-- update employee salary
declare
    v_salary employees.salary%type;
    v_exp number(3);
begin
    select salary, round((sysdate - hire_date)/365) into v_salary,v_exp from employees
    where employee_id = 150;
    
    v_salary :=
    case
    when v_exp < 10 then v_salary * 1.1
    when v_exp > 10 and v_exp < 20 then v_salary * 1.2
    when v_exp >= 20 then v_salary * 1.25
    end;
    
update employees set salary = v_salary
where employee_id = 150;

end;
