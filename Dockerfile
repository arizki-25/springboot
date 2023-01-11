# Docker Build Stage
#FROM maven:3-jdk-8-alpine AS build


# Build Stage
#WORKDIR /app
#
#COPY ./ /app
#RUN mvn clean install -DskipTests
#
#
## Docker Build Stage
#FROM openjdk:8-jdk-alpine
#
#WORKDIR /app
#COPY ./ /app
#RUN mvn clean install -DskipTests
#
#COPY --from=build /app/target/*.class app.jar
#
#ENV PORT 8081
#EXPOSE $PORT
#
#ENTRYPOINT ["java","-jar","-Xmx1024M","-Dserver.port=${PORT}","app.class"]



# Docker Build Stage
#FROM openjdk:8-jdk-alpine
FROM openjdk:latest

WORKDIR /app
COPY target/*.jar app.jar
#RUN mvn clean install -DskipTests

ENV PORT 8081
EXPOSE $PORT

ENTRYPOINT ["java","-jar","-Xmx1024M","-Dserver.port=${PORT}","app.jar"]

