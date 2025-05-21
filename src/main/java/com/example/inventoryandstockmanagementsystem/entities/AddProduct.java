package com.example.inventoryandstockmanagementsystem.entities;

public class AddProduct {
    protected String name;
    protected double price;
    protected String itemId;

    public AddProduct(String name, double price, String itemId) {
        this.name = name;
        this.price = price;
        this.itemId = itemId;
    }

    public String getDetails() {
        return name + " | " + price + " | " + itemId;
    }

    // Getters
    public String getName() {
        return name;
    }

    public double getPrice() {
        return price;
    }

    public String getItemId() {
        return itemId;
    }

    // Setters
    public void setName(String name) {
        this.name = name;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setItemId(String itemId) {
        this.itemId = itemId;
    }
}
