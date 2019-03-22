CREATE OR REPLACE PACKAGE BODY "DIETPLAN"."API" AS

    PROCEDURE create_complete_food (
        food_metadata_id           OUT                        food_metadata.id%TYPE,
        food_metadata_name         IN                         food_metadata.name%TYPE,
        --###############################################################################
        brennstoff_fett            IN                         brennstoffe.fett%TYPE,
        brennstoff_eiweiss         IN                         brennstoffe.eiweiss%TYPE,
        brennstoff_kohlenhydrate   IN                         brennstoffe.kohlenhydrate%TYPE,
        --###############################################################################
        mineralstoff_calcium       IN                         mineralstoffe.calcium%TYPE,
        mineralstoff_chlorid       IN                         mineralstoffe.chlorid%TYPE,
        mineralstoff_eisen         IN                         mineralstoffe.eisen%TYPE,
        mineralstoff_fluorid       IN                         mineralstoffe.fluorid%TYPE,
        mineralstoff_iodid         IN                         mineralstoffe.iodid%TYPE,
        mineralstoff_kalium        IN                         mineralstoffe.kalium%TYPE,
        mineralstoff_kupfer        IN                         mineralstoffe.kupfer%TYPE,
        mineralstoff_mangan        IN                         mineralstoffe.mangan%TYPE,
        mineralstoff_magnesium     IN                         mineralstoffe.magnesium%TYPE,
        mineralstoff_natrium       IN                         mineralstoffe.natrium%TYPE,
        mineralstoff_phosphor      IN                         mineralstoffe.phosphor%TYPE,
        mineralstoff_schwefel      IN                         mineralstoffe.schwefel%TYPE,
        mineralstoff_zink          IN                         mineralstoffe.zink%TYPE,
        --###############################################################################
        vitamin_a_retinol          IN                         vitamine.vitamin_a_retinol%TYPE,
        vitamin_a_betacarotin      IN                         vitamine.vitamin_a_betacarotin%TYPE,
        vitamin_b1                 IN                         vitamine.vitamin_b1%TYPE,
        vitamin_b2                 IN                         vitamine.vitamin_b2%TYPE,
        vitamin_b6                 IN                         vitamine.vitamin_b6%TYPE,
        vitamin_b12                IN                         vitamine.vitamin_b12%TYPE,
        vitamin_c                  IN                         vitamine.vitamin_c%TYPE,
        vitamin_d                  IN                         vitamine.vitamin_d%TYPE,
        vitamin_e                  IN                         vitamine.vitamin_e%TYPE,
        vitamin_k                  IN                         vitamine.vitamin_k%TYPE
    ) AS
        next_food_id          food_metadata.id%TYPE;
        next_brennstoffe_id   brennstoffe.id%TYPE;
    BEGIN
        dbms_output.put_line('inserting into tables');
        food_transaction_manager.create_complete_food(food_metadata_id, food_metadata_name, brennstoff_fett, brennstoff_eiweiss, brennstoff_kohlenhydrate
        , mineralstoff_calcium, mineralstoff_chlorid, mineralstoff_eisen, mineralstoff_fluorid, mineralstoff_iodid, mineralstoff_kalium
        , mineralstoff_kupfer, mineralstoff_mangan, mineralstoff_magnesium, mineralstoff_natrium, mineralstoff_phosphor, mineralstoff_schwefel
        , mineralstoff_zink, vitamin_a_retinol, vitamin_a_betacarotin, vitamin_b1, vitamin_b2, vitamin_b6, vitamin_b12, vitamin_c
        , vitamin_d, vitamin_e, vitamin_k);

    END create_complete_food;

END api;
/
