package com.yash.omsapp.dao;

import com.yash.omsapp.model.Order;
import com.yash.omsapp.model.User;
import java.util.List;

public interface OrderDAO {
	Order findById(Long id);

	Order save(Order o);

	List<Order> findAll(int offset, int limit);

	long countAll();

	List<Order> findByCustomer(User u);

	void updateStatus(Long orderId, String status);
}
