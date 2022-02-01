FROM anapsix/alpine-java  
COPY . .
CMD ["java","-jar","/home/spring-petclinic-1.5.1.jar"]
