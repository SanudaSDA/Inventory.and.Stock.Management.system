package com.example.salesreport;

import java.util.Date;

public class Transaction {
    private Date date;
    private String category;
    private int quantity;
    private double revenue;
    private double margin;
    private int id;

    // Constructor
    public Transaction(Date date, String category, int quantity, double revenue, double margin,int id) {
        this.date = date;
        this.category = category;
        this.quantity = quantity;
        this.revenue = revenue;
        this.margin = margin;
        this.id = id;
    }

    // Getter methods
    public Date getDate() {
        return date;
    }

    public String getCategory() {
        return category;
    }

    public int getQuantity() {
        return quantity;
    }

    public double getRevenue() {
        return revenue;
    }

    public double getMargin() {
        return margin;
    }

    public int getId() {
        return id;
    }

    // Setter methods
    public void setDate(Date date) {
        this.date = date;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setRevenue(double revenue) {
        this.revenue = revenue;
    }

    public void setMargin(double margin) {
        this.margin = margin;
    }
    public void setId(int id) {
        this.id = id;
    }
}
