Create a pipeline Jenkins and run with this code:
```
pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                script {
                    git branch: 'main', url: 'https://github.com/mrdekan/rpm-deb-file-counter.git'
                    sh 'rsync -av --exclude=".git" ./ /home/dekan/'
                }
            }
        }
        stage('Build RPM') {
            steps {
                script {
                    dir('rpmbuild'){
                        sh 'rpmbuild -ba SPECS/count_files.spec'
                    }
                }
            }
        }
        stage('Build DEB') {
            steps {
                script {
                    sh 'dpkg-deb --build ~/debbuild'
                }
            }
        }
        stage('Install RPM/DEB') {
            steps {
                script {
                    sh 'dpkg-deb -x debbuild.deb /home/dekan/.jenkins/workspace/file_counter || true'
                }
            }
        }
        stage('Execute Script') {
            steps {
                script {
                    sh 'chmod +x /home/dekan/.jenkins/workspace/file_counter/count_files.sh'
                    sh '/home/dekan/.jenkins/workspace/file_counter/count_files.sh'
                }
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
```
