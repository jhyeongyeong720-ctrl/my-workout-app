# 1단계: 빌드 환경 설정
FROM gradle:7.6-jdk17 AS build
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradlew build --no-daemon -x test

# 2단계: 실행 환경 설정
FROM bellsoft/liberica-openjdk-alpine:17
COPY --from=build /home/gradle/src/build/libs/*.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]