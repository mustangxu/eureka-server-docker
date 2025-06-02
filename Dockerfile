FROM maven:3.9-eclipse-temurin-23 AS build
WORKDIR /app
COPY src src
COPY pom.xml pom.xml
RUN mvn -DskipTests clean package

FROM eclipse-temurin:23-jre-ubi9-minimal
WORKDIR /app
EXPOSE 8761
ARG JAR_FILE=eureka-server-docker-1.0.0.jar
COPY --from=build /app/target/${JAR_FILE} app.jar
ENTRYPOINT ["java","-XX:+UseZGC","-Xmx1G","--enable-preview",\
    "-jar","/app/app.jar"]
