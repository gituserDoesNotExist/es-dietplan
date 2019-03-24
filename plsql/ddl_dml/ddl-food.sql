SET SERVEROUTPUT ON;

BEGIN
    drop_utils.drop_table_safely('vitamine');
    drop_utils.drop_table_safely('mineralstoffe');
    drop_utils.drop_table_safely('brennstoffe');
    drop_utils.drop_table_safely('food_metadata');
    drop_utils.drop_sequence_safely('seq_food_metadata');
    drop_utils.drop_sequence_safely('seq_vitamine');
    drop_utils.drop_sequence_safely('seq_mineralstoffe');
    drop_utils.drop_sequence_safely('seq_brennstoffe');
END;
/

/*alle angaben in mg/100g */

CREATE TABLE food_metadata (
    id              integer NOT NULL,
    created_at      TIMESTAMP NOT NULL,
    last_modified   TIMESTAMP NOT NULL,
    name            VARCHAR2(100) NOT NULL,
    CONSTRAINT pk_food_metadata PRIMARY KEY ( id )
);
/

CREATE SEQUENCE seq_food_metadata START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

CREATE TABLE vitamine (
    id                      integer NOT NULL,
    created_at              TIMESTAMP NOT NULL,
    last_modified           TIMESTAMP NOT NULL,
    vitamin_a_retinol       BINARY_FLOAT,
    vitamin_a_betacarotin   BINARY_FLOAT,
    vitamin_b1              BINARY_FLOAT,
    vitamin_b2              BINARY_FLOAT,
    vitamin_b6              BINARY_FLOAT,
    vitamin_b12             BINARY_FLOAT,
    vitamin_c               BINARY_FLOAT,
    vitamin_d               BINARY_FLOAT,
    vitamin_e               BINARY_FLOAT,
    vitamin_k               BINARY_FLOAT,
    food_id                 integer NOT NULL,
    CONSTRAINT pk_vitamine PRIMARY KEY ( id ),
    CONSTRAINT fk_vitamine_food FOREIGN KEY ( food_id )
        REFERENCES food_metadata ( id )
);
/

CREATE SEQUENCE seq_vitamine START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

-- mineralstoffe k�nnen in Mengen- und Spurenelemente unterteilt werden

CREATE TABLE mineralstoffe (
    id              integer NOT NULL,
    created_at      TIMESTAMP NOT NULL,
    last_modified   TIMESTAMP NOT NULL,
    calcium         BINARY_FLOAT,
    chlorid         BINARY_FLOAT,
    eisen           BINARY_FLOAT,
    fluorid         BINARY_FLOAT,
    iodid           BINARY_FLOAT,
    kalium          BINARY_FLOAT,
    kupfer          BINARY_FLOAT,
    mangan          BINARY_FLOAT,
    magnesium       BINARY_FLOAT,
    natrium         BINARY_FLOAT,
    phosphor        BINARY_FLOAT,
    schwefel        BINARY_FLOAT,
    zink            BINARY_FLOAT,
    food_id         integer NOT NULL,
    CONSTRAINT pk_mineralstoffe PRIMARY KEY ( id ),
    CONSTRAINT fk_mineralstoffe_food FOREIGN KEY ( food_id )
        REFERENCES food_metadata ( id )
);
/

CREATE SEQUENCE seq_mineralstoffe START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

CREATE TABLE brennstoffe (
    id              integer NOT NULL,
    created_at      TIMESTAMP NOT NULL,
    last_modified   TIMESTAMP NOT NULL,
    fett            BINARY_FLOAT,
    eiweiss         BINARY_FLOAT,
    kohlenhydrate   BINARY_FLOAT,
    food_id         integer NOT NULL,
    CONSTRAINT pk_brennstoffe PRIMARY KEY ( id ),
    CONSTRAINT fk_brennstoffe_food FOREIGN KEY ( food_id )
        REFERENCES food_metadata ( id )
);
/

CREATE SEQUENCE seq_brennstoffe START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;