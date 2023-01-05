set serveroutput on 
declare 
    v_bonus_per number(2);
    v_count number(2);
    cursor empcursor is 
        select employee_id, salary, trunc(months_between(sysdate,hire_date)) exp_months from employees 
        where department_id = 60;
begin 
    for emprec in empcursor 
    loop
-- calculate bonus based on experience 
    v_bonus_per := 
    case 
    when emprec.exp_months > 180 then  30
    when emprec.exp_months > 120 then 25
    else 20
    end;
        
-- check whether employee has job history 
    select count(*) into v_count from job_history 
    where employee_id = emprec.employee_id;
        
-- if employee has job history then add 5% to bonus 
    if v_count > 0 then
    v_bonus_per := v_bonus_per + 5;
    end if;
        
    dbms_output.put_line(emprec.employee_id  || ' - ' || emprec.salary * v_bonus_per / 100);
    end loop; 
end;
