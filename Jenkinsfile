node ('master')
 {
  
  def mavenHome = tool name: "maven3.8.2"
  
      echo "GitHub BranhName ${env.BRANCH_NAME}"
      echo "Jenkins Job Number ${env.BUILD_NUMBER}"
      echo "Jenkins Node Name ${env.NODE_NAME}"
  
      echo "Jenkins Home ${env.JENKINS_HOME}"
      echo "Jenkins URL ${env.JENKINS_URL}"
      echo "JOB Name ${env.JOB_NAME}"
  
   //properties([[$class: 'JiraProjectProperty'], buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '2', daysToKeepStr: '', numToKeepStr: '2')), pipelineTriggers([pollSCM('* * * * *')])])
  stage('CheckOutCode')
 {
 git branch: 'development', credentialsId: '4bbf0043-9a17-483f-ab82-03d6ebadf0f9', url: 'https://github.com/revathibasani/maven-web-application.git'
 }
 
 stage('Build')
 {
  sh "${mavenHome}/bin/mvn clean package"
 }
 
 stage('SonarQubeReport')
 {
 sh "${mavenHome}/bin/mvn clean sonar:sonar"
 }
 /*
 stage('UploadArtifactIntoNexus')
 {
 sh "${mavenHome}/bin/mvn clean deploy"
 }
 
 stage('DeployAppIntoTomcatServer')
 {
 sshagent(['8f2ffc51-11c7-40dd-8896-858bcb36b913']) {
  sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@3.6.41.207:/opt/apache-tomcat-9.0.52/webapps/"
}
 }
 */
 stage('SendEmailNotification')
 {
     emailext body: '''Build  is Over!!

Regards,
revathi.''', subject: 'Build over..', to: 'basanirevathi8@gmail.com'
     
}
 }
  
