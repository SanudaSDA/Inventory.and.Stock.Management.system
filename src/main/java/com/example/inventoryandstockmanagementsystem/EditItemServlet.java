package com.example.inventoryandstockmanagementsystem;

import com.example.inventoryandstockmanagementsystem.entities.Item;
import com.example.inventoryandstockmanagementsystem.utils.ItemCatalog;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
@WebServlet("/EditItemServlet")
public class EditItemServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String itemId = request.getParameter("itemId");
        ItemCatalog catalog = new ItemCatalog();
        Item existingItem = catalog.findItemById(itemId);

        if (existingItem == null) {
            response.sendRedirect("ItemsListServlet?message=Item+not+found&type=error");
            return;
        }

        String itemName = request.getParameter("itemName");
        String category = request.getParameter("category");
        String description = request.getParameter("description");
        String supplierName = request.getParameter("supplierName");
        String supplierContact = request.getParameter("supplierContact");

        int quantity = existingItem.getQuantity();
        double price = existingItem.getPrice();

        try {
            String quantityStr = request.getParameter("quantity");
            if (quantityStr != null && !quantityStr.trim().isEmpty()) {
                quantity = Integer.parseInt(quantityStr);
            }

            String priceStr = request.getParameter("price");
            if (priceStr != null && !priceStr.trim().isEmpty()) {
                price = Double.parseDouble(priceStr);
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("EditItemForm.jsp?itemId=" + itemId + "&error=Invalid+number+format");
            return;
        }


        if (itemName != null && !itemName.trim().isEmpty()) existingItem.setName(itemName);
        if (category != null && !category.trim().isEmpty()) existingItem.setCategory(category);
        if (description != null && !description.trim().isEmpty()) existingItem.setDescription(description);
        if (supplierName != null && !supplierName.trim().isEmpty()) existingItem.setSupplierName(supplierName);
        if (supplierContact != null && !supplierContact.trim().isEmpty()) existingItem.setSupplierContact(supplierContact);

        existingItem.setQuantity(quantity);
        existingItem.setPrice(price);

        try {
            catalog.editItem(existingItem);
            response.sendRedirect("ItemsListServlet?message=Item+updated+successfully&type=success");
        } catch (IOException e) {
            e.printStackTrace();
            response.sendRedirect("EditItemForm.jsp?itemId=" + itemId + "&error=Failed+to+update+item");
        }
    }
}
