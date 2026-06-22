package com.store1.model.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.store1.model.entity.Order;
import com.store1.util.HibernateUtil;

public class OrderDAO {

    public void saveOrder(Order order) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();

            session.persist(order); // Hibernate 6 ✔

            tx.commit();

        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }
}