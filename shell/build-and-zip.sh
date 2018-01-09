#!/usr/bin/env bash

git add --all

git commit -m 'Optimize user experience'

git pull origin master

git push origin master

rm -rf ./dist/*

npm run build

zip -r ./dist.zip ./dist/*
