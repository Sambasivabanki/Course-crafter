package com.example.demo6.practise.webConfig;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration // This tells Spring Boot to load this class for web config
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // Serve all files under /webapp/images/** via /images/** URL
        registry.addResourceHandler("/images/**")
                .addResourceLocations("/images/");
    }
}
