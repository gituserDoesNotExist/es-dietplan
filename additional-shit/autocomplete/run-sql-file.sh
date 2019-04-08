#!/bin/bash

#Full filename (path+name) must be passed as first and only parameter!

filename=$1

if [ -z $filename ]
then
	echo 'you have to pass the filepath (path+name) as parameter!'
	exit 1
fi


sqlplus -s dietplan/dietplan << EOF
COMMIT;
@$filename
.
RUN
COMMIT;
exit
EOF
