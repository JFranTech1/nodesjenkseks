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
    }
}

