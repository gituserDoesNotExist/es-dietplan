CREATE OR REPLACE PACKAGE "DIETPLAN"."FOOD_DAO" AS
    PROCEDURE create_food_metadata (
        food_id     OUT         food_metadata.id%TYPE,
        food_name   IN          food_metadata.name%TYPE
    );

    PROCEDURE create_brennstoff (
        brennstoff_id              OUT                        brennstoffe.id%TYPE,
        brennstoff_fett            IN                         brennstoffe.fett%TYPE,
        brennstoff_eiweiss         IN                         brennstoffe.eiweiss%TYPE,
        brennstoff_kohlenhydrate   IN                         brennstoffe.kohlenhydrate%TYPE,
        brennstoff_food_id         IN                         brennstoffe.food_id%TYPE
    );

END food_dao;
/
