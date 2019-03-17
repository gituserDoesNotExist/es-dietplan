CREATE OR REPLACE PACKAGE "DIETPLAN"."FOOD_DAO_TEST" AS 
    --%suite(Test the FOOD_DAO package)
    --%rollback(manual)
    
    --%test(test that data is inserted)
    PROCEDURE create_food_metadata;

    --%test(test that exception is raised if name is null)
    --%throws(-20000)
    PROCEDURE create_food_metadata_inv_name;


END food_dao_test;
/
