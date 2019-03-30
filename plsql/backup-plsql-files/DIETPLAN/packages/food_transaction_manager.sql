CREATE OR REPLACE PACKAGE "DIETPLAN"."FOOD_TRANSACTION_MANAGER" AS
    PROCEDURE insert_new_lebensmittel (
        t_lebensmittel       IN OUT           lebensmittel
    );

END food_transaction_manager;
/
