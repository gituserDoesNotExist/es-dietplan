CREATE OR REPLACE PROCEDURE "DIETPLAN"."TEST_RUNNER" AS 
BEGIN
    ut.run('dietplan:integrationtest');
END TEST_RUNNER;
/
