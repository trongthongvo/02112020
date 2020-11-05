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
        sh '''
              ./nodejs.sh  
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
        sh '''
              ./python.sh
         '''               
                } 
            }
        stage('All') {
            when {
                expression { params.BUILD_APP == 'all' }
            } 
            agent {
        label 'master'
        }
            steps {
       sh 'whoami'
        sh '''
              ./nodejs.sh 
              ./python.sh
         '''               
                } 
            }
        
        stage('Deploy Nodejs ') {
            when {
                expression { params.BUILD_APP == 'nodejs' }
            } 
            agent {
        label 'node'
        }
            steps {
        sh 'whoami'
        sh './checknodejs.sh' 
        sh '''
                  docker pull trongthongvo/node-js-2020:latest
                  docker run --name node-js-2020 -d -p 3000:3000  -e APP_VERSION=v1 -e APP_ENV=release -e APP_HOST="hostname_node_2" trongthongvo/node-js-2020:latest
                  docker logs node-js-2020
                  '''
          
                } 
            }

        stage('Deploy python ') {
            when {
                expression { params.BUILD_APP == 'python' }
            } 
            agent {
        label 'node'
        }
            steps {
        sh 'whoami'
        sh './checkpython.sh' 
        sh '''
                  docker pull trongthongvo/python-app-2020:latest
                  docker run --name python-app-2020 -d -p 5000:5000 trongthongvo/python-app-2020:latest
                  docker logs python-app-2020
                  '''
          
                } 
            }

        stage('Deploy All') {
            when {
                expression { params.BUILD_APP == 'all' }
            } 
            agent {
        label 'node'
        }
            steps {
        sh './checkpython.sh' 
        sh './checknodejs.sh' 
        sh '''
                  docker pull trongthongvo/node-js-2020:latest
                  docker run --name node-js-2020 -d -p 3000:3000  -e APP_VERSION=v1 -e APP_ENV=release -e APP_HOST="hostname_node_2" trongthongvo/node-js-2020:latest
                  docker logs node-js-2020
                  docker pull trongthongvo/python-app-2020:latest
                  docker run --name python-app-2020 -d -p 5000:5000 trongthongvo/python-app-2020:latest
                  docker logs python-app-2020
                  '''
          
                } 
            }

    }


}
