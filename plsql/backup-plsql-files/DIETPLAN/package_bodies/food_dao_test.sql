CREATE OR REPLACE PACKAGE BODY "DIETPLAN"."FOOD_DAO_TEST" IS

    FUNCTION get_max_id RETURN NUMBER IS
        current_id food_metadata.id%TYPE;
    BEGIN
        SELECT MAX(id)
        INTO current_id
        FROM food_metadata;

        RETURN current_id;
    END;

    PROCEDURE test_create_food_metadata AS
        old_max_id       food_metadata.id%TYPE;
        new_id           food_metadata.id%TYPE;
        r_inserted_row   food_metadata%rowtype;
    BEGIN
        old_max_id := get_max_id();
        
        dbms_output.put_line('old max id=' || old_max_id);
        
        food_dao.create_food_metadata(new_id, 'pear');
        COMMIT;
        SELECT *
        INTO r_inserted_row
        FROM food_metadata
        WHERE id = new_id;

        

        ut.expect(new_id).to_equal(old_max_id+1);
    
        dbms_output.put_line('new record: id=' || r_inserted_row.id || ' and name=' || r_inserted_row.name);

    END test_create_food_metadata;

END food_dao_test;
/
