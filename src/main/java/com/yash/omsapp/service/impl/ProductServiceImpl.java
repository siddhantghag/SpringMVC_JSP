package com.yash.omsapp.service.impl;

import com.yash.omsapp.dao.ProductDAO;
import com.yash.omsapp.model.Product;
import com.yash.omsapp.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.transaction.annotation.Transactional;
import java.util.List;


/**
 * This service class handles business logic for products.
 * It connects the controller layer with the DAO layer.
 */
@Service
@Transactional
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDAO dao;

//	@Override
//	public Product get(Long id) {
//		return dao.findById(id);
//	}

	/**
     * Finds a product by its ID and includes its category details.
     * @param id the ID of the product
     * @return the Product object with category info
     */
	@Override
	@Transactional(readOnly = true)
	public Product get(Long id) {
		return dao.findByIdWithCategory(id);
	}

	/**
     * Returns the latest added products, sorted by newest first.
     * @param limit number of products to return
     * @return list of latest products
     */
	@Override
	@Transactional(readOnly = true)
	public List<Product> findLatest(int limit) {
		return dao.findLatest(limit);
	}
	
	/**
     * Searches for products using a keyword and optional category.
     * Supports pagination using page and size.
     * @param q search keyword (can be null)
     * @param categoryId category ID to filter (can be null)
     * @param page current page number
     * @param size number of products per page
     * @return list of matching products
     */
	@Override
	public List<Product> search(String q, Long categoryId, int page, int size) {
		int offset = (Math.max(page, 1) - 1) * size;
		return dao.search(q, categoryId, offset, size);
	}

	 /**
     * Counts how many products match the search criteria.
     * @param q search keyword (can be null)
     * @param categoryId category ID to filter (can be null)
     * @return total number of matching products
     */
	@Override
	public long countSearch(String q, Long categoryId) {
		return dao.countSearch(q, categoryId);
	}

	/**
     * Saves a new product or updates an existing one.
     * @param p the product to save
     * @return the saved Product object
     */
	@Override
	public Product save(Product p) {
		return dao.save(p);
	}

	/**
     * Deletes a product by its ID.
     * @param id the ID of the product to delete
     */
	@Override
	public void delete(Long id) {
		dao.delete(id);
	}
}
