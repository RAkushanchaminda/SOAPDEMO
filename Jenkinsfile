pipeline {
    agent any
    environment {
        CI = 'true'
        API = './SOAPDemo'
    }
    stages{
        stage('Setup APIM Environments'){
            steps{
                withCredentials([usernamePassword(credentialsId: 'apim' , usernameVariable: 'USERNAME' , passwordVariable: 'PASSWORD')]) {
                    sh './config.sh'
                }
            }
        }
        stage('Deploy to Production'){
            environment{
                ENV= 'prod'
                RETRY= '80'
            }
            steps{
                echo 'Deployting to Production'
                sh 'apictl import api -f $API -e $ENV -k --preserve-provider=false --update --verbose'
            }
        }
    }
}
