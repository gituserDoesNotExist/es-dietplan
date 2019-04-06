CREATE OR REPLACE TYPE "DIETPLAN"."LEBENSMITTEL_BUILDER" AS OBJECT (
    t_lebensmittel lebensmittel,
    CONSTRUCTOR FUNCTION lebensmittel_builder (
           self IN OUT NOCOPY lebensmittel_builder,
           p_bezeichnung VARCHAR2
       ) RETURN SELF AS RESULT,
    STATIC FUNCTION a_lebensmittel (
           p_bezeichnung VARCHAR2
       ) RETURN lebensmittel_builder,
    MEMBER FUNCTION with_vitamin (
           p_vitamin IN vitamin
       ) RETURN lebensmittel_builder,
    MEMBER FUNCTION with_brennstoff (
           p_brennstoff IN brennstoff
       ) RETURN lebensmittel_builder,
    MEMBER FUNCTION with_mineralstoff (
           p_mineralstoff IN mineralstoff
       ) RETURN lebensmittel_builder,
    MEMBER FUNCTION build_lebensmittel RETURN lebensmittel
);
/
CREATE OR REPLACE TYPE BODY "DIETPLAN"."LEBENSMITTEL_BUILDER" AS
    CONSTRUCTOR FUNCTION lebensmittel_builder (
        self            IN OUT          lebensmittel_builder,
        p_bezeichnung   VARCHAR2
    ) RETURN SELF AS RESULT IS
    BEGIN
        t_lebensmittel := NEW lebensmittel(p_bezeichnung);
        return;
    END;

    STATIC FUNCTION a_lebensmittel (
        p_bezeichnung VARCHAR2
    ) RETURN lebensmittel_builder IS
    BEGIN
        RETURN NEW lebensmittel_builder(p_bezeichnung);
    END;

    MEMBER FUNCTION with_vitamin (
        p_vitamin IN vitamin
    ) RETURN lebensmittel_builder IS
        self_copy lebensmittel_builder := self;
    BEGIN
        self_copy.t_lebensmittel.t_vitamin := p_vitamin;
        RETURN self_copy;
    END;

    MEMBER FUNCTION with_brennstoff (
        p_brennstoff IN brennstoff
    ) RETURN lebensmittel_builder IS
        self_copy lebensmittel_builder := self;
    BEGIN
        self_copy.t_lebensmittel.t_brennstoff := p_brennstoff;
        RETURN self_copy;
    END;

    MEMBER FUNCTION with_mineralstoff (
        p_mineralstoff IN mineralstoff
    ) RETURN lebensmittel_builder IS
        self_copy lebensmittel_builder := self;
    BEGIN
        self_copy.t_lebensmittel.t_mineralstoff := p_mineralstoff;
        RETURN self_copy;
    END;

    MEMBER FUNCTION build_lebensmittel RETURN lebensmittel AS
    BEGIN
        RETURN self.t_lebensmittel;
    END;

END;
/
