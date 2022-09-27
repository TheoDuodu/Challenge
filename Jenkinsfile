pipeline {
    agent any
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
    stage ("Dependency Check with Python Safety"){
         steps{
            sh "docker run --rm --volume \$(pwd) pyupio/safety:latest safety check"
             sh "docker run --rm --volume \$(pwd) pyupio/safety:latest safety check --json > report.json"
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