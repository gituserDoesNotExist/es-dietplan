CREATE OR REPLACE PACKAGE BODY "DIETPLAN"."API" AS

  PROCEDURE create_complete_food (
        food_id OUT VARCHAR2,
        food_name varchar2,
        brennstoffe_fett varchar2,
        brennstoffe_eiweiss varchar2,
        brennstoffe_kohlenhydrate varchar2
        
    ) AS
    next_food_id FOOD_METADATA.ID%TYPE;
    next_brennstoffe_id BRENNSTOFFE.ID%TYPE;
  BEGIN
    dbms_output.put_line('inserting into tables');
    
    next_food_id := SEQ_FOOD_METADATA.nextval;
    next_brennstoffe_id := SEQ_BRENNSTOFFE.nextval;
    
    
    
    
    COMMIT;
    
  END create_complete_food;

END API;
/
