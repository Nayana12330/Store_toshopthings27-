package com.store1.service;

import com.store1.model.dao.UserDAO;
import com.store1.model.entity.User;

public class UserService {

    private UserDAO userDAO = new UserDAO();

    public void registerUser(User user) {
        userDAO.saveUser(user);
    }

    // ✅ ADD THIS METHOD
    public User login(String email, String password) {
        return userDAO.getUserByEmailAndPassword(email, password);
    }
}