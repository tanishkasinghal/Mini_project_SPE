FROM openjdk:11
COPY ./target/Mini_project_SPE-1.0-SNAPSHOT-shaded.jar ./
WORKDIR ./
CMD ["java", "-jar", "Mini_project_SPE-1.0-SNAPSHOT-shaded.jar"]