FROM alpine:3.13

RUN apk add openjdk8-jre && \
	cd /opt && \
	wget https://repo1.maven.org/maven2/org/mock-server/mockserver-netty/5.11.1/mockserver-netty-5.11.1-jar-with-dependencies.jar

EXPOSE 1080

ENTRYPOINT ["java", "-Dfile.encoding=UTF-8", "-jar", "/opt/mockserver-netty-5.11.1-jar-with-dependencies.jar", "-serverPort", "1080", "-logLevel", "INFO"]

