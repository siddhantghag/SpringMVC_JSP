package com.yash.omsapp.config;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.dao.annotation.PersistenceExceptionTranslationPostProcessor;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;
import javax.persistence.EntityManagerFactory; 
import java.util.Properties;

/**
 * Hibernate and JPA configuration for the Order Management System.
 * Sets up DataSource, EntityManagerFactory, TransactionManager, and exception translation.
 */
@Configuration
@EnableTransactionManagement
public class HibernateConfig {
	
	/**
     * Configures the HikariCP DataSource for MySQL.
     * @return configured DataSource bean
     */
	@Bean
	public DataSource dataSource() {
		HikariConfig cfg = new HikariConfig();
		cfg.setDriverClassName("com.mysql.cj.jdbc.Driver");
		cfg.setJdbcUrl(
				"jdbc:mysql://localhost:3306/order_m_s?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC");
		cfg.setUsername("root");
		cfg.setPassword("root");
		cfg.setMaximumPoolSize(10);
		return new HikariDataSource(cfg);
	}
	
	/**
     * Configures the JPA EntityManagerFactory using Hibernate as the provider.
     * Scans the model package for entity classes.
     * @param ds the DataSource to use
     * @return configured EntityManagerFactory bean
     */
	@Bean
	public LocalContainerEntityManagerFactoryBean entityManagerFactory(DataSource ds) {
		LocalContainerEntityManagerFactoryBean emf = new LocalContainerEntityManagerFactoryBean();
		emf.setDataSource(ds);
		emf.setPackagesToScan("com.yash.omsapp.model");
		emf.setJpaVendorAdapter(new HibernateJpaVendorAdapter());

		Properties props = new Properties();
		props.setProperty("hibernate.hbm2ddl.auto", "update");
		props.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQL8Dialect");
		props.setProperty("hibernate.show_sql", "false");
		props.setProperty("hibernate.format_sql", "true");
		emf.setJpaProperties(props);

		return emf;
	}

	/**
     * Configures the JPA transaction manager.
     * @param emf the EntityManagerFactory to manage transactions
     * @return configured JpaTransactionManager bean
     */
	@Bean
	public JpaTransactionManager transactionManager(EntityManagerFactory emf) {
		// <-- Use JPA's EntityManagerFactory, not EntityManagerFactoryBuilder
		return new JpaTransactionManager(emf);
	}

	/**
     * Enables automatic translation of persistence exceptions into Spring's DataAccessException hierarchy.
     * @return configured PersistenceExceptionTranslationPostProcessor bean
     */
	@Bean
	public PersistenceExceptionTranslationPostProcessor exceptionTranslation() {
		return new PersistenceExceptionTranslationPostProcessor();
	}
}