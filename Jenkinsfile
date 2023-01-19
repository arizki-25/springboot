node {
    def WORKSPACE = "/var/lib/jenkins/workspace/springboot"
    def dockerImageTag = "springboot{env.BUILD_NUMBER}"

    try{
//          notifyBuild('STARTED')
         stage('Clone Repo') {
            // for display purposes
            // Get some code from a GitHub repository
                git url: 'https://github.com/arizki-25/springboot.git',
                credentialsId: 'springdeploy',
                branch: 'main'
         }
          stage('Build docker') {
                dockerImage = docker.build("springboot:${env.BUILD_NUMBER}")
          }

          stage('Deploy docker'){
                echo "Docker Image Tag Name: ${dockerImageTag}"
                sh "docker stop springboot || true && docker rm springboot || true"
                sh "docker run --name springboot -d -p 8081:8081 springboot:${env.BUILD_NUMBER}"
          }
          stage('Deploy Kubernetes'){
                sh kubectl apply -f springboot.yaml
          }
    }catch(e){
//         currentBuild.result = "FAILED"
        throw e
    }finally{
//         notifyBuild(currentBuild.result)
    }
}