package com.store1.model.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.store1.model.entity.User;
import com.store1.util.HibernateUtil;

public class UserDAO {

    public void saveUser(User user) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            session.persist(user);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }
    public User getUserByEmailAndPassword(String email, String password) {

        Session session = HibernateUtil.getSessionFactory().openSession();

        try {
            return session.createQuery(
                    "FROM User WHERE email = :email AND password = :password", User.class)
                    .setParameter("email", email)
                    .setParameter("password", password)
                    .uniqueResult();
        } finally {
            session.close();
        }
    }
}