
package org.techhub.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import org.techhub.interceptor.AdminAuthInterceptor;

@Configuration
@EnableWebMvc
@ComponentScan("org.techhub")
public class WebConfig implements WebMvcConfigurer {

    // Configure JSP View Resolver
    @Bean
    public InternalResourceViewResolver viewResolver() {

        InternalResourceViewResolver resolver =
                new InternalResourceViewResolver();

        resolver.setPrefix("/WEB-INF/views/");
        resolver.setSuffix(".jsp");

        return resolver;
    }

    // Configure CSS, JavaScript and image resources
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {

        registry.addResourceHandler("/resources/**")
                .addResourceLocations("/resources/");
    }

    // Configure Admin Authentication Interceptor
    @Override
    public void addInterceptors(InterceptorRegistry registry) {

        registry.addInterceptor(new AdminAuthInterceptor())
                .addPathPatterns("/**")
                .excludePathPatterns(
                        "/admin/login",
                        "/admin/setup",
                        "/resources/**",
                        "/css/**",
                        "/js/**",
                        "/images/**"
                );
    }
}
