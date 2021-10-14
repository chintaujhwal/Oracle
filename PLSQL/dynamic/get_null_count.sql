create or replace function get_null_count(p_table_name varchar, p_column_name varchar)
return number
is
v_count number(5);
begin
execute immediate 'select count(*) from ' || p_table_name ||
' where ' || p_column_name || ' is null' into v_count;

return v_count;
end;