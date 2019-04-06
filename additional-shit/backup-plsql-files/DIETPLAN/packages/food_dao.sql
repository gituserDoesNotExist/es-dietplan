CREATE OR REPLACE PACKAGE "DIETPLAN"."FOOD_DAO" AS

    -- Gibt die ID des angelegten Lebensmittels zurueck
    FUNCTION create_lebensmittel (
        t_lebensmittel IN OUT lebensmittel
    ) RETURN food_metadata.id%TYPE;

END food_dao;
/
