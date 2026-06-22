package com.store1.service;

import java.util.List;

import com.store1.model.dao.ProductDAO;
import com.store1.model.entity.Product;

public class ProductService {

    private ProductDAO productDAO = new ProductDAO();

    // ✅ 1. Get all products (default)
    public List<Product> getAllProducts() {
        return productDAO.getAllProducts();
    }

    // 🔍 2. Filter + Search products
    public List<Product> filterProducts(String keyword, String[] categories, String price, String[] brands) {
        return productDAO.filterProducts(keyword, categories, price, brands);
    }

    // 🛒 3. Get product by ID (USED IN CART)
    public Product getProductById(Long id) {
        return productDAO.getProductById(id);
    }
}