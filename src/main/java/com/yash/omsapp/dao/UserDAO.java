package com.yash.omsapp.dao;

import com.yash.omsapp.model.User;

/**
 * This interface defines basic database operations for users.
 * It is used to interact with the user table in the database.
 */
public interface UserDAO 
{
	/**
     * Finds a user by their username.
     * @param username the username to search for
     * @return the matching User or null if not found
     */
	public User findByUsername(String username);

	/**
     * Saves a new user or updates an existing one.
     * @param u the user to save
     * @return the saved User object
     */
	public User save(User u);
}
