package com.store1.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.store1.model.entity.Product;
import com.store1.service.ProductService;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {

    private ProductService productService = new ProductService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String keyword = request.getParameter("keyword");
        String price = request.getParameter("price");

        // ✅ FIXED CATEGORY (radio)
        String category = request.getParameter("category");
        String[] categories = null;
        
        

        if (category != null && !category.isEmpty()) {
            categories = new String[]{category};
        }

        // ✅ BRAND (checkbox)
        String[] brands = request.getParameterValues("brand");

        List<Product> products = productService.filterProducts(keyword, categories, price, brands);

        request.setAttribute("products", products);

        request.getRequestDispatcher("/products.jsp").forward(request, response);
    }
}