package com.mshykoriak.configuration;

import jakarta.servlet.Filter;
import org.springframework.web.filter.DelegatingFilterProxy;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

/**
 * This initializer configures root and servlet contexts.
 * As mentioned in official Spring documentation, Security config should be placed inside servlet context.
 * The reason for this is that Spring Security needs to be able to inspect some Spring MVC configuration in order
 * to appropriately configure underlying request matchers, so they need to be in the same application context.
 * Placing Spring Security in getRootConfigClasses places it into a parent application context that may not be able to find Spring MVC’s HandlerMappingIntrospector.
 * Spring Documentation (https://docs.spring.io/spring-security/reference/servlet/configuration/java.html)
 * @author Misha Shykoriak
 * @since 1.0
 */
public class WebAppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

    @Override
    protected Class<?>[] getRootConfigClasses() {
        return new Class<?>[] {RootConfig.class};
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class<?>[]{SecurityConfig.class, ServletConfig.class};
    }

    @Override
    protected String[] getServletMappings() {
        return new String[] {"/"};
    }

}
