#FROM centos
FROM pictolearn/ubuntu-jdk8

MAINTAINER Faisal Jarkass

ENV container docker

RUN yum -y update; yum clean all

RUN yum -y install systemd; yum clean all; \
(cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

RUN yum install java -y
RUN yum install maven -y
#RUN yum install tomcat-webapps tomcat-docs-webapp tomcat-admin-webapps -y
RUN yum install tomcat -y
RUN yum install nano -y

#Copy code into here:
COPY . /home

#Set workdir
WORKDIR /home/Docker_SpringbootExample

# Prepare by downloading dependencies
ADD pom.xml /home/Docker_SpringbootExample/pom.xml
RUN ["mvn", "dependency:resolve"]

# Build war here
RUN ["mvn", "clean"]
RUN ["mvn", "package"]

#Copy .war into /var/lib/tomcat/webapps OR /usr/share/tomcat/webapps
RUN mv target/faisaljarkass.war /var/lib/tomcat/webapps
#RUN mv target/*.war /var/lib/tomcat/webapps

ADD /Users/faisaljarkass/Documents/Developer_Tools/Docker/DockerTest/tomcat-users.xml /usr/share/tomcat/conf/

#Start tomcat
#RUN systemctl daemon-reload
#RUN systemctl start tomcat
#RUN systemctl enable tomcat
#RUN systemctl status tomcat

# Gets tomcat version 8
#RUN yum install -y wget
#RUN wget http://apache.mirrors.ionfish.org/tomcat/tomcat-8/v8.5.16/bin/apache-tomcat-8.5.16.tar.gz

VOLUME [ “/sys/fs/cgroup” ]

CMD [“/usr/sbin/init”]

