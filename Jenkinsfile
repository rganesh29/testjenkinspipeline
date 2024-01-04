def registry = 'https://ganeshr.jfrog.io/'
def imageName = 'ganeshr.jfrog.io/demo-docker-local/ttrend'
def version   = '2.1.3' 

pipeline {
    agent {
        node {
            label 'maven'
        }
    }

    stages {
        stage("Maven-build"){
            steps {
                 echo "----------- Maven build started ----------"
                sh 'mvn clean deploy -Dmaven.test.skip=true'
                 echo "----------- Maven build complted ----------"
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
                echo "------------- SonarQube analysis Started -------------"
                withSonarQubeEnv('sonar-server') { // If you have configured more than one global server connection, you can specify its name
                    sh "${scannerHome}/bin/sonar-scanner"
                    echo "------------- SonarQube analysis completed -------------"
                }
            }
        }
        
        stage("Quality Gate"){ 
            steps {
                script {
                    echo "------------- Quality Gate Started -------------"
                    timeout(time: 1, unit: 'HOURS') { // Just in case something goes wrong, pipeline will be killed after a timeout
                    def qg = waitForQualityGate() // Reuse taskId previously collected by withSonarQubeEnv
                    if (qg.status != 'OK') {
                        error "Pipeline aborted due to quality gate failure: ${qg.status}"
                    }
                    }
                    echo "------------- Quality Gate completed -------------"
                }
            }
        }

        /*stage("Jar Publish") { //Added
        steps {
            script {
                    echo '<--------------- Jar Publish Started --------------->'
                     def server = Artifactory.newServer url:registry+"/artifactory" ,  credentialsId:"artifactory-cred"
                     def properties = "buildid=${env.BUILD_ID},commitid=${GIT_COMMIT}";
                     def uploadSpec = """{
                          "files": [
                            {
                              "pattern": "jarstaging/(*)",
                              "target": "demo-libs-release-local/{1}",
                              "flat": "false",
                              "props" : "${properties}",
                              "exclusions": [ "*.sha1", "*.md5"]
                            }
                         ]
                     }"""
                     def buildInfo = server.upload(uploadSpec)
                     buildInfo.env.collect()
                     server.publishBuildInfo(buildInfo)
                     echo '<--------------- Jar Publish Ended --------------->'  
            
            }
        }   
    }

        stage(" Docker Build ") { 
        steps {
            script {
                echo '<--------------- Docker Build Started --------------->'
                sh 'sudo chmod 777 /var/run/docker.sock'
                app = docker.build(imageName+":"+version)
                echo '<--------------- Docker Build Ends --------------->'
                }
        }
        }

        stage (" Docker Publish "){ 
        steps {
            script {
                echo '<--------------- Docker Publish Started --------------->'  
                docker.withRegistry(registry, 'artifactory-cred'){
                    app.push()
                }    
                echo '<--------------- Docker Publish Ended --------------->'  
            }
        }
        }

        stage("Deploy"){ 
            steps {
                script{
                    sh 'chmod 775 deploy.sh'
                    sh 'aws eks update-kubeconfig --region us-east-1 --name mtech-eks-01'
                    sh './deploy.sh'
                    sh 'kubectl apply -f namespace.yaml'
                    sh 'kubectl apply -f secret.yaml'
                    sh 'kubectl apply -f deployment.yaml'
                    sh 'kubectl apply -f service.yaml'
                }
            }
        }

        stage("Helm Deploy"){
            steps {
                script{
                    echo '<--------------- Helm Deploy Started --------------->'
                    sh 'helm install mtech-v1 mtech-v1.0-0.1.0.tgz'
                    echo '<--------------- Helm deploy Ends --------------->'
                }
            }
        }*/
        
    }
}
