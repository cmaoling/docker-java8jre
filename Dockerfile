############################################################
# Dockerfile to build firefox container images
# Based on https://wiki.ubuntuusers.de/Java/Installation/Oracle_Java/Java_8/
FROM [user.id]/[parent.repository][parent.tag]

###########################################################
# File Author / Maintainer
MAINTAINER [user.name] "[user.email]"
################## BEGIN INSTALLATION ######################
USER root
RUN /bin/bash -c "apt-get update && apt-get upgrade -y && apt-get clean && apt-get autoremove"
ENV DEBIAN_FRONTEND noninteractive

#download.oracle.com/otn/java/jdk/8u31-b13/jre-8u31-linux-x64.tar.gz
ENV JAVA_VERSION 31
ENV BUILD_VERSION b13
RUN mkdir /opt/Oracle_Java/
ADD jre-8u31-linux-x64.tar.gz /opt/Oracle_Java/
RUN update-alternatives --install "/usr/bin/java" "java" "/opt/Oracle_Java/jre1.8.0_$JAVA_VERSION/bin/java" 1
RUN update-alternatives --install "/usr/bin/javaws" "javaws" "/opt/Oracle_Java/jre1.8.0_$JAVA_VERSION/bin/javaws" 1
RUN update-alternatives --set "java" "/opt/Oracle_Java/jre1.8.0_$JAVA_VERSION/bin/java"
RUN update-alternatives --set "javaws" "/opt/Oracle_Java/jre1.8.0_$JAVA_VERSION/bin/javaws" 
#http://stackoverflow.com/questions/22539779/how-to-tell-if-jre-or-jdk-is-installed

