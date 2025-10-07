package com.yash.omsapp.service;

import com.yash.omsapp.model.Product;
import java.math.BigDecimal;
import java.util.Map;

public interface CartService {
	Map<Long, Integer> getCart();

	void add(Product p, int qty);

	void update(Long productId, int qty);

	void remove(Long productId);

	void clear();

	BigDecimal total();
}
