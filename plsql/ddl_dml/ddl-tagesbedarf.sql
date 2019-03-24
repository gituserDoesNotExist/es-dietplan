EXECUTE drop_utils.drop_table_safely('tagesbedarf_vitamine');
EXECUTE drop_utils.drop_table_safely('tagesbedarf_mineralstoffe');

CREATE TABLE tagesbedarf_vitamine (
    id                    integer NOT NULL,
    created_at            TIMESTAMP NOT NULL,
    last_modified         TIMESTAMP NOT NULL,
    vitaminaretinol       BINARY_FLOAT,
    vitaminabetacarotin   BINARY_FLOAT,
    vitaminb1             BINARY_FLOAT,
    vitaminb2             BINARY_FLOAT,
    vitaminb6             BINARY_FLOAT,
    vitaminb12            BINARY_FLOAT,
    vitaminc              BINARY_FLOAT,
    vitamind              BINARY_FLOAT,
    vitamine              BINARY_FLOAT,
    vitamink              BINARY_FLOAT,
    CONSTRAINT pk_tagesbedarf_vitamine PRIMARY KEY ( id )
);
/

CREATE TABLE tagesbedarf_mineralstoffe (
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
    CONSTRAINT pk_tagesbedarf_mineralstoffe PRIMARY KEY ( id )
);
/