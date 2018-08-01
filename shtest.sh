#!/bin/bash

echo "Build Step"

date

git pull

cppcheck . --xml 2> cppcheck-result.xml
gcc -c HelloWorld.c main.c
gcc -o Hello HelloWorld.o main.o
./Hello

git add .

git commit -m i"EC2 Cron #$cnt"

cnt=cnt+1

git push
