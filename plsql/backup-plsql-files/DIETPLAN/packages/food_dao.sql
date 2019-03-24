CREATE OR REPLACE PACKAGE "DIETPLAN"."FOOD_DAO" AS
    PROCEDURE create_lebensmittel_metainfo (
        metainfo IN OUT lebensmittel_metainfo
    );

    PROCEDURE create_brennstoff (
        p_brennstoff IN OUT brennstoff
    );

    PROCEDURE create_mineralstoff (
        p_mineralstoff IN OUT mineralstoff
    );

    PROCEDURE create_vitamin (
        p_vitamin IN OUT vitamin
    );

 
END food_dao;
/
