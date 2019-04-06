CREATE OR REPLACE PACKAGE BODY "DIETPLAN"."OBJECT_TYPE_TEST" AS

    PROCEDURE test_equals AS

        entity                      base_entity := NEW base_entity(2);
        other_entity_same_id        base_entity := NEW base_entity(2);
        another_entity_same_id      base_entity := NEW base_entity(2);
        other_entity_different_id   base_entity := NEW base_entity(4);
        equalentities               BOOLEAN := false;
    BEGIN
        --null akzeptanz
        equalentities := entity.equals(NULL);
        ut.expect(equalentities).to_equal(false);
        
        --reflexivitaet
        equalentities := entity.equals(entity);
        ut.expect(equalentities).to_equal(true);
        
        --symmetrie
        equalentities := entity.equals(other_entity_same_id);
        ut.expect(equalentities).to_equal(true);
        equalentities := other_entity_same_id.equals(entity);
        ut.expect(equalentities).to_equal(true);
        
        --transitivitaet
        equalentities := entity.equals(other_entity_same_id);
        ut.expect(equalentities).to_equal(true);
        equalentities := other_entity_same_id.equals(another_entity_same_id);
        ut.expect(equalentities).to_equal(true);
        equalentities := entity.equals(another_entity_same_id);
        ut.expect(equalentities).to_equal(true);
        
        --unterschiedliche id -> nicht gleich
        equalentities := entity.equals(other_entity_different_id);
        ut.expect(equalentities).to_equal(false);
    END test_equals;

    PROCEDURE test_lebensmittel_metainfo AS

        bez              VARCHAR2(100);
        t_lebensmittel   lebensmittel := NEW lebensmittel('apple', NULL, NULL, NULL);
    BEGIN
        bez := t_lebensmittel.v_bezeichnung;
        ut.expect(bez).to_equal('apple');
    END;

    PROCEDURE test_lebensmittel_builder AS

        v_bezeichnung     VARCHAR2(20) := 'apple';
        n_fett            BINARY_FLOAT := 200;
        n_eiweiss         BINARY_FLOAT := 201;
        n_kohlenhydrate   BINARY_FLOAT := 202;
        n_food_id         INTEGER := 3;
        t_brennstoff      brennstoff := NEW brennstoff(n_fett, n_eiweiss, n_kohlenhydrate, n_food_id);
        t_result          lebensmittel;
        builder           lebensmittel_builder;
        expec             brennstoff;
    BEGIN
        t_result := lebensmittel_builder.a_lebensmittel(v_bezeichnung).build_lebensmittel();
        ut.expect(t_result.v_bezeichnung).to_equal(v_bezeichnung);
        --
        builder := lebensmittel_builder.a_lebensmittel(v_bezeichnung).with_brennstoff(t_brennstoff);
        builder := builder.with_brennstoff(t_brennstoff);
        t_result := builder.build_lebensmittel();
        ut.expect(t_result.v_bezeichnung).to_equal(v_bezeichnung);
        ut.expect(t_result.t_brennstoff.fett).to_equal(n_fett);
    END;

END object_type_test;
/
