node {    
    checkout scm
    stage('Clean') {
        // Clean files from last build.
        sh 'git clean -dfxq'
        //sh './killdocker.sh'
    }
    stage('Setup') {
        // Prefer yarn over npm.
        sh 'yarn install || npm install'
        dir('client')
        {
            sh 'yarn install || npm install'
        }
        //sh 'npm run docker-compose up || npm run build'
        sh 'npm run startpostgres && sleep 10 && npm run migratedb:dev'
    }
    
    stage('UnitTest'){
         sh 'npm run test:nowatch'
         dir(client)
         {
             sh 'npm run start && npm run test'
         }
    }
    
    stage('API and Load Test') {
    //    sh './dockerbuild.sh'
    //     dir('./provisioning'){
    //         // sh '/usr/local/bin/docker-compose up -f ./docker-compose.yaml -d --build'
    //         sh './test-docker-compose-and-run.sh'
    //     }
        sh 'npm run startserver & npm run apitest:nowatch && npm run loadtest:nowatch && sleep 5 && kill $!'
        //sh 'npm run apitest:nowatch'
        //sh 'npm run loadtest:nowatch'
        //sh '/usr/local/bin/docker-compose down'
        //step([$class: 'JUnitResultArchiver', testDataPublishers: [[$class: 'AttachmentPublisher']], testResults: './test-reports/*.xml'])
        junit 'test-reports/*.xml'
    }

    stage('Deploy') {
        sh './dockerbuild.sh'
        dir('./provisioning')
        {
            sh "./provision-new-environment.sh"
        }
    }
}