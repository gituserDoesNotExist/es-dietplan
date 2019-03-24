EXECUTE drop_utils.drop_object_type_safely('lebensmittel_metainfo');

EXECUTE drop_utils.drop_object_type_safely('vitamin');

EXECUTE drop_utils.drop_object_type_safely('mineralstoff');

EXECUTE drop_utils.drop_object_type_safely('base_entity');
/

CREATE OR REPLACE TYPE base_entity AS OBJECT (
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

CREATE OR REPLACE TYPE BODY base_entity AS
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

CREATE OR REPLACE TYPE lebensmittel_metainfo UNDER base_entity (
    bezeichnung VARCHAR2(100),
    CONSTRUCTOR FUNCTION lebensmittel_metainfo (
           self IN OUT NOCOPY lebensmittel_metainfo,
           p_bezeichnung VARCHAR2
       ) RETURN SELF AS RESULT
)
/

CREATE OR REPLACE TYPE BODY lebensmittel_metainfo AS
    CONSTRUCTOR FUNCTION lebensmittel_metainfo (
        self IN OUT NOCOPY lebensmittel_metainfo,
        p_bezeichnung VARCHAR2
    ) RETURN SELF AS RESULT AS
    BEGIN
        self.bezeichnung := p_bezeichnung;
        return;
    END lebensmittel_metainfo;

END;
/

CREATE OR REPLACE TYPE vitamin UNDER base_entity (
    vit_a_retinol       BINARY_FLOAT,
    vit_a_betacarotin   BINARY_FLOAT,
    vit_b1              BINARY_FLOAT,
    vit_b2              BINARY_FLOAT,
    vit_b6              BINARY_FLOAT,
    vit_b12             BINARY_FLOAT,
    vit_c               BINARY_FLOAT,
    vit_d               BINARY_FLOAT,
    vit_e               BINARY_FLOAT,
    vit_k               BINARY_FLOAT,
    food_id             INTEGER,
    CONSTRUCTOR FUNCTION vitamin (
           self IN OUT NOCOPY vitamin,
           p_retinol       BINARY_FLOAT,
           p_betacarotin   BINARY_FLOAT,
           p_b1            BINARY_FLOAT,
           p_b2            BINARY_FLOAT,
           p_b6            BINARY_FLOAT,
           p_b12           BINARY_FLOAT,
           p_c             BINARY_FLOAT,
           p_d             BINARY_FLOAT,
           p_e             BINARY_FLOAT,
           p_k             BINARY_FLOAT,
           p_food_id       INTEGER
       ) RETURN SELF AS RESULT
);
/

CREATE OR REPLACE TYPE BODY vitamin AS
    CONSTRUCTOR FUNCTION vitamin (
        self IN OUT NOCOPY vitamin,
        p_retinol       BINARY_FLOAT,
        p_betacarotin   BINARY_FLOAT,
        p_b1            BINARY_FLOAT,
        p_b2            BINARY_FLOAT,
        p_b6            BINARY_FLOAT,
        p_b12           BINARY_FLOAT,
        p_c             BINARY_FLOAT,
        p_d             BINARY_FLOAT,
        p_e             BINARY_FLOAT,
        p_k             BINARY_FLOAT,
        p_food_id       INTEGER
    ) RETURN SELF AS RESULT AS
    BEGIN
        self.vit_a_retinol := p_retinol;
        self.vit_a_betacarotin := p_betacarotin;
        self.vit_b1 := p_b1;
        self.vit_b2 := p_b2;
        self.vit_b6 := p_b6;
        self.vit_b12 := p_b12;
        self.vit_c := p_c;
        self.vit_d := p_d;
        self.vit_e := p_e;
        self.vit_k := p_k;
        self.food_id := p_food_id;
        return;
    END vitamin;

END;
/

CREATE OR REPLACE TYPE mineralstoff UNDER base_entity (
    calcium     BINARY_FLOAT,
    chlorid     BINARY_FLOAT,
    eisen       BINARY_FLOAT,
    fluorid     BINARY_FLOAT,
    iodid       BINARY_FLOAT,
    kalium      BINARY_FLOAT,
    kupfer      BINARY_FLOAT,
    mangan      BINARY_FLOAT,
    magnesium   BINARY_FLOAT,
    natrium     BINARY_FLOAT,
    phosphor    BINARY_FLOAT,
    schwefel    BINARY_FLOAT,
    zink        BINARY_FLOAT,
    food_id     INTEGER,
    CONSTRUCTOR FUNCTION mineralstoff (
           self IN OUT NOCOPY mineralstoff,
           p_calcium     BINARY_FLOAT,
           p_chlorid     BINARY_FLOAT,
           p_eisen       BINARY_FLOAT,
           p_fluorid     BINARY_FLOAT,
           p_iodid       BINARY_FLOAT,
           p_kalium      BINARY_FLOAT,
           p_kupfer      BINARY_FLOAT,
           p_mangan      BINARY_FLOAT,
           p_magnesium   BINARY_FLOAT,
           p_natrium     BINARY_FLOAT,
           p_phosphor    BINARY_FLOAT,
           p_schwefel    BINARY_FLOAT,
           p_zink        BINARY_FLOAT,
           p_food_id     INTEGER
       ) RETURN SELF AS RESULT
)
/

CREATE OR REPLACE TYPE BODY mineralstoff AS
    CONSTRUCTOR FUNCTION mineralstoff (
        self IN OUT NOCOPY mineralstoff,
        p_calcium     BINARY_FLOAT,
        p_chlorid     BINARY_FLOAT,
        p_eisen       BINARY_FLOAT,
        p_fluorid     BINARY_FLOAT,
        p_iodid       BINARY_FLOAT,
        p_kalium      BINARY_FLOAT,
        p_kupfer      BINARY_FLOAT,
        p_mangan      BINARY_FLOAT,
        p_magnesium   BINARY_FLOAT,
        p_natrium     BINARY_FLOAT,
        p_phosphor    BINARY_FLOAT,
        p_schwefel    BINARY_FLOAT,
        p_zink        BINARY_FLOAT,
        p_food_id     INTEGER
    ) RETURN SELF AS RESULT AS
    BEGIN
        self.calcium := p_calcium;
        self.chlorid := p_chlorid;
        self.eisen := p_eisen;
        self.fluorid := p_fluorid;
        self.iodid := p_iodid;
        self.kalium := p_kalium;
        self.kupfer := p_kupfer;
        self.mangan := p_mangan;
        self.magnesium := p_magnesium;
        self.natrium := p_natrium;
        self.phosphor := p_phosphor;
        self.schwefel := p_schwefel;
        self.zink := p_zink;
        self.food_id := p_food_id;
        return;
    END mineralstoff;

END;
/


CREATE OR REPLACE TYPE brennstoff UNDER base_entity (
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


CREATE OR REPLACE
TYPE BODY BRENNSTOFF AS

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