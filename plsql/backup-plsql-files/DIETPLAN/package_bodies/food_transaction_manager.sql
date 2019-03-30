CREATE OR REPLACE PACKAGE BODY "DIETPLAN"."FOOD_TRANSACTION_MANAGER" AS

    PROCEDURE insert_new_lebensmittel (
        t_lebensmittel       IN OUT           lebensmittel
    ) AS
        brennstoff_food_id     brennstoffe.food_id%TYPE;
        mineralstoff_food_id   mineralstoffe.food_id%TYPE;
        vitamin_food_id        vitamine.food_id%TYPE;
    BEGIN
        COMMIT;
        SET TRANSACTION NAME 'new-lebensmittel';
        food_dao.create_lebensmittel(t_lebensmittel);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END insert_new_lebensmittel;

END food_transaction_manager;
/
