package com.example.salesreport;

//shows a single transaction record. It stores and access data related to a sales transaction.
import java.io.Serializable;

//Serializable is a marker interface (no methods) that allows instances of this class to be saved to  file.
//Required for Java object serialization using ObjectOutputStream and ObjectInputStream

public class Transaction implements Serializable{
    private String date;
    private String category;
    private int quantity;
    private double revenue;
    private double margin;
    private int id;

    //constructor to initialize properties
    public Transaction(String date, String category, int quantity, double revenue, double margin, int id) {
        this.date = date;
        this.category = category;
        this.quantity = quantity;
        this.revenue = revenue;
        this.margin = margin;
        this.id = id;
    }

    // Getter methods
    public String getDate() {
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
    public void setDate(String date) {
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
