CREATE OR REPLACE PACKAGE DIETPLAN.FOOD_SERVICE AS
    function insert_new_lebensmittel (
        t_lebensmittel IN OUT lebensmittel
    ) return food_metadata.id%TYPE;

END food_service;
/
