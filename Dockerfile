# Use the official maven/Java 8 image to create a build artifact.
FROM maven:3.8.1-openjdk-11-slim AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn package

# Use Tomcat to run the WAR
FROM tomcat:9.0-jdk11-openjdk-slim
COPY --from=build /app/target/MyWebApp.war /usr/local/tomcat/webapps/

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Run the app
CMD ["catalina.sh", "run"]
