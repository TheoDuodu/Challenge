pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID    = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_KEY = credentials('AWS_SECRET_KEY')
    }
    tools {
       terraform 'terraform'
    }
    stages {
        stage('Git checkout') {
           steps{
                git branch: 'main', url: 'https://github.com/TheoDuodu/Challenge.git'
            }
        }
        
    stage ("Python Bandit Security Scan"){
         steps{
            sh "docker run --rm --volume \$(pwd) secfigo/bandit:latest"
            }
        }
    

        stage('terraform format check') {
            steps{
                sh 'terraform fmt'
            }
        }
        stage('terraform Init') {
            steps{
                sh 'terraform init'
            }
        }
        stage('terraform plan') {
            steps{
                sh 'terraform plan'
            }
        }
        stage('terraform apply') {
            steps{
                sh 'terraform apply'
            }
        }
    }

    
}