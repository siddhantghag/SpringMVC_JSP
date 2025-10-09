package com.yash.omsapp.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;


/**
 * Initializes the Spring Web Application without using web.xml.
 * Registers configuration classes for both root and servlet contexts.
 * Maps the DispatcherServlet to the root ("/") URL pattern.
 */
public class WebAppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {
	
	/**
     * Specifies the root configuration classes.
     * These include service, DAO, Hibernate, and security configurations.
     * @return array of root config classes
     */
	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class<?>[] { AppRootConfig.class, HibernateConfig.class, SecurityConfig.class };
	}

	 /**
     * Specifies the servlet configuration classes.
     * These include Spring MVC-specific configurations.
     * @return array of servlet config classes
     */
	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class<?>[] { WebMvcConfig.class };
	}

	/**
     * Maps the DispatcherServlet to the root URL ("/").
     * All incoming requests are handled by this servlet.
     * @return array of servlet mappings
     */
	@Override
	protected String[] getServletMappings() {
		return new String[] { "/" };
	}
}
