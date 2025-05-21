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

            // Reload and display updated item list
            loadAndForwardItems(request, response, "Stock updated successfully", "success");

        } else {
            loadAndForwardItems(request, response, "Item not found", "error");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Allow redirect to this servlet from delete
        loadAndForwardItems(request, response, null, null);
    }

    private void loadAndForwardItems(HttpServletRequest request, HttpServletResponse response, String message, String type)
            throws ServletException, IOException {

        ItemCatalog catalog = new ItemCatalog();
        ItemStack itemStack = catalog.loadStack();
        Item[] items = itemStack.getAll();

        MergeSortUtil.sortByExpiryDate(items, 0, items.length - 1);

        request.setAttribute("items", items);

        if (message != null && type != null) {
            request.setAttribute("message", message);
            request.setAttribute("type", type);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("stockUpdate.jsp");
        dispatcher.forward(request, response);
    }
}

