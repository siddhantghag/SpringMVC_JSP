package com.yash.omsapp.dao;

import com.yash.omsapp.model.Category;
import java.util.List;

public interface CategoryDAO {
	Category findById(Long id);

	Category findByName(String name);

	List<Category> findAll();

	Category save(Category c);

	void delete(Long id);
}
	