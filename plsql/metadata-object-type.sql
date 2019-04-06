set serveroutput on;

-- select * from all_types where upper(type_name) = 'LEBENSMITTEL';
DECLARE
    TYPE object_attributes IS
        TABLE OF VARCHAR2(50);
    myattributes object_attributes := object_attributes();
    myresult varchar2(10000) := '';
BEGIN
    SELECT attr_name BULK COLLECT
    INTO myattributes
    FROM all_type_attrs
    WHERE upper(type_name) = 'LEBENSMITTEL';

    FOR i IN 1..myattributes.last LOOP
        myresult := concat(myresult,myattributes(i));
        IF i != myattributes.last THEN
            myresult := concat(myresult,';');
        END IF;
    END LOOP;
    dbms_output.put_line(myresult);
END;