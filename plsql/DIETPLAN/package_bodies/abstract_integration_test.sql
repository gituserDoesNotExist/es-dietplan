CREATE OR REPLACE PACKAGE BODY DIETPLAN.ABSTRACT_INTEGRATION_TEST AS

    PROCEDURE set_up AS
    BEGIN
        dbms_output.put_line('hello from before all');
    END set_up;

  
END abstract_integration_test;
/
