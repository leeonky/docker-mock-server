FROM alpine:3.13

RUN apk add openjdk8-jre

RUN cd /opt && \
	wget https://repo1.maven.org/maven2/org/mock-server/mockserver-netty/5.11.1/mockserver-netty-5.11.1-jar-with-dependencies.jar

EXPOSE 1080

USER nonroot

ENTRYPOINT ["java", "-Dfile.encoding=UTF-8", "-cp", "/opt/*.jar:/libs/*", "-Dmockserver.propertyFile=/config/mockserver.properties", "org.mockserver.cli.Main"]

CMD ["-serverPort", "1080"]
