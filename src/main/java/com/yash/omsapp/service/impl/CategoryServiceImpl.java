package com.yash.omsapp.service.impl;

import com.yash.omsapp.dao.CategoryDAO;
import com.yash.omsapp.model.Category;
import com.yash.omsapp.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

/**
 * This service class handles business logic for categories.
 * It connects the controller layer with the DAO layer.
 */
@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {
	
     // Injects the DAO to perform database operations for categories
	@Autowired
	private CategoryDAO dao;

	/**
     * Returns a list of all categories.
     * @return list of Category objects
     */
	@Override
	public List<Category> all() {
		return dao.findAll();
	}

	/**
     * Finds a category by its ID.
     * @param id the ID of the category
     * @return the matching Category or null if not found
     */
	@Override
	public Category get(Long id) {
		return dao.findById(id);
	}

	/**
     * Saves a new category or updates an existing one.
     * @param c the category to save
     * @return the saved Category object
     */
	@Override
	public Category save(Category c) {
		return dao.save(c);
	}

	/**
     * Deletes a category by its ID.
     * @param id the ID of the category to delete
     */
	@Override
	public void delete(Long id) {
		dao.delete(id);
	}
}
