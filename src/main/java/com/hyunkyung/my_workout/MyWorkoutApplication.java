package com.hyunkyung.my_workout;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EntityScan(basePackages = "com.hyunkyung.my_workout") // ✅ 엔티티를 찾으라고 강제로 지정!
@EnableJpaRepositories(basePackages = "com.hyunkyung.my_workout") // ✅ 레포지토리도 찾으라고 지정!
public class MyWorkoutApplication {

    public static void main(String[] args) {
        SpringApplication.run(MyWorkoutApplication.class, args);
    }

}