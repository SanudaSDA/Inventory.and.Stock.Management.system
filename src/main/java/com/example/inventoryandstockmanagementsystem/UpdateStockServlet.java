package com.example.inventoryandstockmanagementsystem;

import com.example.inventoryandstockmanagementsystem.entities.Item;
import com.example.inventoryandstockmanagementsystem.utils.ItemCatalog;
import com.example.inventoryandstockmanagementsystem.utils.ItemStack;
import com.example.inventoryandstockmanagementsystem.utils.MergeSortUtil;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/UpdateStockServlet")
public class UpdateStockServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String productId = request.getParameter("productId");
        String deliveryDate = request.getParameter("deliveryDate");
        String expiryDate = request.getParameter("expiryDate");

        ItemCatalog catalog = new ItemCatalog();
        Item item = catalog.findItemById(productId);

        if (item != null) {
            // Update item details
            item.setDescription(deliveryDate); // Assuming description is used for delivery date
            item.setExpiryDate(expiryDate);
            item.setLastUpdated(LocalDate.now().toString());

            catalog.editItem(item);

            // Retrieve all items using the custom ItemStack
            ItemStack itemStack = catalog.loadStack();
            Item[] items = itemStack.getAll();

            // Sort items by expiry date
            MergeSortUtil.sortByExpiryDate(items, 0, items.length - 1);

            // Set attributes and forward to JSP
            request.setAttribute("items", items);
            request.setAttribute("message", "Stock updated successfully");
            request.setAttribute("type", "success");
            RequestDispatcher dispatcher = request.getRequestDispatcher("stockUpdate.jsp");
            dispatcher.forward(request, response);

        } else {
            // Item not found, forward with error message
            request.setAttribute("message", "Item not found");
            request.setAttribute("type", "error");
            RequestDispatcher dispatcher = request.getRequestDispatcher("stockUpdate.jsp");
            dispatcher.forward(request, response);
        }
    }
}
