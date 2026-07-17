package com.carrentals.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http)
            throws Exception {

        http

            // Disable CSRF for now
            .csrf(csrf -> csrf.disable())

            .authorizeHttpRequests(auth -> auth

                // Public pages
                .requestMatchers(
                    "/",
                    "/home",
                    "/admin-login",
                    "/admin-logout",
                    "/user-login",
                    "/oauth2/**",
                    "/login/**",
                    "/css/**",
                    "/js/**",
                    "/images/**"
                ).permitAll()

                // Allow other pages for now
                .anyRequest().permitAll()
            )

            // Google OAuth Login
            .oauth2Login(oauth -> oauth

            		.defaultSuccessUrl(
            			    "/google-login-success",
            			    true
            			)
            )

            // USER LOGOUT ONLY
            .logout(logout -> logout

                .logoutUrl("/user-logout")

                .logoutSuccessUrl("/")

                .invalidateHttpSession(true)

                .clearAuthentication(true)

                .deleteCookies("JSESSIONID")

                .permitAll()
            );

        return http.build();
    }
}