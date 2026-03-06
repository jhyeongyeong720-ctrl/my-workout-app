# 1단계: 빌드 (가장 안정적인 이미지 사용)
FROM gradle:7.6-jdk17-alpine AS build
WORKDIR /home/gradle/src
COPY --chown=gradle:gradle . .

# 권한 부여 및 빌드
RUN chmod +x gradlew
RUN ./gradlew build -x test --no-daemon

# 2단계: 실행 (렌더에서 가장 잘 돌아가는 경량 이미지)
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
# 빌드된 jar 파일 위치 정확히 지정
COPY --from=build /home/gradle/src/build/libs/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]