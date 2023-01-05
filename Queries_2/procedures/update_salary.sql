create or replace procedure update_salary(p_empid number, p_salary number) is
begin
 update employees set salary = p_salary
 where employee_id = p_empid;

 if sql%found then commit;
 else
 raise_application_error(-20100,'employee_id not found');
 end if;

end;

-- commands
execute update_salary(200, 8000);

begin 
update_salary(200, 8000);
end;