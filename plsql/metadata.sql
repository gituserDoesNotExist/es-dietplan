select * from sys.all_objects where UPPER(owner) = 'DIETPLAN';


select * from sys.all_objects where UPPER(owner) = 'DIETPLAN' and upper(object_type) = 'TYPE';
select * from sys.all_arguments where upper(object_name) = 'TEST_RUNNER';



