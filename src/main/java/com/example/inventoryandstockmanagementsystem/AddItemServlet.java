package com.example.inventoryandstockmanagementsystem;

import com.example.inventoryandstockmanagementsystem.entities.Item;
import com.example.inventoryandstockmanagementsystem.utils.ItemCatalog;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/AddItemServlet")
public class AddItemServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String itemId = request.getParameter("itemId");
        String itemName = request.getParameter("itemName");
        String category = request.getParameter("category");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double price = Double.parseDouble(request.getParameter("price"));
        String supplierName = request.getParameter("supplierName");
        String supplierContact = request.getParameter("supplierContact");
        String deliveryDate = request.getParameter("deliveryDate");

        Item newItem = new Item(itemName, price, itemId, category, "", supplierName, supplierContact, quantity);

        ItemCatalog catalog = new ItemCatalog();

        try {
            catalog.saveItem(newItem);


            response.sendRedirect("ItemsListServlet");

        } catch (IOException e) {

            response.sendRedirect("AddItems.jsp?message=Error+adding+item!&type=error");
        }
    }
}
