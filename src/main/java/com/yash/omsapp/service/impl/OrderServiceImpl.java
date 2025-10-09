package com.yash.omsapp.service.impl;

import com.yash.omsapp.dao.OrderDAO;
import com.yash.omsapp.dao.ProductDAO;
import com.yash.omsapp.model.*;
import com.yash.omsapp.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.math.BigDecimal;
import java.util.*;
import java.util.stream.Collectors;

/**
 * This service handles business logic for placing and managing orders.
 * It connects the controller layer with the DAO layer.
 */
@Service
@Transactional
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDAO orderDAO;
	@Autowired
	private ProductDAO productDAO;

	/**
     * Places a new order for the given customer using the cart items.
     * Checks stock availability, calculates total, and updates product stock.
     * @param customer the user placing the order
     * @param cartQuantities map of productId to quantity
     * @return the saved Order object
     */
	@Override
	public Order placeOrder(User customer, Map<Long, Integer> cartQuantities) {
		if (cartQuantities == null || cartQuantities.isEmpty())
			throw new IllegalArgumentException("Cart empty");

		Order order = new Order();
		order.setCustomer(customer);

		List<OrderItem> items = new ArrayList<>();
		BigDecimal total = BigDecimal.ZERO;

		for (Map.Entry<Long, Integer> e : cartQuantities.entrySet()) {
			Product p = productDAO.findById(e.getKey());
			int qty = Math.max(1, e.getValue());
			if (p == null)
				continue;
			if (p.getStockQuantity() < qty)
				throw new IllegalStateException("Insufficient stock for " + p.getName());

			OrderItem oi = new OrderItem();
			oi.setOrder(order);
			oi.setProduct(p);
			oi.setQuantity(qty);
			oi.setPrice(p.getPrice());

			items.add(oi);
			total = total.add(p.getPrice().multiply(BigDecimal.valueOf(qty)));

			p.setStockQuantity(p.getStockQuantity() - qty);
			productDAO.save(p);
		}

		order.setItems(items);
		order.setTotalAmount(total);
		return orderDAO.save(order);
	}

	/**
     * Returns all orders placed by a specific customer.
     * @param customer the user whose orders are requested
     * @return list of Order objects
     */
	@Override
	public List<Order> myOrders(User customer) {
		return orderDAO.findByCustomer(customer);
	}

	/**
     * Returns a paginated list of all orders.
     * @param page current page number
     * @param size number of orders per page
     * @return list of Order objects
     */
	@Override
	public List<Order> all(int page, int size) {
		int offset = (Math.max(page, 1) - 1) * size;
		return orderDAO.findAll(offset, size);
	}

	/**
     * Returns the total number of orders in the system.
     * @return total count of orders
     */
	@Override
	public long countAll() {
		return orderDAO.countAll();
	}

	/**
     * Updates the status of an order (e.g., SHIPPED, DELIVERED).
     * @param orderId the ID of the order to update
     * @param status the new status to set
     */
	@Override
	public void updateStatus(Long orderId, String status) {
		orderDAO.updateStatus(orderId, status);
	}
}
