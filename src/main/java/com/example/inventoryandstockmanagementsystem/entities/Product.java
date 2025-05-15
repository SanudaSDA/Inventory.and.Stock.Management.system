package com.example.inventoryandstockmanagementsystem.entities;

public class Product {
    private String name;
    private double price;
    private String itemId;

    public Product(String name, double price, String itemId) {
        this.name = name;
        this.price = price;
        this.itemId = itemId;
    }

    public String getDetails() {
        return name + " | " + price + " | " + itemId;
    }

    // Getters and setters
    public String getName() {
        return name;
    }

    public double getPrice() {
        return price;
    }

    public String getItemId() {
        return itemId;
    }

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
