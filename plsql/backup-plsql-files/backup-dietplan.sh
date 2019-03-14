#!/bin/bash

currentDate=$(date +'%c')
logInfo="backup-dietplan -$currentDate : "
logFileName='log.txt'

echo '#########################################################' >> $logFileName
echo "$logInfo start to back up files" >> $logFileName

jarName='scheme2ddl-2.4.3-SNAPSHOT.jar'
java -jar $jarName >> $logFileName

git add .
git commit --author="ManfredBeutel <manfred-beutel@web.de>" -m "backed up files at $currentDate"
git push https://gituserDoesNotExist:741eba1b@github.com/gituserDoesNotExist/es-dietplan.git


exitStatus=$?

if [ $exitStatus -ne 0 ]
then
	echo "$logInfo error during backup!"
fi



