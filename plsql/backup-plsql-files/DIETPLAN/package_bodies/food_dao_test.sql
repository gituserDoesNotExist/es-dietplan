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

        old_max_id           food_metadata.id%TYPE;
        new_id               food_metadata.id%TYPE;
        r_inserted_row       food_metadata%rowtype;
        time_before_insert   TIMESTAMP := systimestamp;
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
        ut.expect(r_inserted_row.created_at).to_be_greater_than(time_before_insert);
        ut.expect(r_inserted_row.last_modified).to_be_greater_than(time_before_insert);
        ut.expect(r_inserted_row.name).to_equal('pear');
    END create_food_metadata;

    PROCEDURE create_brennstoff AS

        old_max_id           brennstoffe.id%TYPE;
        new_id               brennstoffe.id%TYPE;
        r_inserted_row       brennstoffe%rowtype;
        fett                 brennstoffe.fett%TYPE := 200;
        eiweiss              brennstoffe.eiweiss%TYPE := 200;
        kohlenhydrate        brennstoffe.kohlenhydrate%TYPE := 200;
        food_id              brennstoffe.food_id%TYPE := 1; --this row is already inserted in dmls
        time_before_insert   TIMESTAMP := systimestamp;
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
        ut.expect(r_inserted_row.created_at).to_be_greater_than(time_before_insert);
        ut.expect(r_inserted_row.last_modified).to_be_greater_than(time_before_insert);
        ut.expect(r_inserted_row.fett).to_equal(fett);
        ut.expect(r_inserted_row.eiweiss).to_equal(eiweiss);
        ut.expect(r_inserted_row.kohlenhydrate).to_equal(kohlenhydrate);
        ut.expect(r_inserted_row.food_id).to_equal(food_id);
    END create_brennstoff;

    PROCEDURE create_mineralstoff AS

        old_max_id           mineralstoffe.id%TYPE;
        new_id               mineralstoffe.id%TYPE;
        r_inserted_row       mineralstoffe%rowtype;
        food_id              mineralstoffe.food_id%TYPE := 1; --this row is already inserted in dmls
        calcium              mineralstoffe.calcium%TYPE := 100;
        chlorid              mineralstoffe.chlorid%TYPE := 101;
        eisen                mineralstoffe.eisen%TYPE := 102;
        fluorid              mineralstoffe.fluorid%TYPE := 103;
        iodid                mineralstoffe.iodid%TYPE := 104;
        kalium               mineralstoffe.kalium%TYPE := 105;
        kupfer               mineralstoffe.kupfer%TYPE := 106;
        magnesium            mineralstoffe.magnesium%TYPE := 107;
        mangan               mineralstoffe.mangan%TYPE := 108;
        natrium              mineralstoffe.natrium%TYPE := 109;
        phosphor             mineralstoffe.phosphor%TYPE := 110;
        schwefel             mineralstoffe.schwefel%TYPE := 111;
        zink                 mineralstoffe.zink%TYPE := 112;
        time_before_insert   TIMESTAMP := systimestamp;
    BEGIN
        old_max_id := get_max_id();
        food_dao.create_mineralstoff(new_id, calcium, chlorid, eisen, fluorid, iodid, kalium, kupfer, mangan, magnesium, natrium,
        phosphor, schwefel, zink, food_id);

        SELECT *
        INTO r_inserted_row
        FROM mineralstoffe
        WHERE id = new_id;

        ROLLBACK;
        ut.expect(new_id).to_(be_not_null());
        ut.expect(new_id).to_be_greater_than(old_max_id);
        ut.expect(r_inserted_row.id).to_equal(new_id);
        ut.expect(r_inserted_row.created_at).to_be_greater_than(time_before_insert);
        ut.expect(r_inserted_row.last_modified).to_be_greater_than(time_before_insert);
        ut.expect(r_inserted_row.calcium).to_equal(calcium);
        ut.expect(r_inserted_row.chlorid).to_equal(chlorid);
        ut.expect(r_inserted_row.eisen).to_equal(eisen);
        ut.expect(r_inserted_row.fluorid).to_equal(fluorid);
        ut.expect(r_inserted_row.iodid).to_equal(iodid);
        ut.expect(r_inserted_row.kalium).to_equal(kalium);
        ut.expect(r_inserted_row.kupfer).to_equal(kupfer);
        ut.expect(r_inserted_row.mangan).to_equal(mangan);
        ut.expect(r_inserted_row.magnesium).to_equal(magnesium);
        ut.expect(r_inserted_row.natrium).to_equal(natrium);
        ut.expect(r_inserted_row.phosphor).to_equal(phosphor);
        ut.expect(r_inserted_row.schwefel).to_equal(schwefel);
        ut.expect(r_inserted_row.zink).to_equal(zink);
        ut.expect(r_inserted_row.food_id).to_equal(food_id);
    END create_mineralstoff;

    PROCEDURE create_vitamin AS

        old_max_id              vitamine.id%TYPE;
        new_id                  vitamine.id%TYPE;
        r_inserted_row          vitamine%rowtype;
        food_id                 vitamine.food_id%TYPE := 1; --this row is already inserted in dmls
        vitamin_a_retinol       vitamine.vitamin_a_retinol%TYPE := 100;
        vitamin_a_betacarotin   vitamine.vitamin_a_betacarotin%TYPE := 101;
        vitamin_b1              vitamine.vitamin_b1%TYPE := 102;
        vitamin_b2              vitamine.vitamin_b2%TYPE := 103;
        vitamin_b6              vitamine.vitamin_b6%TYPE := 104;
        vitamin_b12             vitamine.vitamin_b12%TYPE := 105;
        vitamin_c               vitamine.vitamin_c%TYPE := 106;
        vitamin_d               vitamine.vitamin_d%TYPE := 107;
        vitamin_e               vitamine.vitamin_e%TYPE := 108;
        vitamin_k               vitamine.vitamin_k%TYPE := 109;
        time_before_insert      TIMESTAMP := systimestamp;
    BEGIN
        old_max_id := get_max_id();
        food_dao.create_vitamin(new_id, vitamin_a_retinol, vitamin_a_betacarotin, vitamin_b1, vitamin_b2, vitamin_b6, vitamin_b12
        , vitamin_c, vitamin_d, vitamin_e, vitamin_k, food_id);

        SELECT *
        INTO r_inserted_row
        FROM vitamine
        WHERE id = new_id;

        ROLLBACK;
        ut.expect(new_id).to_(be_not_null());
        ut.expect(new_id).to_be_greater_than(old_max_id);
        ut.expect(r_inserted_row.id).to_equal(new_id);
        ut.expect(r_inserted_row.created_at).to_be_greater_than(time_before_insert);
        ut.expect(r_inserted_row.last_modified).to_be_greater_than(time_before_insert);
        ut.expect(r_inserted_row.vitamin_a_retinol).to_equal(vitamin_a_retinol);
        ut.expect(r_inserted_row.vitamin_a_betacarotin).to_equal(vitamin_a_betacarotin);
        ut.expect(r_inserted_row.vitamin_b1).to_equal(vitamin_b1);
        ut.expect(r_inserted_row.vitamin_b2).to_equal(vitamin_b2);
        ut.expect(r_inserted_row.vitamin_b6).to_equal(vitamin_b6);
        ut.expect(r_inserted_row.vitamin_b12).to_equal(vitamin_b12);
        ut.expect(r_inserted_row.vitamin_c).to_equal(vitamin_c);
        ut.expect(r_inserted_row.vitamin_d).to_equal(vitamin_d);
        ut.expect(r_inserted_row.vitamin_e).to_equal(vitamin_e);
        ut.expect(r_inserted_row.vitamin_k).to_equal(vitamin_k);
        ut.expect(r_inserted_row.food_id).to_equal(food_id);
    END create_vitamin;

END food_dao_test;
/
