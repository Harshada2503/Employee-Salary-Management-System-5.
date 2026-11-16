
package org.techhub.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class WebAppInitializer
        extends AbstractAnnotationConfigDispatcherServletInitializer {

    // Root application configuration
    @Override
    protected Class<?>[] getRootConfigClasses() {

        return new Class<?>[] {
                DBConfig.class
        };
    }

    // Spring MVC configuration
    @Override
    protected Class<?>[] getServletConfigClasses() {

        return new Class<?>[] {
                WebConfig.class
        };
    }

    // DispatcherServlet URL mapping
    @Override
    protected String[] getServletMappings() {

        return new String[] {
                "/"
        };
    }
}
