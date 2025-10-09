package com.yash.omsapp.dao.impl;

import com.yash.omsapp.dao.CategoryDAO;
import com.yash.omsapp.model.Category;
import org.springframework.stereotype.Repository;

import javax.persistence.*;
import javax.transaction.Transactional;
import java.util.List;



/**
 * This class provides the actual database operations for Category.
 * It uses JPA EntityManager to interact with the database.
 */
@Repository
@Transactional
public class CategoryDAOImpl implements CategoryDAO {

	 // Injects the JPA EntityManager to perform database operations
	@PersistenceContext
	private EntityManager em;

	@Override
	public Category findById(Long id) {
		return em.find(Category.class, id);
	}

	@Override
	public Category findByName(String name) {
		try {
			return em.createQuery("SELECT c FROM Category c WHERE c.name=:n", Category.class).setParameter("n", name)
					.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

	@Override
	public List<Category> findAll() {
		return em.createQuery("SELECT c FROM Category c ORDER BY c.name", Category.class).getResultList();
	}

	@Override
	public Category save(Category c) {
		if (c.getId() == null) {
			em.persist(c);
			return c;
		}
		return em.merge(c);
	}

	@Override
	public void delete(Long id) {
		Category c = em.find(Category.class, id);
		if (c != null)
			em.remove(c);
	}
}
