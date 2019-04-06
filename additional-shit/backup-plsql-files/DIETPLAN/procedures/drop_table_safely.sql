CREATE OR REPLACE PROCEDURE "DIETPLAN"."DROP_TABLE_SAFELY" 
(
  TABLE_NAME IN VARCHAR2 
)
IS
 stmt varchar2(50) := 'drop table ' || table_name;
BEGIN
 dbms_output.put_line('executing: ' || stmt);
 EXECUTE IMMEDIATE stmt;
 EXCEPTION
   WHEN OTHERS THEN
     dbms_output.put_line('the table "' || table_name || '" does not exist!');
END DROP_TABLE_SAFELY;
/
