CREATE OR REPLACE PACKAGE BODY "DIETPLAN"."FOOD_SERVICE" AS

  PROCEDURE insert_new_lebensmittel (
        t_metainfo       IN OUT lebensmittel_metainfo,
        t_vitamin        IN OUT vitamin,
        t_brennstoff     IN OUT brennstoff,
        t_mineralstoff   IN OUT mineralstoff
    ) AS
  BEGIN
    -- do some validation
    
    food_transaction_manager.insert_new_lebensmittel(t_metainfo,t_vitamin,t_brennstoff,t_mineralstoff);
    
  END insert_new_lebensmittel;

END FOOD_SERVICE;
/
