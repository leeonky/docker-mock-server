FROM alpine:3.13

RUN apk update && apk add openjdk8-jre axel && ( test -L /usr/lib/jvm/default-jvm || ln -s /usr/lib/jvm/java-8-openjdk /usr/lib/jvm/default-jvm )
RUN cd /opt && \ 
	axel https://repo1.maven.org/maven2/org/mock-server/mockserver-netty/5.11.1/mockserver-netty-5.11.1-jar-with-dependencies.jar

EXPOSE 1080

ENTRYPOINT ["java", "-Dfile.encoding=UTF-8", "-jar", "/opt/mockserver-netty-5.11.1-jar-with-dependencies.jar", "-serverPort", "1080", "-logLevel", "INFO"]

