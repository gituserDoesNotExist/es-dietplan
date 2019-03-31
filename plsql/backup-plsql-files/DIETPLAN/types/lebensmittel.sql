CREATE OR REPLACE TYPE "DIETPLAN"."LEBENSMITTEL" UNDER base_entity (
    v_bezeichnung    VARCHAR2(100),
    t_vitamin        vitamin,
    t_mineralstoff   mineralstoff,
    t_brennstoff     brennstoff,
    CONSTRUCTOR FUNCTION lebensmittel (
           self IN OUT NOCOPY lebensmittel,
           p_bezeichnung VARCHAR2
       ) RETURN SELF AS RESULT,
    CONSTRUCTOR FUNCTION lebensmittel (
           self IN OUT NOCOPY lebensmittel,
           p_bezeichnung    VARCHAR2,
           p_vitamin        IN               vitamin,
           p_mineralstoff   IN               mineralstoff,
           p_brennstoff     brennstoff
       ) RETURN SELF AS RESULT
)
/
CREATE OR REPLACE TYPE BODY "DIETPLAN"."LEBENSMITTEL" AS
    CONSTRUCTOR FUNCTION lebensmittel (
        self IN OUT NOCOPY lebensmittel,
        p_bezeichnung VARCHAR2
    ) RETURN SELF AS RESULT IS
    BEGIN
        self := lebensmittel(p_bezeichnung, NULL, NULL, NULL);
        return;
    END;

    CONSTRUCTOR FUNCTION lebensmittel (
        self IN OUT NOCOPY lebensmittel,
        p_bezeichnung    IN               VARCHAR2,
        p_vitamin        IN               vitamin,
        p_mineralstoff   IN               mineralstoff,
        p_brennstoff     IN               brennstoff
    ) RETURN SELF AS RESULT IS
    BEGIN
        self.v_bezeichnung := p_bezeichnung;
        self.t_vitamin := p_vitamin;
        self.t_mineralstoff := p_mineralstoff;
        self.t_brennstoff := t_brennstoff;
        return;
    END lebensmittel;

END;
/
