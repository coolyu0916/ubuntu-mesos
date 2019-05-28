FROM ubuntu:bionic
MAINTAINER coolyu <coolyu@gmail.com>

RUN  apt update && \
     apt upgrade -y && \
     apt install openjdk-8-jdk -y && \
     export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/ && \
     apt -y install build-essential python-dev libcurl4-nss-dev libsasl2-dev libsasl2-modules maven libapr1-dev libsvn-dev zlib1g-dev  wget && \
     apt -y install unzip
 
 RUN /usr/bin/printf '\xfe\xed\xfe\xed\x00\x00\x00\x02\x00\x00\x00\x00\xe2\x68\x6e\x45\xfb\x43\xdf\xa4\xd9\x92\xdd\x41\xce\xb6\xb2\x1c\x63\x30\xd7\x92' > /etc/ssl/certs/java/cacerts && \
     /var/lib/dpkg/info/ca-certificates-java.postinst configure
   
 RUN wget http://www.apache.org/dist/mesos/1.7.2/mesos-1.7.2.tar.gz && \
     tar -xzvf mesos-1.7.2.tar.gz && \
     cd mesos-1.7.2 && \
     mkdir build && \
     cd build && \
     ../configure && \
     make -j 2 V=0 && \
     make install && \
     ldconfig
     
     
ENTRYPOINT ["bash"]
