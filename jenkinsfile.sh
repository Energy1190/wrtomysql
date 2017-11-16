#!/usr/bin/env groovy
pipeline {
    agent any
    environment {
        COMMIT_ARRAY = sh 'git rev-list ${GIT_PREVIOUS_SUCCESSFUL_COMMIT}^..HEAD'
    }
    stages {
        stage('Test message') {
            steps {
                script {
                    FILENAME = sh(returnStdout: true, script:'git rev-list ${GIT_PREVIOUS_SUCCESSFUL_COMMIT}^..HEAD')
                    loop_with_preceding_sh(FILENAME)
                }
            }
        }
    }
}

@NonCPS
def loop_with_preceding_sh(list) {
    array = list.split()
    array.each { item ->
        echo "Hello ${item}"
    }
}
