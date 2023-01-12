#FROM openjdk:8-jdk-alpine
FROM openjdk:latest

WORKDIR /app
COPY target/*.jar app.jar
#RUN mvn clean install -DskipTests

ENV PORT 8081
EXPOSE $PORT

ENTRYPOINT ["java","-jar","-Xmx1024M","-Dserver.port=${PORT}","app.jar"]

