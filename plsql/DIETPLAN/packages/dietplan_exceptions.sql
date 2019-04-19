CREATE OR REPLACE PACKAGE DIETPLAN.DIETPLAN_EXCEPTIONS AS

    db_field_not_null_exception EXCEPTION;
    PRAGMA exception_init ( db_field_not_null_exception, -1400 );
    
    sql_err_code_not_null NUMBER(19) := -20000;

END dietplan_exceptions;
/
