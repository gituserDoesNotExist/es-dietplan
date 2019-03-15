CREATE TABLE "DIETPLAN"."TAGESBEDARF_MINERALSTOFFE" 
   (	"ID" NUMBER(10,0) NOT NULL ENABLE, 
	"CALCIUM" BINARY_FLOAT, 
	"CHLORID" BINARY_FLOAT, 
	"EISEN" BINARY_FLOAT, 
	"FLUORID" BINARY_FLOAT, 
	"IODID" BINARY_FLOAT, 
	"KALIUM" BINARY_FLOAT, 
	"KUPFER" BINARY_FLOAT, 
	"MANGAN" BINARY_FLOAT, 
	"MAGNESIUM" BINARY_FLOAT, 
	"NATRIUM" BINARY_FLOAT, 
	"PHOSPHOR" BINARY_FLOAT, 
	"SCHWEFEL" BINARY_FLOAT, 
	"ZINK" BINARY_FLOAT
   ) ;
  ALTER TABLE "DIETPLAN"."TAGESBEDARF_MINERALSTOFFE" ADD CONSTRAINT "PK_TAGESBEDARF_MINERALSTOFFE" PRIMARY KEY ("ID") ENABLE;
  CREATE UNIQUE INDEX "DIETPLAN"."PK_TAGESBEDARF_MINERALSTOFFE" ON "DIETPLAN"."TAGESBEDARF_MINERALSTOFFE" ("ID") 
  ;
