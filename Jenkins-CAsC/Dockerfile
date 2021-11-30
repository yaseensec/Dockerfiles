FROM jenkins/jenkins:latest

#Disable Setup Wizard
#ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

#Setting log.properties
#ENV JAVA_OPTS -Djava.util.logging.config.file=/var/jenkins_home/log.properties

#Setting CASC_JENKINS_CONFIG Env Variable
#ENV CASC_JENKINS_CONFIG /var/jenkins_home/jcasc.yaml

#Copying plugins.txt
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

#Installing plugins using install-plugin.sh
#RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

#Install Plugins using jenkins-plugin-cli
RUN jenkins-plugin-cli --verbose -f /usr/share/jenkins/ref/plugins.txt

#Copying jcasc.yml 
#COPY jcasc.yaml /var/jenkins_home/jcasc.yaml

