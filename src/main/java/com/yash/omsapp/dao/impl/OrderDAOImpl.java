package com.yash.omsapp.dao.impl;

import com.yash.omsapp.dao.OrderDAO;
import com.yash.omsapp.model.Order;
import com.yash.omsapp.model.User;
import org.springframework.stereotype.Repository;

import javax.persistence.*;
import javax.transaction.Transactional;
import java.util.List;

/**
 * This class provides the actual database operations for orders.
 * It uses JPA EntityManager to interact with the order table.
 */
@Repository
@Transactional
public class OrderDAOImpl implements OrderDAO {

	// Injects the JPA EntityManager to perform database operations
	@PersistenceContext
	private EntityManager em;

	@Override
	public Order findById(Long id) {
		return em.find(Order.class, id);
	}

	@Override
	public Order save(Order o) {
		if (o.getId() == null) {
			em.persist(o);
			return o;
		}
		return em.merge(o);
	}

	@Override
	public List<Order> findAll(int offset, int limit) {
		return em.createQuery("SELECT o FROM Order o ORDER BY o.id DESC", Order.class).setFirstResult(offset)
				.setMaxResults(limit).getResultList();
	}

	@Override
	public long countAll() {
		return em.createQuery("SELECT COUNT(o) FROM Order o", Long.class).getSingleResult();
	}

	@Override
	public List<Order> findByCustomer(User u) {
		return em.createQuery("SELECT o FROM Order o WHERE o.customer=:u ORDER BY o.id DESC", Order.class)
				.setParameter("u", u).getResultList();
	}

	@Override
	public void updateStatus(Long orderId, String status) {
		Order o = em.find(Order.class, orderId);
		if (o != null) {
			o.setStatus(status);
			em.merge(o);
		}
	}
}
