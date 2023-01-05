create or replace trigger trg_salary_check
before insert or update of salary, job_id
on employees
for each row
declare
v_minsal jobs.min_salary%type;
v_maxsal jobs.max_salary%type;
begin
select min_salary, max_salary into v_minsal, v_maxsal
from jobs
where job_id = :new.job_id;

if :new.salary < v_minsal or :new.salary > v_maxsal then
raise_application_error(-20500,'Invalid salary for job');
end if;
end;