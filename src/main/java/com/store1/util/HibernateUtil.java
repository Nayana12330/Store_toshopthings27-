package com.store1.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.service.ServiceRegistry;

import com.store1.model.entity.Product;
import com.store1.model.entity.User;

public class HibernateUtil {

    private static SessionFactory sessionFactory;

    static {
        try {
            Configuration configuration = new Configuration().configure();

            // 🔥 REGISTER ENTITIES
            configuration.addAnnotatedClass(Product.class);
            configuration.addAnnotatedClass(User.class);

            ServiceRegistry serviceRegistry =
                    new StandardServiceRegistryBuilder()
                            .applySettings(configuration.getProperties())
                            .build();

            sessionFactory = configuration.buildSessionFactory(serviceRegistry);

            System.out.println("✅ Hibernate initialized successfully");

        } catch (Throwable ex) {
            System.err.println("❌ Hibernate failed:");
            ex.printStackTrace();
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }
}