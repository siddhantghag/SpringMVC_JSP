package com.yash.omsapp.config;

import org.springframework.context.annotation.*;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.context.support.ResourceBundleMessageSource;

/**
 * Spring MVC configuration class for the Order Management System.
 * Sets up view resolution, static resource handling, and internationalization support.
 */

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "com.yash.omsapp.controller")
public class WebMvcConfig implements WebMvcConfigurer {

	/**
     * Configures the view resolver for JSP files.
     * Resolves logical view names to physical JSP files under /WEB-INF/views/.
     * @return InternalResourceViewResolver bean
     */
	@Bean
	public InternalResourceViewResolver viewResolver() {
		InternalResourceViewResolver vr = new InternalResourceViewResolver();
		vr.setPrefix("/WEB-INF/views/");
		vr.setSuffix(".jsp");
		vr.setOrder(1);
		return vr;
	}

	/**
     * Configures static resource handling.
     * Maps requests to /assets/** to the /assets/ directory in the webapp.
     * @param registry ResourceHandlerRegistry
     */
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/assets/**").addResourceLocations("/assets/");
	}

	/**
     * Configures message source for internationalization.
     * Loads messages from a resource bundle named "messages".
     * @return ResourceBundleMessageSource bean
     */
	@Bean
	public ResourceBundleMessageSource messageSource() {
		ResourceBundleMessageSource ms = new ResourceBundleMessageSource();
		ms.setBasename("messages");
		ms.setDefaultEncoding("UTF-8");
		return ms;
	}
}
