package com.yash.omsapp.dao;

import com.yash.omsapp.model.Order;
import com.yash.omsapp.model.User;
import java.util.List;

/**
 * This interface defines basic database operations for orders.
 * It is used to interact with the order table in the database.
 */
public interface OrderDAO 
{
	 /**
     * Finds an order by its ID.
     * @param id the ID of the order
     * @return the matching Order or null if not found
     */
	public Order findById(Long id);

	/**
     * Saves a new order or updates an existing one.
     * @param o the order to save
     * @return the saved Order object
     */
	public Order save(Order o);

	/**
     * Returns a paginated list of all orders.
     * @param offset starting point for pagination
     * @param limit number of orders to return
     * @return list of Order objects
     */
	public List<Order> findAll(int offset, int limit);

	/**
     * Returns the total number of orders in the database.
     * @return total count of orders
     */
	public long countAll();

	/**
     * Finds all orders placed by a specific customer.
     * @param u the User who placed the orders
     * @return list of orders for that customer
     */
	public List<Order> findByCustomer(User u);

	/**
     * Updates the status of an order.
     * @param orderId the ID of the order to update
     * @param status the new status to set (e.g., "SHIPPED", "DELIVERED")
     */
	public void updateStatus(Long orderId, String status);
}
