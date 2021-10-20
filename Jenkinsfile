pipeline {
agent any
stages {
  stage("Build Project") {
      script {
              bat "npm install"
              bat "npm run build"
            }
   }
  stage("deploy"){
     script {
             bat "<Your deploy command>"
          }
    }
}
post {
  always{
     deleteDir()   
  }
}
}
