package com.its152l.bm4.grp7.shopease.config;

import com.its152l.bm4.grp7.shopease.security.CustomUserDetailsService;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@RequiredArgsConstructor
public class SecurityConfig {

    private final CustomUserDetailsService customUserDetailsService;

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
            .authorizeHttpRequests(auth -> auth
                // ✅ Public pages (no login required)
                    .requestMatchers(
                            "/",
                            "/home",
                            "/products/store",  // Public product page
                            "/css/**",
                            "/js/**",
                            "/images/**",
                            "/login",           // Add login to permitted
                            "/register"
                ).permitAll()

                // ✅ Admin-only section
                .requestMatchers("/products").hasRole("ADMIN")

                // ✅ Everything else requires authentication
                .anyRequest().authenticated()
            )

            
            // ✅ Custom login page
            .formLogin(form -> form
                .loginPage("/login")
                .permitAll()
                .defaultSuccessUrl("/", false)
                .failureUrl("/")
            )
            // ✅ Logout handling
            .logout(logout -> logout
                .logoutUrl("/logout")
                .logoutSuccessUrl("/login?logout")
                .permitAll()
            )

            // Inline access denied handler
            .exceptionHandling(ex -> ex
                .accessDeniedHandler((request, response, accessDeniedException) -> {
                    // Redirect to homepage if user is not admin
                    response.sendRedirect("/");
                })
            )

            // ✅ Allow H2 console or disable CSRF for simplicity (optional)
            .csrf(csrf -> csrf.disable());

            

        return http.build();
    }

    

    @Bean
    public PasswordEncoder passwordEncoder() {
        // Plain text password for now — use BCrypt in production
        return NoOpPasswordEncoder.getInstance();
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration authConfig) throws Exception {
        return authConfig.getAuthenticationManager();
    }
}
