pipeline {
    agent any
    stages{
        stage("Checkout code"){
            steps{
                checkout scm
            }
        }
        stage("Hello world stage"){
            steps{
                sh 'echo Hello World'
            }
        }
        stage("Build Image"){
            steps{
                sh 'docker build -t cheffappwebauth:0.0.1 .'
            }
        }
        stage("Push to dockerhub"){
            steps{
                withCredentials([usernamePassword(credentialsId: 'dockerhub_cred', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
                    sh 'docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD'
                    sh 'docker tag cheffappwebauth:0.0.1 jespstpierre/cheffappwebauth:0.0.1'
                    sh 'docker push jespstpierre/cheffappwebauth:0.0.1'
                    sh 'docker logout'
                }
            }
        }
    }
}

