package com.example.inventoryandstockmanagementsystem;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/StockOut")
public class StockOutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String itemId = request.getParameter("itemId");
        String itemName = request.getParameter("itemName");
        String quantity = request.getParameter("quantity");
        String pricePerUnit = request.getParameter("pricePerUnit");
        String totalPrice = request.getParameter("totalPrice");
        String receiverName = request.getParameter("receiverName");
        String department = request.getParameter("department");
        String contactNumber = request.getParameter("contactNumber");
        String stockOutDate = request.getParameter("stockOutDate");

        // Save the stock out record
        File stockOutFile = new File("C:/Users/User/Desktop/neeeeeew/data/StockOutRecords.txt");
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(stockOutFile, true))) {
            writer.write(itemId + "," + itemName + "," + quantity + "," + pricePerUnit + "," + receiverName + "," + department + "," + contactNumber + "," + stockOutDate + "\n");
        }

        // Update stock quantity in item.txt
        File itemFile = new File("C:/Users/User/Desktop/neeeeeew/data/item.txt");
        File tempFile = new File("C:/Users/User/Desktop/neeeeeew/data/Temp.txt");

        try (BufferedReader reader = new BufferedReader(new FileReader(itemFile));
             BufferedWriter writer = new BufferedWriter(new FileWriter(tempFile))) {

            String line;
            while ((line = reader.readLine()) != null) {
                String[] itemData = line.split("\\|");  // split using |

                if (itemData.length > 7 && itemData[2].equals(itemId)) {
                    int currentStock = Integer.parseInt(itemData[7]);
                    int stockOutQty = Integer.parseInt(quantity);

                    if (stockOutQty > currentStock) {
                        stockOutQty = currentStock; // prevent negative stock
                    }

                    int updatedStock = currentStock - stockOutQty;
                    itemData[7] = String.valueOf(updatedStock);
                }

                writer.write(String.join("|", itemData));
                writer.newLine();
            }
        }

        // Replace old item.txt with updated temp file
        if (itemFile.delete()) {
            tempFile.renameTo(itemFile);
        }

        // Redirect to the showStockOut.jsp page
        response.sendRedirect("showStockOut.jsp");
    }
}
