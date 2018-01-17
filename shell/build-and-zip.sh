#!/usr/bin/env bash

git add --all

git commit -m 'Optimize user experience'

git pull origin master

git push origin master

rm -rf ./dist/*

npm run build

zip -r ./dist.zip ./dist/*

ssh root@60.205.207.85 -p 61066 "rm -rf /usr/local/tomcat-build/webapps/artup-build/builder/mobile* ;"

scp -r -P 61066 ./dist/* root@60.205.207.85:/usr/local/tomcat-build/webapps/artup-build/builder/mobile/

echo "发布上线完成..."
