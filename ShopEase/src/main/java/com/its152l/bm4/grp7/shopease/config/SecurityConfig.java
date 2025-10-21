package com.its152l.bm4.grp7.shopease.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .authorizeHttpRequests(auth -> auth
                        // 👇 public pages (no login required)
                        .requestMatchers("/", "/home", "/shop/**", "/css/**", "/js/**", "/images/**").permitAll()

                        // 👇 protected pages (login required)
                        .requestMatchers("/admin/**").authenticated()

                        // any other request defaults to authenticated
                        .anyRequest().permitAll()
                )
                .formLogin(form -> form
                        .loginPage("/login")   // your custom login page
                        .defaultSuccessUrl("/admin/dashboard", true)
                        .permitAll()
                )
                .logout(logout -> logout
                        .logoutUrl("/logout")
                        .logoutSuccessUrl("/")
                        .permitAll()
                )
                .csrf(csrf -> csrf.disable()); // disable for dev only

        return http.build();
    }
}
