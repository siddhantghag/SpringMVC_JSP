package com.yash.omsapp.config;

import org.springframework.security.web.context.AbstractSecurityWebApplicationInitializer;

/**
 * Registers the Spring Security filter chain with the servlet container.
 * This class enables Spring Security for the web application without needing web.xml configuration.
 * It automatically loads the SecurityConfig class and applies security filters.
 */
public class SecurityInitializer extends AbstractSecurityWebApplicationInitializer {
	// Registers the springSecurityFilterChain
}
