FROM maven:3.6.3-jdk-8 AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package


# Alpine Linux with OpenJDK JRE
FROM openjdk:8-jre-alpine
COPY --from=build /home/app/target/spring-petclinic-2.6.0-SNAPSHOT.jar /usr/local/lib/spring-petclinic.jar
EXPOSE 8181
 

# run application with this command line 
ENTRYPOINT ["java","-jar","/usr/local/lib/spring-petclinic.jar","--server.port=8181"]
 
