CREATE OR REPLACE PACKAGE "DIETPLAN"."FOOD_TRANSACTION_MANAGER" AS
    PROCEDURE create_complete_food (
        t_metainfo       IN OUT           lebensmittel_metainfo,
        t_brennstoff     IN OUT           brennstoff,
        t_vitamin        IN OUT           vitamin,
        t_mineralstoff   IN OUT           mineralstoff
    );

END food_transaction_manager;
/
