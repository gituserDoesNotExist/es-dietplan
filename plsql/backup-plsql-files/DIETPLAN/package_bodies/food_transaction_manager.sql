CREATE OR REPLACE PACKAGE BODY "DIETPLAN"."FOOD_TRANSACTION_MANAGER" AS

    PROCEDURE create_complete_food (
        t_metainfo       IN OUT           lebensmittel_metainfo,
        t_brennstoff     IN OUT           brennstoff,
        t_vitamin        IN OUT           vitamin,
        t_mineralstoff   IN OUT           mineralstoff
    ) AS

        brennstoff_food_id     brennstoffe.food_id%TYPE;
        mineralstoff_food_id   mineralstoffe.food_id%TYPE;
        vitamin_food_id        vitamine.food_id%TYPE;
    BEGIN
        COMMIT;
        SET TRANSACTION NAME 'new-lebensmittel';
        food_dao.create_lebensmittel_metainfo(t_metainfo);
        brennstoff_food_id := t_metainfo.entity_id;
        mineralstoff_food_id := t_metainfo.entity_id;
        vitamin_food_id := t_metainfo.entity_id;
        
        food_dao.create_brennstoff(t_brennstoff);
        food_dao.create_mineralstoff(t_mineralstoff);
        food_dao.create_vitamin(t_vitamin);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END create_complete_food;

END food_transaction_manager;
/
