package com.yash.omsapp.service;

import com.yash.omsapp.model.*;
import java.util.List;
import java.util.Map;

public interface OrderService {
	Order placeOrder(User customer, Map<Long, Integer> cartQuantities);

	List<Order> myOrders(User customer);

	List<Order> all(int page, int size);

	long countAll();

	void updateStatus(Long orderId, String status);
}
