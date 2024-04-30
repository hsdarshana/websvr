pipeline {
  agent any

  stages {
    stage('Build') {
      steps {
        sh 'docker build -t apache-docker-example .'
        sh 'docker tag apache-docker-example apache-docker'
      }
    }
    stage('Test') {
      steps {
        sh 'docker run apache-docker-example'
	HTTP_CODE = sh (
           script: 'echo $(curl --write-out \\"%{http_code}\\" --silent --output /dev/null http://localhost/)',
           returnStdout: true
           ).trim()

        if ('200' != HTTP_CODE) {
        	currentBuild.result = "FAILURE"
                error('Test stage failed!)
        }
      }
    }
    stage('Deploy') {
      steps {
        withCredentials([usernamePassword(credentialsId: "${DOCKER_REGISTRY_CREDS}", passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
          sh "echo \$DOCKER_PASSWORD | docker login -u \$DOCKER_USERNAME --password-stdin docker.io"
	  sh 'docker push hsdarshana/myrepo:newimage'
        }
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}
