CREATE OR REPLACE PACKAGE BODY "DIETPLAN"."FOOD_DAO" IS

    PROCEDURE create_food_metadata (
        food_id OUT food_metadata.id%TYPE, food_name IN food_metadata.name%TYPE
    ) IS
    BEGIN
        food_id := seq_food_metadata.nextval;
        INSERT INTO food_metadata (
            id, name
        ) VALUES (
            food_id, food_name
        );

    EXCEPTION
        WHEN dietplan_exceptions.db_field_not_null_exception THEN
            ROLLBACK;
            raise_application_error(dietplan_exceptions.sql_err_code_not_null, 'Der Name darf nicht null sein!');
    END create_food_metadata;

END food_dao;
/
