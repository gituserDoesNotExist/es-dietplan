CREATE OR REPLACE FUNCTION "DIETPLAN"."TEST_FUNCTION" (n_id in number) return number
is
begin
    dbms_output.put_line('hello world');
    return 5;
end;
/
