CREATE OR REPLACE PACKAGE BODY DIETPLAN.FOOD_DAO_TEST IS

    v_lebensmittel_bezeichnung   food_metadata.name%TYPE := 'apple';
    i_lebensmittel_id            food_metadata.id%TYPE;

    PROCEDURE create_lebensmittel_metainfo AS

        old_max_id           food_metadata.id%TYPE;
        r_inserted_row       food_metadata%rowtype;
        time_before_insert   TIMESTAMP := systimestamp;
        t_lebensmittel       lebensmittel := lebensmittel_builder.a_lebensmittel(v_lebensmittel_bezeichnung).build_lebensmittel();
    BEGIN
        SELECT MAX(id)
        INTO old_max_id
        FROM food_metadata;

        i_lebensmittel_id := food_dao.create_lebensmittel(t_lebensmittel);
        dbms_output.put_line('id=' || t_lebensmittel.entity_id);
        SELECT *
        INTO r_inserted_row
        FROM food_metadata fm
        WHERE fm.id = i_lebensmittel_id;

        ut.expect(t_lebensmittel.entity_id).to_be_greater_than(old_max_id);
        ut.expect(r_inserted_row.name).to_equal(t_lebensmittel.v_bezeichnung);
        ut.expect(t_lebensmittel.created_at).to_equal(r_inserted_row.created_at);
        ut.expect(r_inserted_row.created_at).to_be_greater_than(time_before_insert);
        ut.expect(r_inserted_row.last_modified).to_be_greater_than(time_before_insert);
        ut.expect(r_inserted_row.name).to_equal(v_lebensmittel_bezeichnung);
    END create_lebensmittel_metainfo;

    PROCEDURE create_brennstoff AS

        old_max_id           brennstoffe.id%TYPE;
        r_inserted_row       brennstoffe%rowtype;
        time_before_insert   TIMESTAMP := systimestamp;
        fett                 brennstoffe.fett%TYPE := 200;
        eiweiss              brennstoffe.eiweiss%TYPE := 200;
        kohlenhydrate        brennstoffe.kohlenhydrate%TYPE := 200;
        food_id              brennstoffe.food_id%TYPE := 1; --this row is already inserted in dmls
        t_brennstoff         brennstoff := NEW brennstoff(fett, eiweiss, kohlenhydrate, food_id);
        t_lebensmittel       lebensmittel := lebensmittel_builder.a_lebensmittel(v_lebensmittel_bezeichnung).with_brennstoff(t_brennstoff).build_lebensmittel();
    BEGIN
        SELECT MAX(id)
        INTO old_max_id
        FROM brennstoffe;

        i_lebensmittel_id := food_dao.create_lebensmittel(t_lebensmittel);
        SELECT *
        INTO r_inserted_row
        FROM brennstoffe
        WHERE id = t_lebensmittel.t_brennstoff.entity_id;

        ROLLBACK;
        ut.expect(i_lebensmittel_id).to_equal(t_lebensmittel.t_brennstoff.food_id);
        ut.expect(t_lebensmittel.t_brennstoff.entity_id).to_(be_not_null());
        ut.expect(t_lebensmittel.t_brennstoff.entity_id).to_be_greater_than(old_max_id);
        ut.expect(r_inserted_row.id).to_equal(t_lebensmittel.t_brennstoff.entity_id);
        ut.expect(r_inserted_row.created_at).to_be_greater_than(time_before_insert);
        ut.expect(r_inserted_row.last_modified).to_be_greater_than(time_before_insert);
        ut.expect(r_inserted_row.fett).to_equal(t_lebensmittel.t_brennstoff.fett);
        ut.expect(r_inserted_row.eiweiss).to_equal(t_lebensmittel.t_brennstoff.eiweiss);
        ut.expect(r_inserted_row.kohlenhydrate).to_equal(t_lebensmittel.t_brennstoff.kohlenhydrate);
        ut.expect(r_inserted_row.food_id).to_equal(t_lebensmittel.t_brennstoff.food_id);
    END create_brennstoff;

    PROCEDURE create_mineralstoff AS

        old_max_id           mineralstoffe.id%TYPE;
        new_id               mineralstoffe.id%TYPE;
        r_inserted_row       mineralstoffe%rowtype;
        time_before_insert   TIMESTAMP := systimestamp;
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
        food_id              mineralstoffe.food_id%TYPE := 1; --this row is already inserted in dmls
        t_mineralstoff       mineralstoff := NEW mineralstoff(calcium, chlorid, eisen, fluorid, iodid, kalium, kupfer, magnesium, mangan, natrium, phosphor, schwefel, zink
        , food_id);
        t_lebensmittel       lebensmittel := lebensmittel_builder.a_lebensmittel(v_lebensmittel_bezeichnung).with_mineralstoff(t_mineralstoff).build_lebensmittel();
    BEGIN
        SELECT MAX(id)
        INTO old_max_id
        FROM mineralstoffe;

        i_lebensmittel_id := food_dao.create_lebensmittel(t_lebensmittel);
        SELECT *
        INTO r_inserted_row
        FROM mineralstoffe
        WHERE id = t_lebensmittel.t_mineralstoff.entity_id;

        ROLLBACK;
        ut.expect(i_lebensmittel_id).to_equal(t_lebensmittel.t_mineralstoff.food_id);
        ut.expect(t_lebensmittel.t_mineralstoff.entity_id).to_(be_not_null());
        ut.expect(t_lebensmittel.t_mineralstoff.entity_id).to_be_greater_than(old_max_id);
        ut.expect(r_inserted_row.id).to_equal(t_lebensmittel.t_mineralstoff.entity_id);
        ut.expect(r_inserted_row.created_at).to_be_greater_than(time_before_insert);
        ut.expect(r_inserted_row.last_modified).to_be_greater_than(time_before_insert);
        ut.expect(r_inserted_row.calcium).to_equal(t_lebensmittel.t_mineralstoff.calcium);
        ut.expect(r_inserted_row.chlorid).to_equal(t_lebensmittel.t_mineralstoff.chlorid);
        ut.expect(r_inserted_row.eisen).to_equal(t_lebensmittel.t_mineralstoff.eisen);
        ut.expect(r_inserted_row.fluorid).to_equal(t_lebensmittel.t_mineralstoff.fluorid);
        ut.expect(r_inserted_row.iodid).to_equal(t_mineralstoff.iodid);
        ut.expect(r_inserted_row.kalium).to_equal(t_lebensmittel.t_mineralstoff.kalium);
        ut.expect(r_inserted_row.kupfer).to_equal(t_lebensmittel.t_mineralstoff.kupfer);
        ut.expect(r_inserted_row.mangan).to_equal(t_lebensmittel.t_mineralstoff.mangan);
        ut.expect(r_inserted_row.magnesium).to_equal(t_lebensmittel.t_mineralstoff.magnesium);
        ut.expect(r_inserted_row.natrium).to_equal(t_lebensmittel.t_mineralstoff.natrium);
        ut.expect(r_inserted_row.phosphor).to_equal(t_lebensmittel.t_mineralstoff.phosphor);
        ut.expect(r_inserted_row.schwefel).to_equal(t_lebensmittel.t_mineralstoff.schwefel);
        ut.expect(r_inserted_row.zink).to_equal(t_lebensmittel.t_mineralstoff.zink);
        ut.expect(r_inserted_row.food_id).to_equal(t_lebensmittel.t_mineralstoff.food_id);
    END create_mineralstoff;

    PROCEDURE create_vitamin AS

        old_max_id              vitamine.id%TYPE;
        new_id                  vitamine.id%TYPE;
        r_inserted_row          vitamine%rowtype;
        time_before_insert      TIMESTAMP := systimestamp;
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
        food_id                 vitamine.food_id%TYPE := 1; --this row is already inserted in dmls
        t_vitamin               vitamin := NEW vitamin(vitamin_a_retinol, vitamin_a_betacarotin, vitamin_b1, vitamin_b2, vitamin_b6, vitamin_b12, vitamin_c, vitamin_d, vitamin_e
        , vitamin_k, food_id);
        t_lebensmittel          lebensmittel := lebensmittel_builder.a_lebensmittel(v_lebensmittel_bezeichnung).with_vitamin(t_vitamin).build_lebensmittel();
    BEGIN
        SELECT MAX(id)
        INTO old_max_id
        FROM vitamine;

        i_lebensmittel_id := food_dao.create_lebensmittel(t_lebensmittel);
        SELECT *
        INTO r_inserted_row
        FROM vitamine
        WHERE id = t_lebensmittel.t_vitamin.entity_id;

        ROLLBACK;
        ut.expect(i_lebensmittel_id).to_equal(t_lebensmittel.t_vitamin.food_id);
        ut.expect(t_lebensmittel.t_vitamin.entity_id).to_(be_not_null());
        ut.expect(t_lebensmittel.t_vitamin.entity_id).to_be_greater_than(old_max_id);
        ut.expect(r_inserted_row.id).to_equal(t_lebensmittel.t_vitamin.entity_id);
        ut.expect(r_inserted_row.created_at).to_be_greater_than(time_before_insert);
        ut.expect(r_inserted_row.last_modified).to_be_greater_than(time_before_insert);
        ut.expect(r_inserted_row.vitamin_a_retinol).to_equal(t_lebensmittel.t_vitamin.vit_a_retinol);
        ut.expect(r_inserted_row.vitamin_a_betacarotin).to_equal(t_lebensmittel.t_vitamin.vit_a_betacarotin);
        ut.expect(r_inserted_row.vitamin_b1).to_equal(t_lebensmittel.t_vitamin.vit_b1);
        ut.expect(r_inserted_row.vitamin_b2).to_equal(t_lebensmittel.t_vitamin.vit_b2);
        ut.expect(r_inserted_row.vitamin_b6).to_equal(t_lebensmittel.t_vitamin.vit_b6);
        ut.expect(r_inserted_row.vitamin_b12).to_equal(t_lebensmittel.t_vitamin.vit_b12);
        ut.expect(r_inserted_row.vitamin_c).to_equal(t_lebensmittel.t_vitamin.vit_c);
        ut.expect(r_inserted_row.vitamin_d).to_equal(t_lebensmittel.t_vitamin.vit_d);
        ut.expect(r_inserted_row.vitamin_e).to_equal(t_lebensmittel.t_vitamin.vit_e);
        ut.expect(r_inserted_row.vitamin_k).to_equal(t_lebensmittel.t_vitamin.vit_k);
        ut.expect(r_inserted_row.food_id).to_equal(t_lebensmittel.t_vitamin.food_id);
    END create_vitamin;

END food_dao_test;
/
