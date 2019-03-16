CREATE OR REPLACE PACKAGE "DIETPLAN"."FOOD_DAO" AS
    PROCEDURE create_food_metadata (
        food_id     OUT         food_metadata.id%TYPE,
        food_name   IN          food_metadata.name%TYPE
    );

END food_dao;
/
