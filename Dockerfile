FROM bellsoft/liberica-openjre-alpine-musl:17
WORKDIR /app
EXPOSE 8761
ARG JAR_FILE=eureka-server-docker-1.0.0.jar
ADD target/${JAR_FILE} app.jar
ENTRYPOINT ["java","-XX:+UseZGC","-Xmx1G","--enable-preview",\
    "-jar","/app/app.jar"]
