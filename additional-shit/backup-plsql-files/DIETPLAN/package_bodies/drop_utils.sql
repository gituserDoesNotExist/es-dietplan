CREATE OR REPLACE PACKAGE BODY "DIETPLAN"."DROP_UTILS" AS

    PROCEDURE drop_table_safely (
        table_name VARCHAR2
    ) AS
        stmt VARCHAR2(50) := 'drop table ' || table_name;
    BEGIN
        dbms_output.put_line('executing: ' || stmt);
        EXECUTE IMMEDIATE stmt;
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('the table "' || table_name || '" does not exist!');
    END drop_table_safely;

    PROCEDURE drop_sequence_safely (
        sequence_name VARCHAR2
    ) AS
        stmt VARCHAR2(50) := 'drop sequence ' || sequence_name;
    BEGIN
        dbms_output.put_line('executing: ' || stmt);
        EXECUTE IMMEDIATE stmt;
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('the sequence "' || sequence_name || '" does not exist');
    END drop_sequence_safely;

    PROCEDURE drop_object_type_safely (
        object_name VARCHAR2
    ) AS

        stmt_body        VARCHAR2(50) := 'drop type body ' || object_name;
        stmt_interface   VARCHAR2(50) := 'drop type ' || object_name || ' force';
    BEGIN
        dbms_output.put_line('executing: ' || stmt_body);
        EXECUTE IMMEDIATE stmt_body;
        dbms_output.put_line('executing: ' || stmt_interface);
        EXECUTE IMMEDIATE stmt_interface;
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('the object type "' || object_name || '" does not exist');
    END drop_object_type_safely;

END drop_utils;
/
