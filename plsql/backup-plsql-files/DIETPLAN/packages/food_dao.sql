CREATE OR REPLACE PACKAGE "DIETPLAN"."FOOD_DAO" AS
    PROCEDURE create_food_metadata (
        food_id     OUT         food_metadata.id%TYPE,
        food_name   IN          food_metadata.name%TYPE
    );

    PROCEDURE create_brennstoff (
        brennstoff_id              OUT                        brennstoffe.id%TYPE,
        brennstoff_fett            IN                         brennstoffe.fett%TYPE,
        brennstoff_eiweiss         IN                         brennstoffe.eiweiss%TYPE,
        brennstoff_kohlenhydrate   IN                         brennstoffe.kohlenhydrate%TYPE,
        brennstoff_food_id         IN                         brennstoffe.food_id%TYPE
    );

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
    );

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
    );

END food_dao;
/
