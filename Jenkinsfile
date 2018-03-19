def imageLegacy = 'eu.gcr.io/ntnu-smartmedia/mito-universe-legacy'
def image = 'eu.gcr.io/ntnu-smartmedia/mito-universe'

defaultPodTemplate {
    spotlightTemplate {
      node('spotlight') {
        def scmVars

        stage("Checkout source") {
          scmVars = checkout scm
        }
        stage("Build") {
          container("spotlight") {
            sh './prepare.sh'
            sh './index_db.sh -b no/ignore.list wdir no_NO no/stopwords.list Norwegian models/no'
          }
        }
    }
  }
}