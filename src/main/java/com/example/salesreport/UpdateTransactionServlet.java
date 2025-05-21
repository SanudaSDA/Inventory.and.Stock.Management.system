package com.example.salesreport;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

//Servlet that handles POST requests to update an existing transaction.
//This servlet assumes that a list of Transaction objects is stored in the ServletContext.
@WebServlet("/updateTransaction")
public class UpdateTransactionServlet extends HttpServlet {

    //Handles POST requests to update a transaction's details (quantity, revenue, margin).
    //It identifies the transaction using its date and category (or later with a unique ID).

    @SuppressWarnings("unchecked")
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // // Retrieve the shared transaction list from the application context (ServletContext)
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
