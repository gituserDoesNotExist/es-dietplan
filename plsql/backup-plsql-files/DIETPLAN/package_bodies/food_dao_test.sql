CREATE OR REPLACE PACKAGE BODY "DIETPLAN"."FOOD_DAO_TEST" IS

    FUNCTION get_max_id RETURN NUMBER IS
        current_id food_metadata.id%TYPE;
    BEGIN
        SELECT MAX(id)
        INTO current_id
        FROM food_metadata;

        RETURN current_id;
    END;

    PROCEDURE create_food_metadata AS
        old_max_id       food_metadata.id%TYPE;
        new_id           food_metadata.id%TYPE;
        r_inserted_row   food_metadata%rowtype;
    BEGIN
        old_max_id := get_max_id();
        food_dao.create_food_metadata(new_id, 'pear');
        SELECT *
        INTO r_inserted_row
        FROM food_metadata
        WHERE id = new_id;

        ROLLBACK;
        ut.expect(new_id).to_(be_not_null());
        ut.expect(new_id).to_be_greater_than(old_max_id);
        ut.expect(r_inserted_row.id).to_equal(new_id);
        ut.expect(r_inserted_row.name).to_equal('pear');
    END create_food_metadata;

    PROCEDURE create_brennstoff AS

        old_max_id       brennstoffe.id%TYPE;
        new_id           brennstoffe.id%TYPE;
        r_inserted_row   brennstoffe%rowtype;
        fett             brennstoffe.fett%TYPE := 200;
        eiweiss          brennstoffe.eiweiss%TYPE := 200;
        kohlenhydrate    brennstoffe.kohlenhydrate%TYPE := 200;
        food_id          brennstoffe.food_id%TYPE := 1; --this row is already inserted in dmls
    BEGIN
        old_max_id := get_max_id();
        food_dao.create_brennstoff(new_id, fett, eiweiss, kohlenhydrate, food_id);
        SELECT *
        INTO r_inserted_row
        FROM brennstoffe
        WHERE id = new_id;

        ROLLBACK;
        ut.expect(new_id).to_(be_not_null());
        ut.expect(new_id).to_be_greater_than(old_max_id);
        ut.expect(r_inserted_row.id).to_equal(new_id);
        ut.expect(r_inserted_row.fett).to_equal(fett);
        ut.expect(r_inserted_row.eiweiss).to_equal(eiweiss);
        ut.expect(r_inserted_row.kohlenhydrate).to_equal(kohlenhydrate);
        ut.expect(r_inserted_row.food_id).to_equal(food_id);
    END create_brennstoff;

END food_dao_test;
/
