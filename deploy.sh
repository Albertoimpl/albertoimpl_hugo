#!/usr/bin/env bash

if [ "$#" != 1 ];
    then
    echo "Usage deploy.sh \"Commit message\""
    exit
fi    

echo "Deploying public folder..." 

echo "Generating theme with url" 
hugo -b http://albertoimpl.com/ -t crisp

echo "Copying public folder to the github.io one"
cp -R public/  ../albertoimpl.github.io

pushd ../albertoimpl.github.io
    git add -A
    echo "Committing with message \"$1\""
    git commit -m "$1"
    git push origin master
popd

git add -A
git commit -m "$1"
git push origin master