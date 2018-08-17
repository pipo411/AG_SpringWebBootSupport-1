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
               success{
                   junit 'build/test-results/test/*.xml'
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
                        reportDir: 'build/reports/jacoco/',
                        reportFiles: 'index.html',
                        reportTitles: "Coverage",
                        reportName: "JacocoReports"
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
                        ]) 
               } 
           }
           
       } 
       stage('CodeQuality') {
           steps {
            echo 'CodeQuality..'
            sh './gradlew  sonarqube'
           }
       }  
       stage('Package') {
           steps {
            echo 'PackageJar..'
            sh './gradlew build capsule'
           }
           post{
               success{
                   archiveArtifacts artifacts: 'build/libs/*.jar', fingerprint: true
               }
           }
       } 
       stage('Deploy'){
           steps{
               echo 'Deploy..'
                sh'./gradlew -b deploy.gradle deploy -Pdev_server=10.28.135.36 -Puser_server=ubuntu -Puser_home=/home/llavedocker.pem'
           }
       }
       stage('Acceptance'){
           steps{
               echo 'Acceptance..'
                sh'./acceptance/gradlew clean test cucumber -p acceptance'
           }
           post{
               success{
                   publishHTML (target: [
                        allowMissing: true,
                        alwaysLinkToLastBuild: false,
                        keepAll: true,
                        reportDir: 'acceptance/build/reports/cucumber-reports/',
                        reportFiles: 'overview-features.html',
                        reportTitles: "Cucumber Features",
                        reportName: "Cucumber Features"
                        ]) 
                    publishHTML (target: [
                        allowMissing: true,
                        alwaysLinkToLastBuild: false,
                        keepAll: true,
                        reportDir: 'acceptance/build/reports/cucumber-reports/',
                        reportFiles: 'overview-steps.html',
                        reportTitles: "Cucumber Steps",
                        reportName: "Cucumber Steps"
                        ])
               }
           }
       }
   }
}
		   
