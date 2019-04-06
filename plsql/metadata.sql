select * from sys.all_objects where UPPER(owner) = 'DIETPLAN' and upper(object_name) = 'BASE_ENTITY';

select * from user_identifiers;
select * from all_procedures where owner = 'DIETPLAN';
select * from dba_procedures;

--package
select * from user_procedures where object_type = 'PACKAGE' and OBJECT_NAME = 'FOOD_DAO_TEST' and procedure_name is not null;



--object type
select * from sys.all_objects where UPPER(owner) = 'DIETPLAN' and upper(object_type) = 'TYPE';
select * from sys.all_arguments where owner = 'DIETPLAN' and package_name = 'API';
select * from user_arguments where package_name = 'API';

SELECT * FROM all_type_attrs where owner = 'DIETPLAN' and type_name = 'BASE_ENTITY';
select * from user_procedures where object_type = 'TYPE' and OBJECT_NAME = 'BASE_ENTITY';
select * from sys.all_arguments where owner = 'DIETPLAN' and package_name = 'BASE_ENTITY' and argument_name not like 'NULL' and argument_name not like 'SELF' order by object_name,position;
select * from USER_ARGUMENTS where package_name = 'BASE_ENTITY' and argument_name not like 'NULL' and argument_name not like 'SELF' order by object_name,position;