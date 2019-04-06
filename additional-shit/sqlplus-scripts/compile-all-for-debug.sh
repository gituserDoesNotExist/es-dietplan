#!/bin/bash

sqlplus -s dietplan/dietplan << EOF
commit;
@compile-all.sql;
commit;
exit
EOF
