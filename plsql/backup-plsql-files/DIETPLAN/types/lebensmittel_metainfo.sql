CREATE OR REPLACE TYPE "DIETPLAN"."LEBENSMITTEL_METAINFO" UNDER base_entity (
    bezeichnung VARCHAR2(100),
    CONSTRUCTOR FUNCTION lebensmittel_metainfo (
           self IN OUT NOCOPY lebensmittel_metainfo,
           p_bezeichnung VARCHAR2
       ) RETURN SELF AS RESULT
)
/
CREATE OR REPLACE TYPE BODY "DIETPLAN"."LEBENSMITTEL_METAINFO" AS
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
