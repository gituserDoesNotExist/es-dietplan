CREATE OR REPLACE PACKAGE DIETPLAN.NEW_DAO AS  -- Gibt die ID des angelegten Lebensmittels zurueck FUNCTION create_lebensmittel ( t_lebensmittel IN OUT lebensmittel ) RETURN food_metadata.id%TYPE;  END NEW_DAO; /
