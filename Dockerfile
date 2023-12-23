#FROM amazoncorretto:17 as builder
#ARG JAR_FILE=target/*.jar
#COPY ${JAR_FILE} application.jar
#RUN java -Djarmode=layertools -jar application.jar extract
#
#FROM amazoncorretto:17
#COPY --from=builder dependencies/ ./
#COPY --from=builder snapshot-dependencies/ ./
#COPY --from=builder spring-boot-loader/ ./
#COPY --from=builder application/ ./
#
#ENV API_SECRET_KEY=place_holder
#
#ENTRYPOINT ["java", "org.springframework.boot.loader.JarLauncher"]

#----------------------------------------------
#FROM openjdk:17
#EXPOSE 8080
#ADD target/spring-boot-api.jar spring-boot-api
#ENTRYPOINT ["java", "-jar", "/spring-boot-api.jar"]
#----------------------------------------------
FROM openjdk:17-jdk-alpine
ARG JAR_FILE=target/*.jar
COPY ./target/spring-boot-api.jar app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]
