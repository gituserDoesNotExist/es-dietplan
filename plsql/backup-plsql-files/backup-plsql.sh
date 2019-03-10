#!/bin/bash

logInfo='backup-plsql.sh: '

schema='dietplan'
password='dietplan'
backupBaseDir=$(pwd)
scheme2dllJarName='scheme2ddl-2.4.3-SNAPSHOT.jar'
currentDate=$(date +'%c')

echo $logInfo 'starting oracle db'
sudo su -c "service oracle-xe start"


echo $logInfo $currentDate: 'backing up schema"' $schema '"to "'$backupBaseDir'"'

java -jar $scheme2dllJarName -url $schema/$password@localhost:1521:xe -o $backupBaseDir


echo $logInfo 'pushing to origin develop'

git checkout develop
git add .
git commit -m "backup plsql files at $currentDate"
git push -u origin develop
