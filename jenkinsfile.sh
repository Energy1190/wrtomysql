#!/usr/bin/env groovy
pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'printenv && \
                echo "${GIT_PREVIOUS_SUCCESSFUL_COMMIT}" && \
                echo "${GIT_COMMIT}"'
            }
        }
    }
}
