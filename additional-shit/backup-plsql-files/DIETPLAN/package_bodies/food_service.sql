CREATE OR REPLACE PACKAGE BODY "DIETPLAN"."FOOD_SERVICE" AS

    FUNCTION insert_new_lebensmittel (
        t_lebensmittel IN OUT lebensmittel
    ) RETURN food_metadata.id%TYPE IS
    BEGIN
    -- do some validation
        RETURN food_transaction_manager.insert_new_lebensmittel(t_lebensmittel);
    END insert_new_lebensmittel;

END food_service;
/
