package com.store1;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.store1.model.entity.User;
import com.store1.util.HibernateUtil;

public class TestHibernate {

    public static void main(String[] args) {

        SessionFactory factory = HibernateUtil.getSessionFactory();
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();

        User user = new User();
        user.setName("Praveen");
        user.setEmail("praveen@test.com");
        user.setPassword("1234");

        session.save(user);

        tx.commit();
        session.close();

        System.out.println("User saved successfully!");
    }
}