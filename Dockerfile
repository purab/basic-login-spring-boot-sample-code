FROM adoptopenjdk:8-jre-hotspot

EXPOSE 8080

ADD build/libs/basic-login-0.0.1-SNAPSHOT.jar basic-login-0.0.1-SNAPSHOT.jar

ENTRYPOINT ["java","-jar","basic-login-0.0.1-SNAPSHOT.jar"]