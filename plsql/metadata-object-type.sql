SET SERVEROUTPUT ON;

-- select * from all_types where upper(type_name) = 'LEBENSMITTEL';

DECLARE
    dbobject_name   VARCHAR2(30) := 'API';
    TYPE STRING_LIST IS
        TABLE OF VARCHAR2(700);
    obj_attributes STRING_LIST := STRING_LIST();
    procedures STRING_LIST := STRING_LIST();
    arguments STRING_LIST := STRING_LIST();
    obj_types         STRING_LIST := STRING_LIST();
    all_metadata        STRING_LIST := STRING_LIST();
    tmp_proc_plus_arguments varchar2(1000) := '';
    current_proc_name varchar2(30);
    resultstring varchar2(10000) := '';
BEGIN
    SELECT object_type BULK COLLECT INTO obj_types FROM sys.all_objects WHERE upper(owner) = 'DIETPLAN' AND upper(object_name) = upper(dbobject_name);

    IF obj_types IS EMPTY THEN
        dbms_output.put_line('no;match;found');
        return;
    END IF;
    
    
    IF obj_types(1) LIKE 'TYPE%' THEN
        SELECT attr_name BULK COLLECT INTO obj_attributes FROM all_type_attrs WHERE upper(type_name) = upper(dbobject_name);

        FOR i IN 1..obj_attributes.count LOOP
            all_metadata.extend;
            all_metadata(all_metadata.last) := obj_attributes(i);
        END LOOP;
        
        select procedure_name bulk collect into procedures from user_procedures where upper(object_type) = 'TYPE' and OBJECT_NAME = upper(dbobject_name);
        for proc_idx in 1..procedures.count loop
            current_proc_name := procedures(proc_idx);
            tmp_proc_plus_arguments := '';
            tmp_proc_plus_arguments := concat(tmp_proc_plus_arguments,current_proc_name);            
            select argument_name bulk collect into arguments from USER_ARGUMENTS 
                where package_name = upper(dbobject_name) and object_name = upper(current_proc_name) 
                and argument_name is not null and argument_name not like 'SELF' order by position;
                
            tmp_proc_plus_arguments := concat(tmp_proc_plus_arguments,'(');
            for argument_idx in 1..arguments.count loop
                if argument_idx!=1 then
                    tmp_proc_plus_arguments := concat(tmp_proc_plus_arguments,',');
                end if;
                tmp_proc_plus_arguments := concat(tmp_proc_plus_arguments,arguments(argument_idx));
            end loop;
            tmp_proc_plus_arguments := concat(tmp_proc_plus_arguments,')');
            
            all_metadata.extend;   
            all_metadata(all_metadata.last) := tmp_proc_plus_arguments;
        end loop;
         
    elsif obj_types(1) LIKE 'PACKAGE%' then
       select procedure_name bulk collect into procedures from user_procedures where object_type = 'PACKAGE' and OBJECT_NAME = upper(dbobject_name) and procedure_name is not null;
        for proc_idx in 1..procedures.count loop
            current_proc_name := procedures(proc_idx);
            tmp_proc_plus_arguments := current_proc_name;
            tmp_proc_plus_arguments := concat(tmp_proc_plus_arguments,'(');
            
            select argument_name bulk collect into arguments from user_arguments 
                where package_name = upper(dbobject_name) and object_name = upper(current_proc_name) and argument_name is not null order by position;    
            for arg_idx in 1..arguments.count loop
                if arg_idx!=1 then
                    tmp_proc_plus_arguments := concat(tmp_proc_plus_arguments,',');
                end if;
                tmp_proc_plus_arguments :=concat(tmp_proc_plus_arguments,arguments(arg_idx));    
            end loop;
            tmp_proc_plus_arguments := concat(tmp_proc_plus_arguments,')');
            
            all_metadata.extend;
            all_metadata(all_metadata.last) := tmp_proc_plus_arguments;
        end loop;

    end if;

    for idx in 1..all_metadata.count loop
        if idx!=1 then
           resultstring := concat(resultstring,';');
        end if;
        resultstring := concat(resultstring,all_metadata(idx));
    end loop;
    dbms_output.put_line(resultstring);
     

    

END;