package com.yash.omsapp.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan(basePackages = { "com.yash.omsapp.service", "com.yash.omsapp.service.impl", "com.yash.omsapp.dao",
		"com.yash.omsapp.dao.impl" })
public class AppRootConfig {
	// No beans needed here; just component scan for root context
}