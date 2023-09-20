pipeline {
    agent any

 environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub')
	}


    stages {
        stage('fetch code') {
            steps {
                git branch: 'main', url: 'https://github.com/TESLAOPUnix/dooze-redesign.git'
            }
        }
        stage('docker login') {
            steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
        }
        stage('build image') {
            steps {
                script {
                    def tag = env.BUILD_NUMBER
                    sh "docker build -t teslaopunix/dooze:$tag ."
                    sh "docker push teslaopunix/dooze:$tag"
                   
                }
            }
        }
    }
    post {
		always {
			sh 'docker logout'
		}
	}
}


