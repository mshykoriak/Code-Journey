package com.mshykoriak.configuration;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

/**
 * This is a class for Security settings.
 * Admin username and password should be provided as an external environment variables.
 * such as "ADMIN_PASSWORD" and "ADMIN_USERNAME". If you prefer lowercase and dot instead of underscore
 * - Spring will process both name types.
 *
 * @author Misha Shykoriak
 * @since 1.0
 */
@Configuration
@EnableWebMvc
@EnableWebSecurity
public class SecurityConfig {

    @Value("${admin.username}")
    private String adminUsername;
    @Value("${admin.password}")
    private String adminPassword;

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception{
        Logger logger = LoggerFactory.getLogger(getClass());
        logger.info("Initializing springSecurityFilterChain");
        HttpSessionRequestCache requestCache = new HttpSessionRequestCache();
        requestCache.setMatchingRequestParameterName(null); // no need for "continue" url parameter

        http.authorizeHttpRequests((authorize) -> authorize.requestMatchers("/admin/**")
                        .hasRole("ADMIN")
                        .anyRequest().permitAll())
                .httpBasic(Customizer.withDefaults())
                .formLogin(Customizer.withDefaults())
                .requestCache((cache) -> cache.requestCache(requestCache));
        return http.build();
    }

    @Bean
    public UserDetailsService userDetailsService() {
        UserDetails admin = User.withUsername(adminUsername)
                            .password(adminPassword)
                            .roles("ADMIN")
                            .build();
        return new InMemoryUserDetailsManager(admin);
    }


}
