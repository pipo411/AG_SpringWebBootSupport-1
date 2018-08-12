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
               }
           }
           
       } 
      // stage('CodeQuality') {
       //    steps {
        //       echo 'CodeQuality..'
         //   sh './gradlew clean sonarqube'
          // }
       //}       
   }
}
		   
