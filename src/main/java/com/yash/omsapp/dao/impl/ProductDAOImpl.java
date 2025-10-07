package com.yash.omsapp.dao.impl;

import com.yash.omsapp.dao.ProductDAO;
import com.yash.omsapp.model.Product;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import javax.persistence.*;
import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public class ProductDAOImpl implements ProductDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Product findById(Long id) {
		return em.find(Product.class, id);
	}

	@Override
	public List<Product> findLatest(int limit) {
		return em.createQuery("SELECT p FROM Product p ORDER BY p.id DESC", Product.class).setMaxResults(limit)
				.getResultList();
	}

	@Override
	public Product findByIdWithCategory(Long id) {
		return em.createQuery("SELECT p FROM Product p LEFT JOIN FETCH p.category WHERE p.id = :id", Product.class)
				.setParameter("id", id).getResultStream().findFirst().orElse(null);
	}

	@Override
	public List<Product> search(String q, Long categoryId, int offset, int limit) {
		StringBuilder jpql = new StringBuilder("SELECT p FROM Product p WHERE 1=1 ");
		if (q != null && !q.trim().isEmpty())
			jpql.append("AND (LOWER(p.name) LIKE :q OR LOWER(p.description) LIKE :q) ");
		if (categoryId != null)
			jpql.append("AND p.category.id = :cid ");
		jpql.append("ORDER BY p.id DESC");

		TypedQuery<Product> query = em.createQuery(jpql.toString(), Product.class);
		if (q != null && !q.trim().isEmpty())
			query.setParameter("q", "%" + q.toLowerCase() + "%");
		if (categoryId != null)
			query.setParameter("cid", categoryId);
		query.setFirstResult(offset);
		query.setMaxResults(limit);
		return query.getResultList();
	}

	@Override
	public long countSearch(String q, Long categoryId) {
		StringBuilder jpql = new StringBuilder("SELECT COUNT(p) FROM Product p WHERE 1=1 ");
		if (q != null && !q.trim().isEmpty())
			jpql.append("AND (LOWER(p.name) LIKE :q OR LOWER(p.description) LIKE :q) ");
		if (categoryId != null)
			jpql.append("AND p.category.id = :cid ");

		TypedQuery<Long> query = em.createQuery(jpql.toString(), Long.class);
		if (q != null && !q.trim().isEmpty())
			query.setParameter("q", "%" + q.toLowerCase() + "%");
		if (categoryId != null)
			query.setParameter("cid", categoryId);
		return query.getSingleResult();
	}

	@Override
	public Product save(Product p) {
		if (p.getId() == null) {
			em.persist(p);
			return p;
		}
		return em.merge(p);
	}

	@Override
	public void delete(Long id) {
		Product p = em.find(Product.class, id);
		if (p != null)
			em.remove(p);
	}
}
