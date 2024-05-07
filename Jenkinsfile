pipeline {
  agent any

  stages {
    stage('Checkout') {
      steps {
        // checkout code from github repo
	git 'https://github.com/hsdarshana/websvr.git'
      }
    }

    stage('Build Docker Image') {
      steps {
        script {
	   // Build docker image with Apache web server
	   docker.build('my-apache-webserver', '-f Dockerfile .')
        }
      }
    }

    stage('Run Docker Container') {
      steps {
        // Run docker container with exposed port 8888
	script {
	   docker.image('my-apache-webserver').run('-p 8888:80')
        }
      }
    }
}
