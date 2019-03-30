CREATE OR REPLACE PACKAGE BODY "DIETPLAN"."API" AS

    PROCEDURE create_complete_food (
        lebensmittel_metainfo_id     OUT                          food_metadata.id%TYPE,
        lebensmittel_metainfo_name   IN                           food_metadata.name%TYPE,
        --###############################################################################
        brennstoff_fett              IN                           brennstoffe.fett%TYPE,
        brennstoff_eiweiss           IN                           brennstoffe.eiweiss%TYPE,
        brennstoff_kohlenhydrate     IN                           brennstoffe.kohlenhydrate%TYPE,
        --###############################################################################
        mineralstoff_calcium         IN                           mineralstoffe.calcium%TYPE,
        mineralstoff_chlorid         IN                           mineralstoffe.chlorid%TYPE,
        mineralstoff_eisen           IN                           mineralstoffe.eisen%TYPE,
        mineralstoff_fluorid         IN                           mineralstoffe.fluorid%TYPE,
        mineralstoff_iodid           IN                           mineralstoffe.iodid%TYPE,
        mineralstoff_kalium          IN                           mineralstoffe.kalium%TYPE,
        mineralstoff_kupfer          IN                           mineralstoffe.kupfer%TYPE,
        mineralstoff_mangan          IN                           mineralstoffe.mangan%TYPE,
        mineralstoff_magnesium       IN                           mineralstoffe.magnesium%TYPE,
        mineralstoff_natrium         IN                           mineralstoffe.natrium%TYPE,
        mineralstoff_phosphor        IN                           mineralstoffe.phosphor%TYPE,
        mineralstoff_schwefel        IN                           mineralstoffe.schwefel%TYPE,
        mineralstoff_zink            IN                           mineralstoffe.zink%TYPE,
        --###############################################################################
        vitamin_a_retinol            IN                           vitamine.vitamin_a_retinol%TYPE,
        vitamin_a_betacarotin        IN                           vitamine.vitamin_a_betacarotin%TYPE,
        vitamin_b1                   IN                           vitamine.vitamin_b1%TYPE,
        vitamin_b2                   IN                           vitamine.vitamin_b2%TYPE,
        vitamin_b6                   IN                           vitamine.vitamin_b6%TYPE,
        vitamin_b12                  IN                           vitamine.vitamin_b12%TYPE,
        vitamin_c                    IN                           vitamine.vitamin_c%TYPE,
        vitamin_d                    IN                           vitamine.vitamin_d%TYPE,
        vitamin_e                    IN                           vitamine.vitamin_e%TYPE,
        vitamin_k                    IN                           vitamine.vitamin_k%TYPE
    ) AS
        next_food_id     food_metadata.id%TYPE;
        t_lebensmittel       lebensmittel;
        t_brennstoff     brennstoff;
        t_vitamin        vitamin;
        t_mineralstoff   mineralstoff;
    BEGIN
        dbms_output.put_line('inserting into tables');
        t_brennstoff := NEW brennstoff(brennstoff_fett, brennstoff_eiweiss, brennstoff_kohlenhydrate, next_food_id);
        
        t_vitamin := NEW vitamin(vitamin_a_retinol, vitamin_a_betacarotin, vitamin_b1, vitamin_b2, vitamin_b6, vitamin_b12, vitamin_c
        , vitamin_d, vitamin_e, vitamin_k, next_food_id);

        t_mineralstoff := NEW mineralstoff(mineralstoff_calcium, mineralstoff_chlorid, mineralstoff_eisen, mineralstoff_fluorid,
        mineralstoff_iodid, mineralstoff_kalium, mineralstoff_kupfer, mineralstoff_mangan, mineralstoff_magnesium, mineralstoff_natrium
        , mineralstoff_phosphor, mineralstoff_schwefel, mineralstoff_zink, next_food_id);
        
        t_lebensmittel := NEW lebensmittel(lebensmittel_metainfo_name,t_vitamin,t_mineralstoff,t_brennstoff);

        food_service.insert_new_lebensmittel(t_metainfo,t_vitamin,t_brennstoff,t_mineralstoff);


    END create_complete_food;

END api;
/
