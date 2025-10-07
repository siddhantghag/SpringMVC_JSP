package com.yash.omsapp.service.impl;

import com.yash.omsapp.dao.CategoryDAO;
import com.yash.omsapp.model.Category;
import com.yash.omsapp.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	private CategoryDAO dao;

	@Override
	public List<Category> all() {
		return dao.findAll();
	}

	@Override
	public Category get(Long id) {
		return dao.findById(id);
	}

	@Override
	public Category save(Category c) {
		return dao.save(c);
	}

	@Override
	public void delete(Long id) {
		dao.delete(id);
	}
}
