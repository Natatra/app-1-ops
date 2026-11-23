pipeline {
    agent any
    parameters {
        booleanParam(name: 'DEPLOY', defaultValue: true, description: 'Czy uruchomić etap wdrożenia?')
    }
    stages {
        stage('Checkout TimeRiddle') {
            steps {
                echo 'Pobieranie repozytorium TimeRiddle...'
                git branch: 'main', url: 'https://github.com/PeterPorzuczek/TimeRiddle.git'
            }
        }
        stage('Build') {
            steps {
                echo 'Budowanie aplikacji...'
            }
        }
        stage('Test') {
            steps {
                echo 'Testowanie aplikacji...'
            }
        }
        stage('Deploy') {
            when {
                expression { params.DEPLOY }
            }
            steps {
                echo 'Wdrażanie aplikacji...'
            }
        }
    }
}
