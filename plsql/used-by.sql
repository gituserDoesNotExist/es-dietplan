select * from all_source where owner = 'DIETPLAN';


select * from user_types;
select * from USER_TYPE_ATTRS;
select * from user_procedures where object_name = 'BASE_ENTITY';

select * from dba_dependencies where referenced_owner = 'DIETPLAN' and referenced_name = 'BASE_ENTITY';
