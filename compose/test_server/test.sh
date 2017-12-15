#!/bin/bash
#
# Automates testing of current project following changes in the master branch
#
ssh -T git@github.com
rm -rf vaolo
git clone git://github.com/MaximeLet/vaolo.git
cd vaolo
git remote set-url origin git@github.com:MaximeLet/vaolo.git
git checkout -b test origin/test
git merge master
git push --all
npm install
npm run test-ci

