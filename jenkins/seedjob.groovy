// seedjob.groovy

// create an array with our two pipelines
pipelines = ["Freezer"]

// iterate through the array and call the create_pipeline method
pipelines.each { pipeline ->
    println "Creating pipeline ${pipeline}"
    create_pipeline(pipeline)
}

// a method that creates a basic pipeline with the given parameter name
def create_pipeline(String name) {
    pipelineJob(name) {
	  definition {
    cpsScm {
      scm {
        git {
          remote {
            url('https://github.com/bkoj-arch/python_cgi.git')
          }
          branch('*/main')
        }
      }
      lightweight()
    }
  }
}

    }

