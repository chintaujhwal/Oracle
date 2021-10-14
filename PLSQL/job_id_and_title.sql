set serveroutput on
declare
    v_job_id jobs.job_id%type;
    v_job_title jobs.job_title%type;
    cursor jobcursor is
        select job_id, job_title from jobs
        where exists (select job_id from employees where jobs.job_id = job_id);
begin
    open jobcursor;
    loop
        fetch jobcursor into v_job_id,v_job_title;
        exit when jobcursor%notfound;
    dbms_output.put_line(v_job_id || '-' || v_job_title);
    end loop;
end;