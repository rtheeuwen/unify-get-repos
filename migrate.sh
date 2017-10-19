#!/bin/bash
PROJECT=$(echo $1 | sed 's/\/*$//g')
cd $PROJECT
mkdir $PROJECT
find . -maxdepth 1 ! -name $PROJECT |grep -v '^\./\.' | grep -v '^\.$' | tee | xargs -I '{}' ~/gitrewrite.sh '{}'=$PROJECT/'{}'
git commit -m "preparing for directory migration"
cd ..
git pull $PROJECT --allow-unrelated-histories 
xdotool key "control+x"
rm $PROJECT/$PROJECT -rf
rm $PROJECT/.git -rf

