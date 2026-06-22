package com.store1.service;

import com.store1.model.dao.OrderDAO;
import com.store1.model.entity.Order;

public class OrderService {

    private OrderDAO orderDAO = new OrderDAO();

    public void placeOrder(Order order) {
        orderDAO.saveOrder(order);
    }
}