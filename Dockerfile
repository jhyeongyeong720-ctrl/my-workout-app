# 1단계: 빌드 (경로 에러 방지를 위해 소스 전체 복사)
FROM gradle:7.6-jdk17 AS build
WORKDIR /home/gradle/src
COPY --chown=gradle:gradle . .
# 권한 부여 및 빌드
RUN chmod +x gradlew && ./gradlew clean build -x test --no-daemon

# 2단계: 실행
FROM bellsoft/liberica-openjdk-alpine:17
WORKDIR /app
COPY --from=build /home/gradle/src/build/libs/*.jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]