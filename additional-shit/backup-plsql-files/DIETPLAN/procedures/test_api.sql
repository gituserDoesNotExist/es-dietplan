CREATE OR REPLACE PROCEDURE "DIETPLAN"."TEST_API" AS
    food_metadata_id food_metadata.id%TYPE;
BEGIN
    api.create_complete_food(food_metadata_id, 'testit', 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214
    , 215, 216, 217, 218, 219, 220, 221, 222, 223, 224, 225);
END test_api;
/
