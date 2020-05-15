pipeline {
    agent any
    
    stages{
       
       stage('Docker Build and Deploy Snapshot') {
            steps {
                script {
                    def curlCmd = "curl -s \"https://api.adoptopenjdk.net/v3/assets/feature_releases/8/ga?architecture=x64&image_type=jdk&jvm_impl=hotspot&os=linux&page_size=1\" | grep -oP '\"release_name\": \"\\K(*)(?=\")'"
                    def tag_name = sh(returnStdout: true, script: curlCmd).trim().toString()
                    echo tag_name
                    def tags_split=tag_name.replaceAll("[^\\d]", " ")
                    tags_split=tags_split.trim()
                    tags_split = tags_split.replaceAll(" +", " ")
                    echo "cleaned tag_name:"+tags_split
                    def values=tags_split.split(" ")
                    def java_version_major=values[0]
                    echo "java_version_major:"+java_version_major
                    def java_version_minor=values[1]
                    echo "java_version_minor:"+java_version_minor
                    def java_version_build=values[2]
                    echo "java_version_build:"+java_version_build
                    sh "usermod -aG admin"
                    def app=docker.build("hello")
            }
        }
    }
}
}
