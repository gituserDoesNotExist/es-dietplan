CREATE OR REPLACE PACKAGE "DIETPLAN"."FOOD_TRANSACTION_MANAGER" AS
    PROCEDURE insert_new_lebensmittel (
        t_metainfo       IN OUT           lebensmittel_metainfo,
        t_vitamin        IN OUT           vitamin,
        t_brennstoff     IN OUT           brennstoff,
        t_mineralstoff   IN OUT           mineralstoff
    );

END food_transaction_manager;
/
