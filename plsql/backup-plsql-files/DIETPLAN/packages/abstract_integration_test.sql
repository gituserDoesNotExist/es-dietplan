CREATE OR REPLACE PACKAGE "DIETPLAN"."ABSTRACT_INTEGRATION_TEST" AS 

    --%suite(abstract-integration-test)
    --%suitepath(integration.test)

    --%beforeall
    procedure set_up;
    
    --%afterall
    procedure tear_down;

END ABSTRACT_INTEGRATION_TEST;
/
