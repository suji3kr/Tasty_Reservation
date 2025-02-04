package com.company.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // ✅ C:/uploads/ 경로를 /uploads/ URL과 매핑
        registry.addResourceHandler("/uploads/**")
                .addResourceLocations("file:C:/uploads/") // 경로 지정 시 file:을 붙여야 함
                .setCachePeriod(0); // 캐시 비활성화
    }
}
