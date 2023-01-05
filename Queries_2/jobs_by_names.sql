set serveroutput on
declare
    cursor jobcur is
        select job_id, job_title from jobs;
    cursor empcur(p_jobid varchar) is
        select first_name || ' ' || last_name fullname from employees
        where job_id = p_jobid;
begin
    for jobrec in jobcur
    loop
        dbms_output.put_line(jobrec.job_title);
        for emprec in empcur(jobrec.job_id)
        loop
        dbms_output.put_line('-' || emprec.fullname);
        end loop;
    end loop;
end;