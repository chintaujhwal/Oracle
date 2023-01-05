create or replace procedure print_col_null_count(p_table_name varchar)
is
v_count number(5);
cursor col_cur is
select column_name
from user_tab_columns
where table_name = p_table_name;
begin
for colrec in col_cur
loop
v_count := get_null_count(p_table_name, colrec.column_name);
dbms_output.put_line(rpad(colrec.column_name,30) || to_char(v_count,'9999'));
end loop;
end;