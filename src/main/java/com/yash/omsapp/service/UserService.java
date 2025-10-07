package com.yash.omsapp.service;

import com.yash.omsapp.model.User;

public interface UserService {
	User registerCustomer(String username, String rawPassword);

	User findByUsername(String username);
}
