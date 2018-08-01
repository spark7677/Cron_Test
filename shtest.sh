#!/bin/bash


echo ""
echo "########## Cron Build Time ##########"

date

echo ""
echo "############# GIT PULL ##############"
git pull

echo ""
echo "############# CPPCHECK ##############" 

cppcheck . --xml 2> cppcheck-result.xml

echo ""
echo "############# Compiling ##############"

gcc -c HelloWorld.c main.c
gcc -o Hello HelloWorld.o main.o

echo ""
echo "########### Excuting File ############"
echo ""
./Hello

echo ""
echo "############### GIT ADD ##############"
echo "################ DONE ################"

git add .

git commit -m "EC2 Cron Build $date"

git push
echo ""
