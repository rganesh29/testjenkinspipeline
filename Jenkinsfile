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
                sh 'mvn clean deploy -Dmaven.test.skip=true'
                 echo "----------- build complted ----------"
            }
        }
        stage("unit-test"){
            steps {
                echo "------------- Unit-test started -------------"
                sh 'mvn surefire-report:report'
                echo "------------- Unit-test completed -------------"
            }
        }
        
        stage('SonarQube analysis') {
        environment {
            def scannerHome = tool 'sonar-scanner';
        }
            steps {
                withSonarQubeEnv('sonar-server') { // If you have configured more than one global server connection, you can specify its name
                    sh "${scannerHome}/bin/sonar-scanner"
                }
            }
        }
    }

