#!/bin/bash
#
# Shell script used by Jenkins to deploy a version to staging following successful testing.
#
cd /tmp
ssh -T git@github.com
rm -rf vaolo
git clone git://github.com/MaximeLet/vaolo.git
cd vaolo
git remote set-url origin git@github.com:MaximeLet/vaolo.git
git checkout -b test origin/test
git merge origin/master
git push --all
git checkout -b staging origin/staging
git merge origin/test
git push --all
