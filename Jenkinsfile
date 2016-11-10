node {//运行节点
    stage('SCM') {//运行阶段
    //从github上拉取代码
        git 'https://github.com/DevOpsTeam2016/RiskManageProject.git'
    }
    stage('QA') {
    //执行SonarQube分析
        sh 'sonar-scanner'
    }
    stage('build') {
    //用Maven来打包
        def mvnHome = tool 'M3'//之前配置的Maven工具
        sh "${mvnHome}/bin/mvn -B clean package"//maven的清理和打包
    }
    stage('deploy') {
    //用Docker部署，其中的‘my’可以自定义
         sh "docker stop con || true"//停止之前运行的容器
         sh "docker rm con || true"//删除之前运行的容器	
         sh "docker run -d -it --name con -p 11114:8080 -d peterreisz/ssh-java8-tomcat8-mysql55"//启动容器，命名为‘my’，将宿主机的11111端口映射到容器的8080端口（11111可以修改，8080不能修改）
         sh "docker cp target/RiskManageProject-1.0-SNAPSHOT.war con:/opt/tomcat/webapps"//将生成的war包复制到容器的tomcat/webapp目录下
    }
    stage('results') {
    //生成制品
        archiveArtifacts artifacts: '**/target/*.war', fingerprint: true
    }
}
