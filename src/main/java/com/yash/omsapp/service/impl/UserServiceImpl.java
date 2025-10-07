package com.yash.omsapp.service.impl;

import com.yash.omsapp.dao.UserDAO;
import com.yash.omsapp.model.User;
import com.yash.omsapp.service.UserService;
import com.yash.omsapp.util.SecurityRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	public User registerCustomer(String username, String rawPassword) {
		if (userDAO.findByUsername(username) != null)
			throw new IllegalArgumentException("Username already exists");

		User u = new User();
		u.setUsername(username);
		// encode with delegating encoder (defaults to bcrypt)
		u.setPassword(passwordEncoder.encode(rawPassword));
		u.setRole(SecurityRoles.CUSTOMER);
		u.setEnabled(true);
		return userDAO.save(u);
	}

	@Override
	public User findByUsername(String username) {
		return userDAO.findByUsername(username);
	}
}
