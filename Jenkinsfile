pipeline {
   agent any
   stages {

       stage('Build') {
           steps {
               echo 'Building..'
            sh './gradlew clean assemble'
           }
       }

       stage('Test') {
           steps {
               echo 'Testing..'
            sh './gradlew test jacocoTestReport check'
           }
           post{
            publishHTML (target: [
             allowMissing: true,
             alwaysLinkToLastBuild: false,
             keepAll: true,
             reportDir: 'build/reports/tests/test',
             reportFiles: 'index.html',
             reportTitles: "Test Report",
             reportName: "UnitTest Summary"
	       ])
           publishHTML (target: [
             allowMissing: true,
             alwaysLinkToLastBuild: false,
             keepAll: true,
             reportDir: 'build/reports/findbugs',
             reportFiles: 'main.html',
             reportTitles: "Bugs Report Main",
             reportName: "FindBugs Main"
	       ])
           publishHTML (target: [
             allowMissing: true,
             alwaysLinkToLastBuild: false,
             keepAll: true,
             reportDir: 'build/reports/findbugs',
             reportFiles: 'test.html',
             reportTitles: "Bugs Report Test",
             reportName: "FindBugs Test"
	       ])
           publishHTML (target: [
             allowMissing: true,
             alwaysLinkToLastBuild: false,
             keepAll: true,
             reportDir: 'build/reports/pmd',
             reportFiles: 'main.html',
             reportTitles: "PMD Report Main",
             reportName: "PMD Main"
	       ])
           publishHTML (target: [
             allowMissing: true,
             alwaysLinkToLastBuild: false,
             keepAll: true,
             reportDir: 'build/reports/pmd',
             reportFiles: 'test.html',
             reportTitles: "PMD Report Test",
             reportName: "PMD Test"  
           }
       } 
       stage('CodeQuality') {
           steps {
               echo 'CodeQuality..'
            sh './gradlew clean sonarqube'
           }
           
       }       
   }
}
		   
