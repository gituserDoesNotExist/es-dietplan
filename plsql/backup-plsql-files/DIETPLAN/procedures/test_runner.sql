CREATE OR REPLACE PROCEDURE "DIETPLAN"."TEST_RUNNER" AS 
BEGIN
    ut.run('dietplan:integrationtest');
    ut.run('object_type_test');
END TEST_RUNNER;
/
