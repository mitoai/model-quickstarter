defaultPodTemplate {
  python35Template {
    lastTemplate('deep') {
      def scmVars
      
      stage("Checkout source") {
        scmVars = checkout scm
      }
  
      stage("Build Norwegian model") {
        sh 'docker build --tag eu.gcr.io/ntnu-smartmedia/spotlight-base-model-no -f docker/base-model/Dockerfile .'
      }
      
      stage("Build") {
        dockerBuildAndPush image: deepImage, tag: scmVars.GIT_COMMIT, path: '.'
      }
    }
  }
}

