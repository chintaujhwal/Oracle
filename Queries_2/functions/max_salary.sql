-- FUNCTION to get the MAX_SALARY of given JOB_ID
create or replace function get_max_salary(p_job_id varchar)
return number is
 v_max_salary jobs.max_salary%type;
begin
 select max_salary into v_max_salary from jobs
 where job_id = p_job_id;
 
return v_max_salary;
end;

-- commands
begin
dbms_output.put_line(get_max_salary('IT_PROG'));
end;