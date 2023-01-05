-- FUNCTION to get the MIN_SALARY of given JOB_ID
create or replace function get_min_salary(p_job_id varchar)
return number is
 v_min_salary jobs.min_salary%type;
begin
 select min_salary into v_min_salary from jobs
 where job_id = p_job_id;
 
return v_min_salary;
end;

-- commands
begin
dbms_output.put_line(get_min_salary('IT_PROG'));
end;


