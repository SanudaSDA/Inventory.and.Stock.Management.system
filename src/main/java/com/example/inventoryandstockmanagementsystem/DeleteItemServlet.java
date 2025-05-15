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

        ItemCatalog catalog = new ItemCatalog();

        try {
            catalog.deleteItem(itemId);
            response.sendRedirect("ItemsListServlet");
        } catch (IOException e) {
            e.printStackTrace();
            response.sendRedirect("ItemsListServlet?message=Error+deleting+item!&type=error");
        }
    }
}
