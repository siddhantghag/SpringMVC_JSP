package com.yash.omsapp.dao;

import com.yash.omsapp.model.Product;
import java.util.List;

/**
 * This interface defines basic database operations for products.
 * It is used to interact with the product table in the database.
 */
public interface ProductDAO 
{

    /**
     * Finds a product by its ID.
     * @param id the ID of the product
     * @return the matching Product or null if not found
     */
	public Product findById(Long id);

	/**
     * Searches for products using a keyword and optional category.
     * Supports pagination using offset and limit.
     * @param q search keyword (can be null)
     * @param categoryId category ID to filter (can be null)
     * @param offset starting point for pagination
     * @param limit number of products to return
     * @return list of matching products
     */
	public List<Product> search(String q, Long categoryId, int offset, int limit);

	 /**
     * Counts how many products match the search criteria.
     * @param q search keyword (can be null)
     * @param categoryId category ID to filter (can be null)
     * @return total number of matching products
     */
	public long countSearch(String q, Long categoryId);

	/**
     * Saves a new product or updates an existing one.
     * @param p the product to save
     * @return the saved Product object
     */
	public Product save(Product p);

	 /**
     * Deletes a product by its ID.
     * @param id the ID of the product to delete
     */
	public void delete(Long id);

	 /**
     * Finds a product by its ID and includes its category details.
     * @param id the ID of the product
     * @return the Product with category info or null if not found
     */
	public Product findByIdWithCategory(Long id);

	/**
     * Returns the latest added products.
     * @param limit number of products to return
     * @return list of latest products
     */
	public List<Product> findLatest(int limit);
}
