package com.example.salesreport;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

@WebServlet("/updateTransaction")
public class UpdateTransactionServlet extends HttpServlet {

    @SuppressWarnings("unchecked")
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // In a real app, you would retrieve the data from a database or shared memory
        List<Transaction> transactions = (List<Transaction>) getServletContext().getAttribute("transactions");

        try {
            String id = request.getParameter("id"); // Assuming we add ID support later
            String dateStr = request.getParameter("date");
            String category = request.getParameter("category");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            double revenue = Double.parseDouble(request.getParameter("revenue"));
            double margin = Double.parseDouble(request.getParameter("margin"));

            Date date = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy", Locale.ENGLISH).parse(dateStr);

            for (Transaction tx : transactions) {
                if (tx.getDate().equals(date) && tx.getCategory().equals(category)) { // Or use a unique ID
                    tx.setQuantity(quantity);
                    tx.setRevenue(revenue);
                    tx.setMargin(margin);
                    break;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("dashboard");
    }
}
