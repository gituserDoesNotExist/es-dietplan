CREATE OR REPLACE PACKAGE BODY "DIETPLAN"."API" AS

  PROCEDURE create_complete_food (
        food_id OUT VARCHAR2,
        food_name varchar2,
        brennstoffe_fett varchar2,
        brennstoffe_eiweiss varchar2,
        brennstoffe_kohlenhydrate varchar2
        
    ) AS
    next_food_id FOOD.ID%TYPE;
    next_brennstoffe_id BRENNSTOFFE.ID%TYPE;
  BEGIN
    dbms_output.put_line('inserting into tables');
    
    next_food_id := SEQ_FOOD.nextval;
    next_brennstoffe_id := SEQ_BRENNSTOFFE.nextval;
    
    insert into food(id,name) values(next_food_id,food_name);
    insert into brennstoffe(id,fett,eiweiss,kohlenhydrate,food_id) values (next_brennstoffe_id,brennstoffe_fett,brennstoffe_eiweiss,brennstoffe_kohlenhydrate,next_food_id);
    
    COMMIT;
    
  END create_complete_food;

END API;
/
