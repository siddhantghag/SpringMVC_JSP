package com.yash.omsapp.service.impl;

import com.yash.omsapp.model.Product;
import com.yash.omsapp.service.CartService;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import java.math.BigDecimal;
import java.util.*;

@Service
@SessionScope
public class CartServiceImpl implements CartService {

	private final Map<Long, Integer> cart = new LinkedHashMap<>();

	@Override
	public Map<Long, Integer> getCart() {
		return cart;
	}

	@Override
	public void add(Product p, int qty) {
		cart.merge(p.getId(), Math.max(1, qty), Integer::sum);
	}

	@Override
	public void update(Long productId, int qty) {
		if (qty <= 0)
			cart.remove(productId);
		else
			cart.put(productId, qty);
	}

	@Override
	public void remove(Long productId) {
		cart.remove(productId);
	}

	@Override
	public void clear() {
		cart.clear();
	}

	@Override
	public BigDecimal total() {
		return BigDecimal.ZERO;
	} // computed in view with product lookups if needed
}
