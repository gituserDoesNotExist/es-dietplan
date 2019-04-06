CREATE OR REPLACE TYPE "DIETPLAN"."MINERALSTOFF" UNDER base_entity (
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
CREATE OR REPLACE TYPE BODY "DIETPLAN"."MINERALSTOFF" AS
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
