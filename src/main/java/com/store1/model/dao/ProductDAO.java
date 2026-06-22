package com.store1.model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.store1.model.entity.Product;
import com.store1.util.HibernateUtil;

public class ProductDAO {

    // ✅ 1. Get all products
    public List<Product> getAllProducts() {

        Session session = HibernateUtil.getSessionFactory().openSession();

        try {
            return session.createQuery("FROM Product", Product.class).list();
        } finally {
            session.close();
        }
    }

    // 🔍 2. Filter + Search Products (MAIN LOGIC)
    public List<Product> filterProducts(String keyword, String[] categories, String price, String[] brands) {

        Session session = HibernateUtil.getSessionFactory().openSession();

        String hql = "FROM Product WHERE 1=1";

        // 🔍 Search by name
        if (keyword != null && !keyword.trim().isEmpty()) {
            hql += " AND LOWER(name) LIKE :keyword";
        }

        // 🎛 Category filter (multiple)
        if (categories != null && categories.length > 0) {
            hql += " AND category IN (:categories)";
        }

        // 🏷 Brand filter (multiple)
        if (brands != null && brands.length > 0) {
            hql += " AND LOWER(brand) IN (:brands)";
        }

        // 💰 Price filter
        if (price != null && !price.isEmpty()) {
            if (price.equals("low")) {
                hql += " AND price < 500";
            } else if (price.equals("mid")) {
                hql += " AND price BETWEEN 500 AND 1000";
            } else if (price.equals("high")) {
                hql += " AND price > 1000";
            }
        }

        Query<Product> query = session.createQuery(hql, Product.class);

        // 🔁 Set parameters safely
        if (keyword != null && !keyword.trim().isEmpty()) {
            query.setParameter("keyword", "%" + keyword.toLowerCase() + "%");
        }

        if (categories != null && categories.length > 0) {
            query.setParameterList("categories", categories);
        }

        if (brands != null && brands.length > 0) {
            query.setParameterList("brands", brands);
        }

        List<Product> list = query.list();

        session.close();

        return list;
    }

    // 🛒 3. Get product by ID (FOR CART)
    public Product getProductById(Long id) {

        Session session = HibernateUtil.getSessionFactory().openSession();

        try {
            return session.get(Product.class, id);
        } finally {
            session.close();
        }
    }
}