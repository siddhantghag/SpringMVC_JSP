package com.yash.omsapp.service;

import com.yash.omsapp.dao.UserDAO;
import com.yash.omsapp.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.*;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Service;

import java.util.Collections;

@Service
public class AuthUserDetailsService implements UserDetailsService {

	@Autowired
	private UserDAO userDAO;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User u = userDAO.findByUsername(username);
		if (u == null || !u.isEnabled())
			throw new UsernameNotFoundException("User not found");
		return new org.springframework.security.core.userdetails.User(u.getUsername(), u.getPassword(),
				Collections.singletonList(new SimpleGrantedAuthority("ROLE_" + u.getRole())));
	}
}
