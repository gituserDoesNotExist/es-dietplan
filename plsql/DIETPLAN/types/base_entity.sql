CREATE OR REPLACE TYPE DIETPLAN.BASE_ENTITY AS OBJECT (
    entity_id       INTEGER,
    created_at      TIMESTAMP,
    last_modified   TIMESTAMP,
    CONSTRUCTOR FUNCTION base_entity (
           self IN OUT NOCOPY base_entity,
           p_id INTEGER
       ) RETURN SELF AS RESULT,
    MEMBER FUNCTION equals (
           other_entity base_entity
       ) RETURN BOOLEAN
) NOT FINAL;
/
CREATE OR REPLACE TYPE BODY DIETPLAN.BASE_ENTITY AS
    CONSTRUCTOR FUNCTION base_entity (
        self IN OUT NOCOPY base_entity,
        p_id INTEGER
    ) RETURN SELF AS RESULT AS
    BEGIN
        self.entity_id := p_id;
        return;
    END base_entity;

    MEMBER FUNCTION equals (
        other_entity base_entity
    ) RETURN BOOLEAN AS
    BEGIN
        IF other_entity IS NULL THEN
            RETURN false;
        END IF;
        RETURN self.entity_id = other_entity.entity_id;
    END equals;

END;
/
