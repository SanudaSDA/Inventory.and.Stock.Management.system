package com.example.inventoryandstockmanagementsystem;

import java.io.*;
import java.util.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/showStockOut")
public class ShowStockOutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<String[]> stockOutList = new ArrayList<>();
        BufferedReader reader = new BufferedReader(new FileReader("C:/Users/User/Desktop/neeeeeew/data/StockOut.txt"));
        String line;
        while ((line = reader.readLine()) != null) {
            stockOutList.add(line.split(","));
        }
        reader.close();

        request.setAttribute("stockOutList", stockOutList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("showStockOut.jsp");
        dispatcher.forward(request, response);
    }
}
