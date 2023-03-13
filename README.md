# Jenkins CI

Both companies I've worked for have used Jenkins, to varying levels of success.
Saw some patterns I really liked, so wanted to replicate them here.

A large portion of this is to see if I can, and to be able to run Jenkins
locally in a way that could potentially be useful by either running Jenkinsfiles
or just having access to the exact same config that would be in the cloud.

## Running

Works locally with `make run`, although it does expect some environment variables
to be set to startup properly. Some are required, some are optional. Best
practices would be to set these in the Dockerfile, or hard-code them in the CasC
files directly, but this is convenient for testing without hardocding specific
orgs for now.

```bash
## Required
GITHUB_ORG # Required for jobs-dsl to startup properly, is name of the GitHub Organization

## Optional
GITHUB_CRED_ID # Set credentialsId used to pull from GitHub.
```

## References

- https://github.com/jenkinsci/docker/blob/master/README.md
- Docker Hub
  - [jenkins/jenkins](https://hub.docker.com/r/jenkins/jenkins)
- https://plugins.jenkins.io/configuration-as-code/
- https://github.com/jenkinsci/helm-charts/tree/main/charts/jenkins
  - Used the helm chart docs for starter plugins
- https://www.jenkins.io/doc/book/security/access-control/disable/
- https://github.com/jenkinsci/remote-file-plugin

## Minimal Requirements

- [x] Configuration as Code
- [x] Plugins installed in custom controller
  - No installations on bootup
- [x] ~GitHub~ Organization folder
  - Specifically the cool one with custom marker files and allowing
    global Jenkinsfile usage. [Cloudbees Blogpost](https://www.cloudbees.com/blog/ensuring-corporate-standards-pipelines-custom-marker-files)
    - Looks like this cloudbees blogpost is only relevant to their enterprise platform, which is fairly lame. For now we'll be satisfied with just the organization folder with Git
  - Local docs are always up to date: http://localhost:8080/plugin/job-dsl/api-viewer/index.html#path/organizationFolder
- [x] The only thing that can cause downtime is changing the controller image. Everything
      else should either be library changes or worker changes. The point isn't
      to be perfect, but to be minimal and stable.
