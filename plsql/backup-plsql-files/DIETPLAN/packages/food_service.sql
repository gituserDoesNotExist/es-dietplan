CREATE OR REPLACE PACKAGE "DIETPLAN"."FOOD_SERVICE" AS
    PROCEDURE insert_new_lebensmittel (
        t_lebensmittel IN OUT lebensmittel
    );

END food_service;
/
