package com.yash.omsapp.dao;

import com.yash.omsapp.model.User;

public interface UserDAO {
	User findByUsername(String username);

	User save(User u);
}
