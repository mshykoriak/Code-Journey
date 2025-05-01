package com.mshykoriak.configuration;

import org.springframework.security.web.context.AbstractSecurityWebApplicationInitializer;
import org.springframework.web.servlet.support.AbstractDispatcherServletInitializer;

/**
 * There is a reason for overriding {@link WebSecurityAppInitializer#getDispatcherWebApplicationContextSuffix()}.
 * This is needed to let Spring Security be loaded from the DispatcherServlet's ApplicationContext.
 * Without this override, the bean springSecurityFilterChain will not be found.(Solution found here https://github.com/spring-projects/spring-security/issues/12319)
 *
 * Initializes spring security filter chain
 * @author Misha Shykoriak
 */
public class WebSecurityAppInitializer extends AbstractSecurityWebApplicationInitializer {

    @Override
    protected String getDispatcherWebApplicationContextSuffix() {
        return AbstractDispatcherServletInitializer.DEFAULT_SERVLET_NAME;
    }
}
