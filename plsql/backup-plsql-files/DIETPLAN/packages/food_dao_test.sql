CREATE OR REPLACE PACKAGE "DIETPLAN"."FOOD_DAO_TEST" AS 
    --%suite(FOOD_DAO)
    --%suitepath(integrationtest.abstract_integration_test)
    
    --%test(test that metadata is inserted)
    PROCEDURE create_food_metadata;

    --%test(test that brennstoff is inserted)
    procedure create_brennstoff;


END food_dao_test;
/
