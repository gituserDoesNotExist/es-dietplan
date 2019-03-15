CREATE OR REPLACE PROCEDURE "DIETPLAN"."DROP_SEQUENCE_SAFELY" (sequence_name varchar2) 
IS
 stmt varchar2(50) := 'drop sequence ' || sequence_name;
BEGIN
    dbms_output.put_line('executing: ' || stmt);
    execute immediate stmt;
    EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('the sequence "' || sequence_name || '" does not exist');
END DROP_SEQUENCE_SAFELY;
/
