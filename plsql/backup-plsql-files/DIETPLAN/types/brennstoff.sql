CREATE OR REPLACE TYPE "DIETPLAN"."BRENNSTOFF" UNDER base_entity (
    fett            BINARY_FLOAT,
    eiweiss         BINARY_FLOAT,
    kohlenhydrate   BINARY_FLOAT,
    food_id         INTEGER,
    CONSTRUCTOR FUNCTION brennstoff (
           self IN OUT NOCOPY brennstoff,
           fett            BINARY_FLOAT,
           eiweiss         BINARY_FLOAT,
           kohlenhydrate   binary_float,
           food_id         INTEGER
       ) RETURN SELF AS RESULT
)
/
CREATE OR REPLACE TYPE BODY "DIETPLAN"."BRENNSTOFF" AS

  CONSTRUCTOR FUNCTION brennstoff (
           self IN OUT NOCOPY brennstoff,
           fett            BINARY_FLOAT,
           eiweiss         BINARY_FLOAT,
           kohlenhydrate   binary_float,
           food_id         INTEGER
       ) RETURN SELF AS RESULT AS
  BEGIN
    self.fett := fett;
    self.eiweiss := eiweiss;
    self.kohlenhydrate := kohlenhydrate;
    self.food_id := food_id;
    RETURN;
  END brennstoff;

END;
/
