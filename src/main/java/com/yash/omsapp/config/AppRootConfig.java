package com.yash.omsapp.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;


/**
 * Root configuration class for the Order Management System application.
 * This class sets up component scanning for service and DAO layers.
 * It is loaded by the Spring root application context.
 */

@Configuration
@ComponentScan(basePackages = { "com.yash.omsapp.service", "com.yash.omsapp.service.impl", "com.yash.omsapp.dao",
		"com.yash.omsapp.dao.impl" })
public class AppRootConfig {
	// No beans needed here; just component scan for root context
	 /**
     * No explicit bean definitions are required here.
     * This configuration is responsible for scanning service and DAO components.
     */
}