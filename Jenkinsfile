pipeline{
    agent any
    stages{
        stage("Git clone"){
            steps{
               git branch: 'master', url: 'https://github.com/tanishkasinghal/spe_Mini_Project.git'
            }
        }
         stage('Maven Build'){
            steps{
                echo 'Job Build'
                sh "mvn clean install"
            }
         }
    }
}