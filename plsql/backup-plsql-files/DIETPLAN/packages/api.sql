CREATE OR REPLACE PACKAGE "DIETPLAN"."API" IS
    PROCEDURE create_complete_food (
        food_id OUT VARCHAR2,
        food_name varchar2,
        brennstoffe_fett varchar2,
        brennstoffe_eiweiss varchar2,
        brennstoffe_kohlenhydrate varchar2
        
    );
END api;
/
