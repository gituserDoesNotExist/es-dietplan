CREATE OR REPLACE PACKAGE "DIETPLAN"."OBJECT_TYPE_TEST" AS 

    --%suite(OBJECT_TYPE_TEST: test user defined object types)
    
    --%test(test whether the equal contract is fulfilled)
    procedure test_equals;

    --%test(test whether the object can be created propertly)
    procedure test_lebensmittel_metainfo;
    
    --%test(test builder - no new object created when returning self)
    procedure test_lebensmittel_builder;

    
END OBJECT_TYPE_TEST;
/
