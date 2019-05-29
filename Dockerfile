FROM ubuntu:bionic
MAINTAINER coolyu <coolyu@gmail.com>

RUN  apt update && \
     apt upgrade -y && \
     apt install -y tar wget git apt-utils unzip && \
     apt install -y openjdk-8-jdk && \
     apt -y install build-essential python-dev python-six python-virtualenv libcurl4-nss-dev libsasl2-dev libsasl2-modules maven libapr1-dev libsvn-dev zlib1g-dev iputils-ping && \
     export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64 && \
     export CLASSPATH=.:$JAVA_HOME/lib:$CLASSPATH && \
     export PATH=$JAVA_HOME/bin:$PATH 
 
