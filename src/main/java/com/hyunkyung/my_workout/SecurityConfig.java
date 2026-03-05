package com.hyunkyung.my_workout;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                .csrf(csrf -> csrf.disable()) // 보안 잠시 해제
                .authorizeHttpRequests(auth -> auth.anyRequest().authenticated()) // 로그인 필수
                .formLogin(form -> form.defaultSuccessUrl("/", true)); // 로그인 성공 시 메인으로
        return http.build();
    }
}