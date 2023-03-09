FROM jenkins/jenkins:lts-jdk11

# drop back to the regular jenkins user - good practice
USER jenkins

WORKDIR /var/jenkins_home

COPY --chown=jenkins:jenkins plugins.txt plugins.txt
RUN jenkins-plugin-cli -f /var/jenkins_home/plugins.txt
