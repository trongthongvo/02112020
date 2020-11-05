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
        sh '''git update-index --chmod=+x nodejs.sh
              nodejs.sh  
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
        sh '''git update-index --chmod=+x python.sh
              python.sh
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
        sh '''git update-index --chmod=+x foo.sh
              nodejs.sh 
              python.sh
         '''               
                } 
            }
    }

}
