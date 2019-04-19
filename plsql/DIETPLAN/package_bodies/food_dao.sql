CREATE OR REPLACE PACKAGE BODY DIETPLAN.FOOD_DAO IS

    PROCEDURE create_lebensmittel_metainfo (
        t_lebensmittel IN OUT lebensmittel
    ) IS
        current_timestamp TIMESTAMP := systimestamp;
    BEGIN
        t_lebensmittel.entity_id := seq_food_metadata.nextval;
        t_lebensmittel.created_at := current_timestamp;
        t_lebensmittel.last_modified := current_timestamp;
        INSERT INTO food_metadata (
            id,
            created_at,
            last_modified,
            name
        ) VALUES (
            t_lebensmittel.entity_id,
            t_lebensmittel.created_at,
            t_lebensmittel.last_modified,
            t_lebensmittel.v_bezeichnung
        );

    END;

    PROCEDURE create_brennstoff (
        p_brennstoff IN OUT brennstoff
    ) IS
        current_timestamp TIMESTAMP := systimestamp;
    BEGIN
        p_brennstoff.entity_id := seq_brennstoffe.nextval;
        p_brennstoff.created_at := current_timestamp;
        p_brennstoff.last_modified := current_timestamp;
        INSERT INTO brennstoffe (
            id,
            created_at,
            last_modified,
            fett,
            eiweiss,
            kohlenhydrate,
            food_id
        ) VALUES (
            p_brennstoff.entity_id,
            p_brennstoff.created_at,
            p_brennstoff.last_modified,
            p_brennstoff.fett,
            p_brennstoff.eiweiss,
            p_brennstoff.kohlenhydrate,
            p_brennstoff.food_id
        );

    END;

    PROCEDURE create_mineralstoff (
        p_mineralstoff IN OUT mineralstoff
    ) IS
        current_timestamp TIMESTAMP := systimestamp;
    BEGIN
        dbms_output.put_line('hello from food dao' || p_mineralstoff.food_id);
        p_mineralstoff.entity_id := seq_mineralstoffe.nextval;
        p_mineralstoff.created_at := current_timestamp;
        p_mineralstoff.last_modified := current_timestamp;
        INSERT INTO mineralstoffe (
            id,
            created_at,
            last_modified,
            calcium,
            chlorid,
            eisen,
            fluorid,
            iodid,
            kalium,
            kupfer,
            mangan,
            magnesium,
            natrium,
            phosphor,
            schwefel,
            zink,
            food_id
        ) VALUES (
            p_mineralstoff.entity_id,
            p_mineralstoff.created_at,
            p_mineralstoff.last_modified,
            p_mineralstoff.calcium,
            p_mineralstoff.chlorid,
            p_mineralstoff.eisen,
            p_mineralstoff.fluorid,
            p_mineralstoff.iodid,
            p_mineralstoff.kalium,
            p_mineralstoff.kupfer,
            p_mineralstoff.mangan,
            p_mineralstoff.magnesium,
            p_mineralstoff.natrium,
            p_mineralstoff.phosphor,
            p_mineralstoff.schwefel,
            p_mineralstoff.zink,
            p_mineralstoff.food_id
        );

    END;

    PROCEDURE create_vitamin (
        p_vitamin IN OUT vitamin
    ) IS
        current_timestamp TIMESTAMP := systimestamp;
    BEGIN
        p_vitamin.entity_id := seq_vitamine.nextval;
        p_vitamin.created_at := current_timestamp;
        p_vitamin.last_modified := current_timestamp;
        INSERT INTO vitamine (
            id,
            created_at,
            last_modified,
            vitamin_a_retinol,
            vitamin_a_betacarotin,
            vitamin_b1,
            vitamin_b2,
            vitamin_b6,
            vitamin_b12,
            vitamin_c,
            vitamin_d,
            vitamin_e,
            vitamin_k,
            food_id
        ) VALUES (
            p_vitamin.entity_id,
            p_vitamin.created_at,
            p_vitamin.last_modified,
            p_vitamin.vit_a_retinol,
            p_vitamin.vit_a_betacarotin,
            p_vitamin.vit_b1,
            p_vitamin.vit_b2,
            p_vitamin.vit_b6,
            p_vitamin.vit_b12,
            p_vitamin.vit_c,
            p_vitamin.vit_d,
            p_vitamin.vit_e,
            p_vitamin.vit_k,
            p_vitamin.food_id
        );

    END;

    FUNCTION create_lebensmittel (
        t_lebensmittel IN OUT lebensmittel
    ) RETURN food_metadata.id%TYPE IS
    BEGIN
        create_lebensmittel_metainfo(t_lebensmittel);
        IF t_lebensmittel.t_vitamin IS NOT NULL THEN
            t_lebensmittel.t_vitamin.food_id := t_lebensmittel.entity_id;
            create_vitamin(t_lebensmittel.t_vitamin);
        END IF;

        IF t_lebensmittel.t_brennstoff IS NOT NULL THEN
            t_lebensmittel.t_brennstoff.food_id := t_lebensmittel.entity_id;
            create_brennstoff(t_lebensmittel.t_brennstoff);
        END IF;

        IF t_lebensmittel.t_mineralstoff IS NOT NULL THEN
            t_lebensmittel.t_mineralstoff.food_id := t_lebensmittel.entity_id;
            create_mineralstoff(t_lebensmittel.t_mineralstoff);
        END IF;

        RETURN t_lebensmittel.entity_id;
    END;

END food_dao;
/