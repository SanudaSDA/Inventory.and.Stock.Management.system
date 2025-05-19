package com.example.inventoryandstockmanagementsystem;

import com.example.inventoryandstockmanagementsystem.entities.Item;
import com.example.inventoryandstockmanagementsystem.utils.ItemCatalog;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.Stack;

@WebServlet("/SupplierDetailsServlet")
public class SupplierDetailsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ItemCatalog catalog = new ItemCatalog();
        Stack<Item> items = catalog.getAllItems();

        request.setAttribute("items", items);
        request.getRequestDispatcher("supplier_details.jsp").forward(request, response);
    }
}
