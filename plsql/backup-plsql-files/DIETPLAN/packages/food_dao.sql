CREATE OR REPLACE PACKAGE "DIETPLAN"."FOOD_DAO" AS
    PROCEDURE create_lebensmittel (
        t_lebensmittel IN OUT lebensmittel
    );

END food_dao;
/
