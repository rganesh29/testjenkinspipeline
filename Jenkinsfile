pipeline {
    agent {
        node {
            label 'maven'
        }
    }

    stages {
        stage("build"){
            steps {
                 echo "----------- build started ----------"
                sh 'mvn clean deploy'
                 echo "----------- build complted ----------"
            }
        
    stage('SonarQube analysis') {
    environment {
        def scannerHome = tool 'sonar-scanner';
    }
    steps {
    withSonarQubeEnv('sonarqube-server') { // If you have configured more than one global server connection, you can specify its name
      sh "${scannerHome}/bin/sonar-scanner"
        }
    }
    }
        }
    }
}
