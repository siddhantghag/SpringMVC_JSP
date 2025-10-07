package com.yash.omsapp.dao;

import com.yash.omsapp.model.Product;
import java.util.List;

public interface ProductDAO {
	Product findById(Long id);

	List<Product> search(String q, Long categoryId, int offset, int limit);

	long countSearch(String q, Long categoryId);

	Product save(Product p);

	void delete(Long id);

	Product findByIdWithCategory(Long id);

	List<Product> findLatest(int limit);
}
