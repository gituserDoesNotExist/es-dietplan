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
    bez varchar2(100);
    metainfo lebensmittel_metainfo := NEW lebensmittel_metainfo('apple');
    BEGIN
        bez := metainfo.bezeichnung;
        ut.expect(bez).to_equal('apple');
    END;

END object_type_test;
/
