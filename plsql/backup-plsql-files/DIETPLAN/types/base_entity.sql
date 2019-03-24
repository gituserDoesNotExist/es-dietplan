CREATE OR REPLACE TYPE "DIETPLAN"."BASE_ENTITY" AS OBJECT 
( 
 entity_id integer,
 member function equals(other_entity base_entity) return boolean
)
/
CREATE OR REPLACE TYPE BODY "DIETPLAN"."BASE_ENTITY" AS

  member function equals(other_entity base_entity) return boolean AS
  BEGIN
    -- TODO: Implementation required for function BASE_ENTITY.equals
    RETURN NULL;
  END equals;

END;
/
