FROM ubuntu:bionic
MAINTAINER coolyu <coolyu@gmail.com>

RUN  apt update && \
     apt upgrade -y && \
     apt install -y tar wget git apt-utils unzip && \
     apt install -y openjdk-8-jdk && \
     apt -y install build-essential automake autoconf  python-dev python-six python-virtualenv libcurl4-nss-dev libsasl2-dev libsasl2-modules maven libapr1-dev libsvn-dev zlib1g-dev iputils-ping && \
     export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64 && \
     export CLASSPATH=.:$JAVA_HOME/lib:$CLASSPATH && \
     export PATH=$JAVA_HOME/bin:$PATH 
 
RUN /usr/bin/printf '\xfe\xed\xfe\xed\x00\x00\x00\x02\x00\x00\x00\x00\xe2\x68\x6e\x45\xfb\x43\xdf\xa4\xd9\x92\xdd\x41\xce\xb6\xb2\x1c\x63\x30\xd7\x92' > /etc/ssl/certs/java/cacerts && \
   /var/lib/dpkg/info/ca-certificates-java.postinst configure

 RUN wget http://www.apache.org/dist/mesos/1.7.2/mesos-1.7.2.tar.gz && \
     tar -xzvf mesos-1.7.2.tar.gz && \
     cd mesos-1.7.2 && \
     mkdir build && \
     cd build && \
     ../configure && \
     make # && \
     #make install
