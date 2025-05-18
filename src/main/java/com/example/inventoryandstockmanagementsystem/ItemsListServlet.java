package com.example.inventoryandstockmanagementsystem;

import com.example.inventoryandstockmanagementsystem.entities.Item;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import com.example.inventoryandstockmanagementsystem.utils.ItemCatalog;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/ItemsListServlet")
public class ItemsListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        ItemCatalog catalog = new ItemCatalog();
        List<Item> items = catalog.getAllItems();
        request.setAttribute("itemsList", items);
        request.getRequestDispatcher("ItemsLists.jsp").forward(request, response);
    }
}
