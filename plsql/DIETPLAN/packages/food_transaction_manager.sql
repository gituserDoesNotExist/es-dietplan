CREATE OR REPLACE PACKAGE DIETPLAN.FOOD_TRANSACTION_MANAGER AS
    FUNCTION insert_new_lebensmittel (
        t_lebensmittel       IN OUT           lebensmittel
    ) RETURN food_metadata.id%TYPE;

END food_transaction_manager;
/
