CREATE TABLE "DIETPLAN"."FOOD_METADATA" 
   (	"ID" NUMBER(10,0) NOT NULL ENABLE, 
	"NAME" VARCHAR2(100)
   ) ;
  ALTER TABLE "DIETPLAN"."FOOD_METADATA" ADD CONSTRAINT "PK_FOOD_METADATA" PRIMARY KEY ("ID") ENABLE;
  CREATE UNIQUE INDEX "DIETPLAN"."PK_FOOD_METADATA" ON "DIETPLAN"."FOOD_METADATA" ("ID") 
  ;
