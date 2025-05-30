# Build stage
FROM maven:3.8.3-openjdk-17 AS build
COPY . /app
WORKDIR /app
RUN mvn clean install -DskipTests

# Package stage
FROM eclipse-temurin:17-jdk
COPY --from=build /app/target/Shopping_Cart-0.0.1-SNAPSHOT.jar demo.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "demo.jar"]
