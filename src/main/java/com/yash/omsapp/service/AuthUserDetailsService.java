package com.yash.omsapp.service;

import com.yash.omsapp.dao.UserDAO;
import com.yash.omsapp.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.*;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Service;

import java.util.Collections;

/**
 * This service is used by Spring Security to load user details during login.
 * It checks if the user exists and is enabled, then returns user info for authentication.
 */
@Service
public class AuthUserDetailsService implements UserDetailsService {

	@Autowired
	private UserDAO userDAO;

	 /**
     * Loads user details by username.
     * If the user is not found or disabled, throws an exception.
     * Otherwise, returns a Spring Security User object with username, password, and role.
     * @param username the username entered during login
     * @return UserDetails object used by Spring Security
     * @throws UsernameNotFoundException if user is not found or disabled
     */
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User u = userDAO.findByUsername(username);
		if (u == null || !u.isEnabled())
			throw new UsernameNotFoundException("User not found");
		return new org.springframework.security.core.userdetails.User(u.getUsername(), u.getPassword(),
				Collections.singletonList(new SimpleGrantedAuthority("ROLE_" + u.getRole())));
	}
}
