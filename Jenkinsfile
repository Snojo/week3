node {    
    checkout scm
    stage('Clean') {
        // Clean files from last build.
        sh 'git clean -dfxq'
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
        sh '/usr/local/bin/docker-compose up'
    }
    stage('Test') {
        sh 'npm run test:nowatch'
        sh 'npm run apitest:nowatch'
        sh 'npm run loadtest:nowatch'
        sh '/usr/local/bin/docker-compose down'
    }
    stage('Deploy') {
        sh './dockerbuild.sh'
        dir('./provisioning')
        {
            sh "./provision-new-environment.sh"
        }
    }
}