package com.mshykoriak.configuration;

import jakarta.servlet.Filter;
import org.springframework.web.filter.DelegatingFilterProxy;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

/**
 * This initializer configures root and servlet contexts.
 * @author Misha Shykoriak
 * @since 1.0
 */
public class WebAppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

    @Override
    protected Class<?>[] getRootConfigClasses() {
        return new Class<?>[] {RootConfig.class, SecurityConfig.class};
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class<?>[]{ServletConfig.class};
    }

    @Override
    protected String[] getServletMappings() {
        return new String[] {"/"};
    }

}
