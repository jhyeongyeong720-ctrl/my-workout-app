# 1단계: 빌드
FROM gradle:7.6-jdk17 AS build
WORKDIR /app
# 권한 무시하고 다 복사
COPY . .
# gradlew 없다고 징징대니까 여기서 강제로 권한 부여
RUN chmod +x ./gradlew
RUN ./gradlew clean build -x test

# 2단계: 실행
FROM openjdk:17-jdk-slim
WORKDIR /app
# 빌드된 파일만 쏙 가져오기
COPY --from=build /app/build/libs/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]