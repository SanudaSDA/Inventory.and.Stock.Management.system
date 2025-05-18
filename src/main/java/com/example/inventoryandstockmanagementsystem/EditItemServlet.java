package com.example.inventoryandstockmanagementsystem;

import com.example.inventoryandstockmanagementsystem.entities.Item;
import com.example.inventoryandstockmanagementsystem.utils.ItemCatalog;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/EditItemServlet")
public class EditItemServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String itemId = request.getParameter("itemId");
        String itemName = request.getParameter("itemName");
        String category = request.getParameter("category");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double price = Double.parseDouble(request.getParameter("price"));
        String supplierName = request.getParameter("supplierName");
        String supplierContact = request.getParameter("supplierContact");
        String Date = request.getParameter("Date");

        Item updatedItem = new Item(itemName, price, itemId, category, "", supplierName, supplierContact, quantity);
        ItemCatalog catalog = new ItemCatalog();
        catalog.editItem(updatedItem);

        response.sendRedirect("ItemsListServlet");
    }
}
