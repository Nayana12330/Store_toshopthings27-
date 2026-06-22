package com.store1.model.entity;

public class CartItem {

    private Product product;
    private int quantity;
    private String image; // 🔥 ADD THIS
    
    private String size;

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public CartItem(Product product, int quantity, String image) {
        this.product = product;
        this.quantity = quantity;
        this.image = image;
    }

    public Product getProduct() { return product; }
    public int getQuantity() { return quantity; }
    public String getImage() { return image; } // 🔥 ADD

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setImage(String image) { // 🔥 ADD
        this.image = image;
    }
}