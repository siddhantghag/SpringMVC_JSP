package com.yash.omsapp.dao.impl;

import com.yash.omsapp.dao.UserDAO;
import com.yash.omsapp.model.User;
import org.springframework.stereotype.Repository;

import javax.persistence.*;
import javax.transaction.Transactional;

@Repository
@Transactional
public class UserDAOImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public User findByUsername(String username) {
		try {
			return em.createQuery("SELECT u FROM User u WHERE u.username = :u", User.class).setParameter("u", username)
					.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

	@Override
	public User save(User u) {
		if (u.getId() == null) {
			em.persist(u);
			return u;
		} else {
			return em.merge(u);
		}
	}
}
