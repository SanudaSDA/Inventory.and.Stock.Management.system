package com.example.inventoryandstockmanagementsystem;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/DeleteStockOut")
public class DeleteStockOutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String itemIdToDelete = request.getParameter("itemId");

        File stockOutFile = new File("C:/Users/User/Desktop/neeeeeew/data/StockOutRecords.txt");
        File tempFile = new File("C:/Users/User/Desktop/neeeeeew/data/TempStockOut.txt");

        try (BufferedReader reader = new BufferedReader(new FileReader(stockOutFile));
             BufferedWriter writer = new BufferedWriter(new FileWriter(tempFile))) {

            String line;
            while ((line = reader.readLine()) != null) {
                if (!line.startsWith(itemIdToDelete + ",")) {
                    writer.write(line);
                    writer.newLine();
                }
            }
        }

        if (stockOutFile.delete()) {
            tempFile.renameTo(stockOutFile);
        }

        response.sendRedirect("showStockOut.jsp");
    }
}

