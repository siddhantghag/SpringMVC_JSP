package com.yash.omsapp.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.yash.omsapp.service.AuthUserDetailsService;
import com.yash.omsapp.util.SecurityRoles;


@EnableWebSecurity
@Configuration
//@componentScan(basePackages = "com.yash.omsapp.service")
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private AuthUserDetailsService userDetailsService;

	@Bean
	public PasswordEncoder passwordEncoder() {
		// Delegating encoder supports {bcrypt}, {noop}, etc.
		// Seed data uses {noop}... for quick start.
		// To force BCrypt everywhere, store passwords with {bcrypt}<hash>.
		return PasswordEncoderFactories.createDelegatingPasswordEncoder();
		// To DISABLE encoding temporarily for debugging, you could use:
		// return
		// org.springframework.security.crypto.password.NoOpPasswordEncoder.getInstance();
	}

	@Bean
	public DaoAuthenticationProvider authProvider() {
		DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
		provider.setUserDetailsService(userDetailsService);
		provider.setPasswordEncoder(passwordEncoder());
		return provider;
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) {
		auth.authenticationProvider(authProvider());
	}

	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable() // <-- TEMPORARY for dev
				.authorizeRequests().antMatchers("/", "/assets/**", "/auth/**", "/products/**").permitAll()
				.antMatchers("/cart/**", "/checkout/**", "/orders/**").hasRole(SecurityRoles.CUSTOMER)
				.antMatchers("/admin/**").hasRole(SecurityRoles.ADMIN).anyRequest().authenticated().and().formLogin()
				.loginPage("/auth/login").permitAll().loginProcessingUrl("/auth/login").defaultSuccessUrl("/", true)
				.failureUrl("/auth/login?error=true").and().logout().logoutUrl("/auth/logout").logoutSuccessUrl("/")
				.invalidateHttpSession(true).deleteCookies("JSESSIONID");
	}

}
