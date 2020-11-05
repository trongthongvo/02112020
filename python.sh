#!/bin/bash
ls -la
pwd
cd $PWD/python
docker build -t python-app-2020:$BUILD_NUMBER .
docker images
docker run --name python-app-2020 -p 5000:5000 -d python-app-2020:$BUILD_NUMBER
docker ps -a
docker logs python-app-2020
docker tag python-app-2020:$BUILD_NUMBER trongthongvo/python-app-2020:$BUILD_NUMBER
docker tag python-app-2020:$BUILD_NUMBER trongthongvo/python-app-2020:latest
docker images
docker login -u trongthongvo -p $DOCKERHUB_PW
docker push trongthongvo/python-app-2020:$BUILD_NUMBER
docker push trongthongvo/python-app-2020:latest
docker rm -f python-app-2020
docker rmi trongthongvo/python-app-2020:$BUILD_NUMBER
docker rmi trongthongvo/python-app-2020:latest        
docker rmi python-app-2020:$BUILD_NUMBER