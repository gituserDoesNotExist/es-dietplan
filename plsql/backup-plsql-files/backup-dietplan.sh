#!/bin/bash

currentDate=$(date +'%c')
logInfo="backup-dietplan -$currentDate : "
logFileName='log.txt'

echo '#########################################################' >> $logFileName
echo "$logInfo start to back up files" >> $logFileName

jarName='scheme2ddl-2.4.3-SNAPSHOT.jar'
java -jar $jarName >> $logFileName

echo '741eba1b' | sudo -kS git checkout develop
echo '741eba1b' | sudo -kS git add .
echo '741eba1b' | sudo -kS git commit -m "backed up files at $currentDate"
echo '741eba1b' | sudo -kS git push


exitStatus=$?

if [ $exitStatus -ne 0 ]
then
	echo "$logInfo error during backup!"
fi

nautilus . & disown



