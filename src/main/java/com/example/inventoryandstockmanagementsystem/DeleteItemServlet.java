package com.example.inventoryandstockmanagementsystem;

import com.example.inventoryandstockmanagementsystem.utils.ItemCatalog;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/DeleteItemServlet")
public class DeleteItemServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String itemId = request.getParameter("id");

        if (itemId == null || itemId.trim().isEmpty()) {
            // No id provided, redirect with error message
            response.sendRedirect("ItemsListServlet?message=Missing+item+ID!&type=error");
            return;
        }

        ItemCatalog catalog = new ItemCatalog();

        try {
            catalog.deleteItem(itemId);
            response.sendRedirect("ItemsListServlet?message=Item+deleted+successfully&type=success");
        } catch (IOException e) {
            e.printStackTrace();
            response.sendRedirect("ItemsListServlet?message=Error+deleting+item!&type=error");
        }
    }
}
