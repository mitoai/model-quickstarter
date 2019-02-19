def image = "eu.gcr.io/ntnu-smartmedia/spotlight"
properties([
  disableConcurrentBuilds(),
  buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '', numToKeepStr: '10'))
])

defaultPodTemplate {
  podTemplate (
    containers: [
      containerTemplate(
        name: 'maven',
        image: 'maven:3-jdk-8',
        ttyEnabled: true,
        command: 'cat',
        resourceRequestMemory: '32G',
        resourceRequestCpu: '6'
      )
    ],
    volumes: [
      persistentVolumeClaim(mountPath: '/root/.m2', claimName: 'spotlight-maven-repo-rw', readOnly: false)
    ]) {
    lastTemplate('spotlight') {

      def scmVars

      stage("Checkout source") {
        scmVars = checkout scm
      }
      stage("Build and push") {
        container('maven') {
          sh './index_db.sh -b no/ignore.list wdir no_NO no/stopwords.list Norwegian docker/no/model'
        }
        dockerBuildAndPush path: './docker/no', image: "${image}-no", tag: scmVars.GIT_COMMIT
        container('maven') {
          sh './index_db.sh -b sv/ignore.list wdir sv_SE sv/stopwords.list Swedish   docker/sv/model'
        }
        dockerBuildAndPush path: './docker/sv', image: "${image}-sv", tag: scmVars.GIT_COMMIT
        container('maven') {
          sh './index_db.sh                   wdir da_DK da/stopwords.list Danish    docker/da/model'
        }
        dockerBuildAndPush path: './docker/da', image: "${image}-da", tag: scmVars.GIT_COMMIT
        container('maven') {
          sh './index_db.sh -b en/ignore.list wdir en_US en/stopwords.list English   docker/en/model'
        }
        dockerBuildAndPush path: './docker/en', image: "${image}-en", tag: scmVars.GIT_COMMIT
        container('maven') {
          sh './index_db.sh -b de/ignore.list wdir de_DE de/stopwords.list German    docker/de/model'
        }
        dockerBuildAndPush path: './docker/de', image: "${image}-de", tag: scmVars.GIT_COMMIT
        container('maven') {
          sh './index_db.sh -b es/ignore.list wdir es_ES es/stopwords.list Spanish   docker/es/model'
        }
        dockerBuildAndPush path: './docker/es', image: "${image}-es", tag: scmVars.GIT_COMMIT
        container('maven') {
          sh './index_db.sh -b fr/ignore.list wdir fr_FR fr/stopwords.list French    docker/fr/model'
        }
        dockerBuildAndPush path: './docker/fr', image: "${image}-fr", tag: scmVars.GIT_COMMIT
      }
    }
  }
}
