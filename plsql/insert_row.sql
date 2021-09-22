-- insert a new row into jobs
declare
    v_min_salary jobs.min_salary%type;
    v_max_salary jobs.max_salary%type;
begin
    select min_salary into v_min_salary from jobs
    where job_id = 'IT_PROG';

    select max(max_salary) into v_max_salary from jobs
    where job_title like '%Manager%';

    insert into jobs values
    ('IT_DBA','Database Administrator',v_min_salary, v_max_salary);
    
end;