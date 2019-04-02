#!/bin/bash

sqlplus -s dietplan/dietplan << EOF
COMMIT;
@/home/manfredbeutel/java-sht/projects/es-dietplan/plsql/ddl_dml/ddl-food.sql
@/home/manfredbeutel/java-sht/projects/es-dietplan/plsql/ddl_dml/ddl-tagesbedarf.sql
@/home/manfredbeutel/java-sht/projects/es-dietplan/plsql/ddl_dml/dml-food.sql
@/home/manfredbeutel/java-sht/projects/es-dietplan/plsql/ddl_dml/dml-tagesbedarf.sql
@/home/manfredbeutel/java-sht/projects/es-dietplan/plsql/ddl_dml/ddl-object-types.sql
COMMIT;
exit
EOF
