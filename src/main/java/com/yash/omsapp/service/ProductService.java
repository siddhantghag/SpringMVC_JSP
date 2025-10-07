package com.yash.omsapp.service;

import com.yash.omsapp.model.Product;
import java.util.List;

public interface ProductService {
	Product get(Long id);

	List<Product> search(String q, Long categoryId, int page, int size);

	long countSearch(String q, Long categoryId);

	Product save(Product p);

	void delete(Long id);

	List<Product> findLatest(int limit);
}
