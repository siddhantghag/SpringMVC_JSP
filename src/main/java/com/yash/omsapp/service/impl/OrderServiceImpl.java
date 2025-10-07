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

@Service
@Transactional
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDAO orderDAO;
	@Autowired
	private ProductDAO productDAO;

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

	@Override
	public List<Order> myOrders(User customer) {
		return orderDAO.findByCustomer(customer);
	}

	@Override
	public List<Order> all(int page, int size) {
		int offset = (Math.max(page, 1) - 1) * size;
		return orderDAO.findAll(offset, size);
	}

	@Override
	public long countAll() {
		return orderDAO.countAll();
	}

	@Override
	public void updateStatus(Long orderId, String status) {
		orderDAO.updateStatus(orderId, status);
	}
}
