-- FUNCTION to get the HOD of given DEPARTMENT_ID
create or replace function get_hod(p_dept_id number)
return varchar is
 v_name varchar(30);
 v_empid employees.employee_id%type;
begin
 select manager_id into v_empid
 from departments
 where p_dept_id = department_id;
 -- If HOD is not present then return null
 if v_empid is null then
 return null;
 end if;

 select first_name || ' ' || last_name into v_name
 from employees
 where employee_id = v_empid;

 return v_name;

exception
 when no_data_found then
 return null;
 end;

-- commands
select get_hod(50) from dual;

select department_name,get_hod(department_id) from departments;
