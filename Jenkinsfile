pipeline {
    agent any
    environment {
      DOCKERHUB_PW = credentials('PW-dockerhub-112020')
  }
    parameters {
        choice(
            choices: ['all', 'nodejs', 'python'],
            description: '',
            name: 'BUILD_APP',
            )
}

    stages {
        stage('Build code Nodejs ') {
            when {
                expression { params.BUILD_APP == 'nodejs' }
            } 
            agent {
        label 'master'
        }
            steps {
        sh 'whoami'
        sh '''ls -la
        pwd
        cd $PWD/nodejs
        docker build -t node-js-2020:$BUILD_NUMBER .
        docker images
        docker run -d --name node-js-2020 -p 3000:3000  -e APP_VERSION=v1 -e APP_ENV=release -e APP_HOST=hostname_node_2 node-js-2020:$BUILD_NUMBER
        docker ps -a
        docker logs node-js-2020
        docker tag node-js-2020:$BUILD_NUMBER trongthongvo/node-js-2020:$BUILD_NUMBER
        docker tag node-js-2020:$BUILD_NUMBER trongthongvo/node-js-2020:latest
        docker images
        docker login -u trongthongvo -p $DOCKERHUB_PW
        docker push trongthongvo/node-js-2020:$BUILD_NUMBER
        docker push trongthongvo/node-js-2020:latest
        docker rm -f node-js-2020
        docker rmi trongthongvo/node-js-2020:$BUILD_NUMBER
        docker rmi trongthongvo/node-js-2020:latest 
        docker rmi node-js-2020:$BUILD_NUMBER
        '''
                } 
            }
    
        stage('Build code Python ') {
            when {
                expression { params.BUILD_APP == 'python' }
            } 
            agent {
        label 'master'
        }
            steps {
       sh 'whoami'
        sh '''ls -la
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
         '''               
                } 
            }

    }

}
