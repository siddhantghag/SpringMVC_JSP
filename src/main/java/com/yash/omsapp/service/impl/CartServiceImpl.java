package com.yash.omsapp.service.impl;

import com.yash.omsapp.model.Product;
import com.yash.omsapp.service.CartService;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import java.math.BigDecimal;
import java.util.*;

/**
 * This class manages the shopping cart for each user session.
 * It stores product IDs and their quantities in memory.
 */
@Service
@SessionScope
public class CartServiceImpl implements CartService {

	// Stores productId and quantity in the cart
	private final Map<Long, Integer> cart = new LinkedHashMap<>();

	/**
     * Returns the current cart items.
     * @return map of productId to quantity
     */
	@Override
	public Map<Long, Integer> getCart() {
		return cart;
	}

	/**
     * Adds a product to the cart.
     * If the product already exists, increases the quantity.
     * @param p the product to add
     * @param qty the quantity to add (minimum 1)
     */
	@Override
	public void add(Product p, int qty) {
		cart.merge(p.getId(), Math.max(1, qty), Integer::sum);
	}

	/**
     * Updates the quantity of a product in the cart.
     * If qty is 0 or less, removes the product.
     * @param productId the ID of the product
     * @param qty the new quantity
     */
	@Override
	public void update(Long productId, int qty) {
		if (qty <= 0)
			cart.remove(productId);
		else
			cart.put(productId, qty);
	}

	/**
     * Removes a product from the cart.
     * @param productId the ID of the product to remove
     */
	@Override
	public void remove(Long productId) {
		cart.remove(productId);
	}


    /**
     * Clears all items from the cart.
     */
	@Override
	public void clear() {
		cart.clear();
	}

	/**
     * Returns the total price of items in the cart.
     * Currently returns 0; actual total is calculated in the view using product prices.
     * @return total price (placeholder)
     */
	@Override
	public BigDecimal total() {
		return BigDecimal.ZERO;
	} // computed in view with product lookups if needed
}
