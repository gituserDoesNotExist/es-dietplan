CREATE OR REPLACE PACKAGE BODY "DIETPLAN"."FOOD_DAO" IS

    PROCEDURE create_food_metadata (
        food_id     OUT         food_metadata.id%TYPE,
        food_name   IN          food_metadata.name%TYPE
    ) IS
        current_time TIMESTAMP := systimestamp;
    BEGIN
        food_id := seq_food_metadata.nextval;
        INSERT INTO food_metadata (
            id,
            created_at,
            last_modified,
            name
        ) VALUES (
            food_id,
            current_time,
            current_time,
            food_name
        );

    END create_food_metadata;

    PROCEDURE create_brennstoff (
        brennstoff_id              OUT                        brennstoffe.id%TYPE,
        brennstoff_fett            IN                         brennstoffe.fett%TYPE,
        brennstoff_eiweiss         IN                         brennstoffe.eiweiss%TYPE,
        brennstoff_kohlenhydrate   IN                         brennstoffe.kohlenhydrate%TYPE,
        brennstoff_food_id         IN                         brennstoffe.food_id%TYPE
    ) IS
        current_time TIMESTAMP := systimestamp;
    BEGIN
        brennstoff_id := seq_brennstoffe.nextval;
        INSERT INTO brennstoffe (
            id,
            created_at,
            last_modified,
            fett,
            eiweiss,
            kohlenhydrate,
            food_id
        ) VALUES (
            brennstoff_id,
            current_time,
            current_time,
            brennstoff_fett,
            brennstoff_eiweiss,
            brennstoff_kohlenhydrate,
            brennstoff_food_id
        );

    END;

    PROCEDURE create_mineralstoff (
        mineralstoff_id          OUT                      mineralstoffe.id%TYPE,
        mineralstoff_calcium     IN                       mineralstoffe.calcium%TYPE,
        mineralstoff_chlorid     IN                       mineralstoffe.chlorid%TYPE,
        mineralstoff_eisen       IN                       mineralstoffe.eisen%TYPE,
        mineralstoff_fluorid     IN                       mineralstoffe.fluorid%TYPE,
        mineralstoff_iodid       IN                       mineralstoffe.iodid%TYPE,
        mineralstoff_kalium      IN                       mineralstoffe.kalium%TYPE,
        mineralstoff_kupfer      IN                       mineralstoffe.kupfer%TYPE,
        mineralstoff_mangan      IN                       mineralstoffe.mangan%TYPE,
        mineralstoff_magnesium   IN                       mineralstoffe.magnesium%TYPE,
        mineralstoff_natrium     IN                       mineralstoffe.natrium%TYPE,
        mineralstoff_phosphor    IN                       mineralstoffe.phosphor%TYPE,
        mineralstoff_schwefel    IN                       mineralstoffe.schwefel%TYPE,
        mineralstoff_zink        IN                       mineralstoffe.zink%TYPE,
        mineralstoffe_food_id    IN                       mineralstoffe.food_id%TYPE
    ) IS
        current_time TIMESTAMP := systimestamp;
    BEGIN
        mineralstoff_id := seq_mineralstoffe.nextval;
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
            mineralstoff_id,
            current_time,
            current_time,
            mineralstoff_calcium,
            mineralstoff_chlorid,
            mineralstoff_eisen,
            mineralstoff_fluorid,
            mineralstoff_iodid,
            mineralstoff_kalium,
            mineralstoff_kupfer,
            mineralstoff_mangan,
            mineralstoff_magnesium,
            mineralstoff_natrium,
            mineralstoff_phosphor,
            mineralstoff_schwefel,
            mineralstoff_zink,
            mineralstoffe_food_id
        );

    END;

    PROCEDURE create_vitamin (
        vitamin_id              OUT                     vitamine.id%TYPE,
        vitamin_a_retinol       IN                      vitamine.vitamin_a_retinol%TYPE,
        vitamin_a_betacarotin   IN                      vitamine.vitamin_a_betacarotin%TYPE,
        vitamin_b1              IN                      vitamine.vitamin_b1%TYPE,
        vitamin_b2              IN                      vitamine.vitamin_b2%TYPE,
        vitamin_b6              IN                      vitamine.vitamin_b6%TYPE,
        vitamin_b12             IN                      vitamine.vitamin_b12%TYPE,
        vitamin_c               IN                      vitamine.vitamin_c%TYPE,
        vitamin_d               IN                      vitamine.vitamin_d%TYPE,
        vitamin_e               IN                      vitamine.vitamin_e%TYPE,
        vitamin_k               IN                      vitamine.vitamin_k%TYPE,
        vitamin_food_id         IN                      vitamine.food_id%TYPE
    ) IS
        current_time TIMESTAMP := systimestamp;
    BEGIN
        vitamin_id := seq_vitamine.nextval;
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
            vitamin_id,
            current_time,
            current_time,
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
            vitamin_food_id
        );

    END;

END food_dao;
/
