# Jenkins CI

Both companies I've worked for have used Jenkins, to varying levels of success.
Saw some patterns I really liked, so wanted to replicate them here.

- [ ] Configuration as Code
- [ ] Plugins installed in custom controller
  - No installations on bootup
- [ ] GitHub Organization folder
  - Specifically the cool one with custom marker files and allowing
    global Jenkinsfile usage. [Cloudbees Blogpost](https://www.cloudbees.com/blog/ensuring-corporate-standards-pipelines-custom-marker-files)
- [ ] The only thing that can cause downtime is changing the controller image. Everything
      else should either be library changes or worker changes. The point isn't
      to be perfect, but to be minimal and stable.

## References

- https://github.com/jenkinsci/docker/blob/master/README.md
- Docker Hub
  - [jenkins/jenkins](https://hub.docker.com/r/jenkins/jenkins)
- https://plugins.jenkins.io/configuration-as-code/
- https://github.com/jenkinsci/helm-charts/tree/main/charts/jenkins
	- Used the helm chart docs for starter plugins