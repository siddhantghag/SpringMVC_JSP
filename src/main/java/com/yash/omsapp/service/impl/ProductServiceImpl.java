package com.yash.omsapp.service.impl;

import com.yash.omsapp.dao.ProductDAO;
import com.yash.omsapp.model.Product;
import com.yash.omsapp.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDAO dao;

//	@Override
//	public Product get(Long id) {
//		return dao.findById(id);
//	}

	@Override
	@Transactional(readOnly = true)
	public Product get(Long id) {
		return dao.findByIdWithCategory(id);
	}

	@Override
	@Transactional(readOnly = true)
	public List<Product> findLatest(int limit) {
		return dao.findLatest(limit);
	}

	@Override
	public List<Product> search(String q, Long categoryId, int page, int size) {
		int offset = (Math.max(page, 1) - 1) * size;
		return dao.search(q, categoryId, offset, size);
	}

	@Override
	public long countSearch(String q, Long categoryId) {
		return dao.countSearch(q, categoryId);
	}

	@Override
	public Product save(Product p) {
		return dao.save(p);
	}

	@Override
	public void delete(Long id) {
		dao.delete(id);
	}
}
