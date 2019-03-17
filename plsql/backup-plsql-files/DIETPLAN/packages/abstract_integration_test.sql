CREATE OR REPLACE PACKAGE "DIETPLAN"."ABSTRACT_INTEGRATION_TEST" AS 

    --%suite(integrationTestSetup)
    --%suitepath(integrationtest)
    --%rollback(manual)


    --%beforeall
    procedure set_up;
       

END ABSTRACT_INTEGRATION_TEST;
/
