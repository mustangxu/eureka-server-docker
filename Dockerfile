FROM maven:3.9.8-eclipse-temurin-22-alpine AS build
WORKDIR /app
COPY src src
COPY pom.xml pom.xml
RUN mvn -DskipTests clean package

FROM bellsoft/liberica-runtime-container:jre-24-slim-musl
WORKDIR /app
EXPOSE 8761
ARG JAR_FILE=eureka-server-docker-1.0.0.jar
COPY --from=build /app/target/${JAR_FILE} app.jar
ENTRYPOINT ["java","-XX:+UseZGC","-Xmx1G","--enable-preview",\
    "-jar","/app/app.jar"]
