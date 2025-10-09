package com.yash.omsapp.service.impl;

import com.yash.omsapp.dao.UserDAO;
import com.yash.omsapp.model.User;
import com.yash.omsapp.service.UserService;
import com.yash.omsapp.util.SecurityRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;



/**
 * This service handles user-related business logic such as registration and lookup.
 * It connects the controller layer with the DAO layer.
 */
@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;
	@Autowired
	private PasswordEncoder passwordEncoder;

	/**
     * Registers a new customer with a username and password.
     * Checks for duplicate usernames and encodes the password before saving.
     * @param username the desired username
     * @param rawPassword the plain-text password entered by the user
     * @return the saved User object
     * @throws IllegalArgumentException if the username already exists
     */
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


    /**
     * Finds a user by their username.
     * @param username the username to search for
     * @return the matching User object or null if not found
     */
	@Override
	public User findByUsername(String username) {
		return userDAO.findByUsername(username);
	}
}
