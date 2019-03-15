#!/bin/bash

currentDate=$(date +'%c')
logInfo="backup-dietplan -$currentDate : "
logFileName='log.txt'

echo '#########################################################' >> $logFileName
echo "$logInfo start to back up files" >> $logFileName

jarName='scheme2ddl-2.4.3-SNAPSHOT.jar'
java -jar $jarName >> $logFileName

git checkout develop
git add .
git commit -m "backed up files at $currentDate"
git push


exitStatus=$?

if [ $exitStatus -ne 0 ]
then
	echo "$logInfo error during backup!"
fi



