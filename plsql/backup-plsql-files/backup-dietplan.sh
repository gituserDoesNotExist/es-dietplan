#!/bin/bash

jarName='scheme2ddl-2.4.3-SNAPSHOT.jar'
currentDate=$(date +'%c')

java -jar $jarName

git add .
git commit -m "backed up files at $currentDate"
git push



