#!/bin/bash
PROJECT=$(echo $1 | sed 's/\/*$//g')
cd $PROJECT
mkdir $PROJECT
find . -maxdepth 1 ! -name $PROJECT | grep -v '^\./\.' | grep -v '^\.$' | xargs -I '{}' ~/gitrewrite.sh '{}'=$PROJECT/'{}'
git commit -m "preparing for directory migration"
cd ..
git pull $PROJECT --allow-unrelated-histories 
rm $PROJECT/$PROJECT -rf
rm $PROJECT/.git -rf

