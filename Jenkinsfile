pipeline {
    agent any
    
    stages{
       
       stage('Docker Build and Deploy Snapshot') {
            steps {
                script {
                    def curlCmd = "curl -s https://api.github.com/repos/AdoptOpenJDK/openjdk8-binaries/releases/latest | grep 'tag_name'"
                    def latestVersion= "curl -s https://api.github.com/repos/AdoptOpenJDK/openjdk8-binaries/releases | grep -o -m 1 '^\\OpenJDK8U-jdk_x64_linux_hotspot_.*gz'"
                    echo latestVersion
                    def latest_version_pp = sh(returnStdout: true, script: latestVersion).trim().toString()
                    echo latest_version_pp
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
