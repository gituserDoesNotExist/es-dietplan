CREATE OR REPLACE PACKAGE BODY "DIETPLAN"."FOOD_DAO" IS

    PROCEDURE create_food_metadata (
        food_id     OUT         food_metadata.id%TYPE,
        food_name   IN          food_metadata.name%TYPE
    ) IS
    BEGIN
        food_id := seq_food_metadata.nextval;
        INSERT INTO food_metadata (
            id,
            name
        ) VALUES (
            food_id,
            food_name
        );

    END create_food_metadata;

    PROCEDURE create_brennstoff (
        brennstoff_id              OUT                        brennstoffe.id%TYPE,
        brennstoff_fett            IN                         brennstoffe.fett%TYPE,
        brennstoff_eiweiss         IN                         brennstoffe.eiweiss%TYPE,
        brennstoff_kohlenhydrate   IN                         brennstoffe.kohlenhydrate%TYPE,
        brennstoff_food_id         IN                         brennstoffe.food_id%TYPE
    ) IS
    BEGIN
        brennstoff_id := seq_brennstoffe.nextval;
        INSERT INTO brennstoffe (
            id,
            fett,
            eiweiss,
            kohlenhydrate,
            food_id
        ) VALUES (
            brennstoff_id,
            brennstoff_fett,
            brennstoff_eiweiss,
            brennstoff_kohlenhydrate,
            brennstoff_food_id
        );

    END;

END food_dao;
/
