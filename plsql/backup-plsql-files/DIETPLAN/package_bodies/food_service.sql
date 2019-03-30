CREATE OR REPLACE PACKAGE BODY "DIETPLAN"."FOOD_SERVICE" AS

  PROCEDURE insert_new_lebensmittel (
        t_lebensmittel       IN OUT lebensmittel
    ) AS
  BEGIN
    -- do some validation
    
    food_transaction_manager.insert_new_lebensmittel(t_lebensmittel);
    
  END insert_new_lebensmittel;

END FOOD_SERVICE;
/
