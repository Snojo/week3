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
        sh 'npm run docker-compose up || npm run build'
        sh 'npm run startpostgres && sleep 10 && npm run migratedb:dev'
        sh 'npm run startserver:nowatch'
        dir('client')
        {
            sh 'npm run start'
        }
    }
    stage('Test') {
        sh 'npm run test:nowatch'
        sh 'npm run apitest:nowatch'
        sh 'npm run loadtest:nowatch'
    }
    stage('Deploy') {
        sh './dockerbuild.sh'
        dir('./provisioning')
        {
            sh "./provision-new-environment.sh"
        }
    }
}