CREATE OR REPLACE PACKAGE BODY "DIETPLAN"."FOOD_DAO" IS

    PROCEDURE create_food_metadata (
        food_id     OUT         food_metadata.id%TYPE,
        food_name   IN          food_metadata.name%TYPE
    ) IS
        next_food_id food_metadata.id%TYPE;
    BEGIN
        next_food_id := seq_food_metadata.nextval;
        INSERT INTO food_metadata (
            id,
            name
        ) VALUES (
            next_food_id,
            food_name
        );
        food_id := next_food_id;

    END create_food_metadata;

END food_dao;
/
