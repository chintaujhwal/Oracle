-- display employee count by month
set serveroutput on
declare
    v_count number(2);
begin
dbms_output.put_line('');
    for i in 1..12
    loop
    select count(*) into v_count from employees
    where to_char(hire_date,'mm') = i;

    dbms_output.put_line(to_char(i,'999') || ' -' || to_char(v_count,'999'));
    
    end loop;
end;


