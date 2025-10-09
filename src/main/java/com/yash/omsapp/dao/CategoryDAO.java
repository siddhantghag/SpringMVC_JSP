package com.yash.omsapp.dao;

import com.yash.omsapp.model.Category;
import java.util.List;

/**
 * This interface defines basic database operations for Category.
 * It is used to interact with the category table in the database.
 */
public interface CategoryDAO 
{
	/**
     * Finds a category by its ID.
     * @param id the ID of the category
     * @return the matching Category or null if not found
     */
	public Category findById(Long id);

	/**
     * Finds a category by its name.
     * @param name the name of the category
     * @return the matching Category or null if not found
     */
	public Category findByName(String name);

	/**
     * Returns a list of all categories.
     * @return list of Category objects
     */
	public List<Category> findAll();

	/**
     * Saves a new category or updates an existing one.
     * @param c the category to save
     * @return the saved Category object
     */
	public Category save(Category c);

	/**
     * Deletes a category by its ID.
     * @param id the ID of the category to delete
     */
	public void delete(Long id);
}
	