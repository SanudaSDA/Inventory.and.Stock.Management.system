package com.example.inventoryandstockmanagementsystem.entities;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class Item extends AddProduct {
    private String category;
    private String description;
    private String supplierName;
    private String supplierContact;
    private int quantity;

    public Item(String name, double price, String itemId, String category, String description,
                String supplierName, String supplierContact, int quantity) {
        super(name, price, itemId);
        this.category = category;
        this.description = description;
        this.supplierName = supplierName;
        this.supplierContact = supplierContact;
        this.quantity = quantity;
    }

    @Override
    public String getDetails() {
        return super.getDetails() + " | " + category + " | Qty: " + quantity;
    }

    // Getters and setters
    public String getCategory() {
        return category;
    }
    public void setCategory(String category) {
        this.category = category;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    public String getSupplierName() {
        return supplierName;
    }
    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }
    public String getSupplierContact() {
        return supplierContact;
    }
    public void setSupplierContact(String supplierContact) {
        this.supplierContact = supplierContact;
    }
    public int getQuantity() {
        return quantity;
    }
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }


    @Override
    public String toString() {
        return getName() + "|" + getPrice() + "|" + getItemId() + "|" + category + "|" + description + "|" +
                supplierName + "|" + supplierContact + "|" + quantity;
    }


    public static Item fromString(String str) {
        String[] parts = str.split("\\|");
        if (parts.length < 8) {
            throw new IllegalArgumentException("Invalid item string format");
        }
        try {
            String name = parts[0].trim();
            double price = Double.parseDouble(parts[1].trim());
            String itemId = parts[2].trim();
            String category = parts[3].trim();
            String description = parts[4].trim();
            String supplierName = parts[5].trim();
            String supplierContact = parts[6].trim();
            int quantity = Integer.parseInt(parts[7].trim());

            return new Item(name, price, itemId, category, description, supplierName, supplierContact, quantity);
        } catch (NumberFormatException e) {
            throw new IllegalArgumentException("Number format error in item string: " + e.getMessage());
        }
    }

    // Append this item to the file
    public void saveToFile(String filename) throws IOException {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filename, true))) {
            writer.write(this.toString());
            writer.newLine();
        }
    }
}
