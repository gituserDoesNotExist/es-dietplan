CREATE OR REPLACE PACKAGE BODY "DIETPLAN"."API" AS

  PROCEDURE create_complete_food (
        food_id OUT VARCHAR2,
        food_name varchar2,
        brennstoffe_fett varchar2,
        brennstoffe_eiweiss varchar2,
        brennstoffe_kohlenhydrate varchar2
        
    ) AS
    next_id FOOD.ID%TYPE;
  BEGIN
    next_id := SEQ_FOOD.nextval;
    dbms_output.put_line('next id =' || next_id);
  END create_complete_food;

END API;
/
