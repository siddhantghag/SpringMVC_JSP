package com.yash.omsapp.service;

import com.yash.omsapp.model.Category;
import java.util.List;

public interface CategoryService {
	List<Category> all();

	Category get(Long id);

	Category save(Category c);

	void delete(Long id);
}
