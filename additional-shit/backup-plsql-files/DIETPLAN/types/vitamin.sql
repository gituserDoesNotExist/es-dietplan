CREATE OR REPLACE TYPE "DIETPLAN"."VITAMIN" UNDER base_entity (
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
CREATE OR REPLACE TYPE BODY "DIETPLAN"."VITAMIN" AS
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
