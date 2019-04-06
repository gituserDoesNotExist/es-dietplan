SET SERVEROUTPUT ON;

-- select * from all_types where upper(type_name) = 'LEBENSMITTEL';

DECLARE
    dbobject_name   VARCHAR2(30) := 'LEBENSMITTEL';
    TYPE object_attributes IS
        TABLE OF VARCHAR2(50);
    TYPE object_types IS
        TABLE OF VARCHAR2(50);
    myattributes    object_attributes := object_attributes();
    mytypes         object_types := object_types();
    myresult        VARCHAR2(10000) := '';
BEGIN
    SELECT object_type BULK COLLECT
    INTO mytypes
    FROM sys.all_objects
    WHERE upper(owner) = 'DIETPLAN'
          AND upper(object_name) = upper(dbobject_name);

    IF mytypes IS EMPTY THEN
        dbms_output.put_line('no;match;found');
        return;
    END IF;
    
    IF mytypes(1) LIKE 'TYPE%' THEN
        dbms_output.put_line('it is a type');
        SELECT attr_name BULK COLLECT
        INTO myattributes
        FROM all_type_attrs
        WHERE upper(type_name) = upper(dbobject_name);

        FOR i IN 1..myattributes.last LOOP
            myresult := concat(myresult, myattributes(i));
            IF i != myattributes.last THEN
                myresult := concat(myresult, ';');
            END IF;

        END LOOP;
        dbms_output.put_line(myresult);
        return;
    END IF;

END;