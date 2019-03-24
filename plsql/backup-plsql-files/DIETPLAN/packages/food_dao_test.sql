CREATE OR REPLACE PACKAGE "DIETPLAN"."FOOD_DAO_TEST" AS 
    --%suite(FOOD_DAO)
    --%suitepath(integrationtest.abstract_integration_test)

    --%test(test that metadata of lebensmittel is inserted)
    PROCEDURE create_lebensmittel_metainfo;

    --%test(test that brennstoff is inserted)
    PROCEDURE create_brennstoff;

    --%test(test that mineralstoff is inserted)
    PROCEDURE create_mineralstoff;

    --%test(test that vitamin is inserted)
    PROCEDURE create_vitamin;

END food_dao_test;
/
