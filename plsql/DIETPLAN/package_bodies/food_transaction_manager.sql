CREATE OR REPLACE PACKAGE BODY DIETPLAN.FOOD_TRANSACTION_MANAGER AS

    FUNCTION insert_new_lebensmittel (
        t_lebensmittel IN OUT lebensmittel
    ) RETURN food_metadata.id%TYPE IS

        i_lebensmittel_id      food_metadata.id%TYPE;
        brennstoff_food_id     brennstoffe.food_id%TYPE;
        mineralstoff_food_id   mineralstoffe.food_id%TYPE;
        vitamin_food_id        vitamine.food_id%TYPE;
    BEGIN
        COMMIT;
        SET TRANSACTION NAME 'new-lebensmittel';
        i_lebensmittel_id := food_dao.create_lebensmittel(t_lebensmittel);
        COMMIT;
        return i_lebensmittel_id;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END insert_new_lebensmittel;

END food_transaction_manager;
/
