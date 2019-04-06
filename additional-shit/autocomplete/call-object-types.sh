#!/bin/bash

objectname=$1

if [ -z $objectname ] 
then
	echo 'pass objectname as first parameter!'
	exit 1
fi


result=$(sqlplus -s dietplan/dietplan << EOF
set serveroutput on;
set feedback off;
set verify off;
@object-types.sql $objectname
/
exit;
EOF
)


echo $result
