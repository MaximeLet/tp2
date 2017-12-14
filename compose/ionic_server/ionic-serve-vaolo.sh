#!/bin/bash
# 
# Generic script used for branches master, staging, and prod
#

cd /vaolo/$BRANCH
rm -rf vaolo 
ssh -T git@github.com
git clone git://github.com/MaximeLet/vaolo.git
cd vaolo
git remote set-url origin git@github.com:MaximeLet/vaolo.git
git checkout -b $BRANCH origin/$BRANCH
git merge master
git push --all

npm install

ionic serve -p $PORT