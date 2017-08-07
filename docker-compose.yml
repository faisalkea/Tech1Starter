FROM openjdk

VOLUME /tmp
ADD target/faisaljarkass.jar faisaljarkass.jar
RUN sh -c 'touch /faisaljarkass'

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/faisaljarkass.jar"]