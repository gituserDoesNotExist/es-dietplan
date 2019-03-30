CREATE OR REPLACE TYPE "DIETPLAN"."LEBENSMITTEL" UNDER base_entity (
    v_bezeichnung    VARCHAR2(100),
    vsdf varchar2(100),
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
