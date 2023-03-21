pipeline{
environment{
        DOCKERHUB_CREDENTIALS = credentials('Dockercred')
	}
    agent any
    stages{
        stage("Git clone"){
            steps{
               git branch: 'master', url: 'https://github.com/tanishkasinghal/Mini_project_SPE.git'
            }
        }
         stage('Maven Build'){
            steps{
                echo 'Job Build'
                sh "mvn clean install"
            }
         }
         stage("Building our Image"){
                     steps{
                         script{
                             echo "Building dockerimage"
                             sh 'docker build -t tanishka23/calculator .'
                         }
                     }
                 }
         stage('Login into DockerHub') {
                       steps {
                         sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                     }
                 }
                 stage('Push to DockerHub') {
                       steps {
                         sh 'docker push tanishka23/calculator'
                     }
                 }
                 stage('Delete Docker Image from Local'){
                         steps {
                             sh 'docker rmi tanishka23/calculator'
                     }
                 }
                 stage("Ansible Deploy"){
                     steps{
                             sh "ansible-playbook -i inventory plybk.yml"
                     }
                 }
    }
}