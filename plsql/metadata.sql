select * from sys.all_objects where UPPER(owner) = 'DIETPLAN' and upper(object_name) = 'FOOD_DAO';

select * from user_identifiers;
select * from all_procedures where owner = 'DIETPLAN';
select * from dba_procedures;
select * from user_procedures;

select * from sys.all_objects where UPPER(owner) = 'DIETPLAN' and upper(object_type) = 'TYPE';
select * from sys.all_arguments where upper(object_name) = 'TEST_RUNNER';



