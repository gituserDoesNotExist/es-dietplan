select * from sys.all_objects where UPPER(owner) = 'DIETPLAN' and upper(object_name) = 'BASE_ENTITY';

SELECT * FROM sys.all_objects WHERE upper(owner) = 'DIETPLAN';



select * from user_identifiers;
select * from all_procedures where owner = 'DIETPLAN';
select * from dba_procedures;

--table
select * from user_tables where upper(table_name) = 'VITAMINwE';
select * from all_tab_COLS where owner='DIETPLAN' and table_name='VITAMINE';




--package
select * from user_procedures where object_type = 'PACKAGE' and OBJECT_NAME = 'API' and procedure_name is not null;
select * from user_arguments where package_name = 'API' and object_name = 'CREATE_COMPLETE_FOOD' order by position;

select * from user_procedures where object_type = 'PACKAGE' and OBJECT_NAME = 'FOOD_DAO_TEST' and procedure_name is not null;
select * from user_arguments where package_name = 'FOOD_DAO_TEST' and object_name = 'CREATE_BRENNSTOFF' and data_type is not null order by position;


--procedure
select * from user_procedures where object_type = 'PROCEDURE' and object_name = 'PROCEDURE1';
select * from user_arguments where object_name = 'PROCEDURE1';



--function
select * from user_procedures where object_type = 'FUNCTION' and object_name = 'TEST_FUNCTION';
select * from user_arguments where object_name = 'TEST_FUNCTION' order by position;


--object type
select * from sys.all_objects where UPPER(owner) = 'DIETPLAN' and upper(object_type) = 'TYPE';
select * from sys.all_arguments where owner = 'DIETPLAN' and package_name = 'API';
select * from user_arguments where package_name = 'API';

SELECT * FROM all_type_attrs where owner = 'DIETPLAN' and type_name = 'BASE_ENTITY';
select * from user_procedures where object_type = 'TYPE' and OBJECT_NAME = 'BASE_ENTITY';
select * from sys.all_arguments where owner = 'DIETPLAN' and package_name = 'BASE_ENTITY' order by object_name,position;


select * from USER_ARGUMENTS where package_name = 'BASE_ENTITY' order by object_name,position;