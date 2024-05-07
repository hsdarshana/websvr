pipeline {
  agent any

  stages {
    stage('Checkout') {
      steps {
        // checkout code from github repo
	git branch: 'main', url: 'https://github.com/hsdarshana/websvr.git'
      }
    }

    stage('Build Docker Image') {
      steps {
        script {
	   // Build docker image with Apache web server
	   sh 'docker build -t my-apache-webserver .'
        }
      }
    }

    stage('Run Docker Container') {
      steps {
        // Run docker container with exposed port 8888
	script {
	   sh 'docker run -d --name my-apache-webserver -p 80:80 my-apache-webserver'
        }
      }
    }
  }
}
