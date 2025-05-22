package com.example.salesreport;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

//servlet handles POST requests sent to the URL /updateTransaction.
// It updates an existing Transaction like editing  then save the updated list and redirect the user back to the dashboard.

//tells Java web server that this servlet should handle requests sent to /updateTransaction.
@WebServlet("/updateTransaction")
public class UpdateTransactionServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get transactions from ServletContext
        List<Transaction> transactions =
                (List<Transaction>) getServletContext().getAttribute("transactions");

        try {
            // Parse(convert a String into another data type) form data( Get form data from the request)
            int id = Integer.parseInt(request.getParameter("id"));
            String date = request.getParameter("date");
            String category = request.getParameter("category");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            double revenue = Double.parseDouble(request.getParameter("revenue"));
            double margin = Double.parseDouble(request.getParameter("margin"));

            // find and Update the transaction
            for (Transaction tx : transactions) {
                if (tx.getId() == id) {
                    tx.setDate(date);
                    tx.setCategory(category);
                    tx.setQuantity(quantity);
                    tx.setRevenue(revenue);
                    tx.setMargin(margin);
                    break;
                }
            }



        } catch (Exception e) {
            //Show the full error and where it occurred
            e.printStackTrace();
            request.getSession().setAttribute("error", "Update failed: " + e.getMessage());
        }

        // Redirect back to dashboard
        FileStorageHelper.saveTransactions(transactions);
        response.sendRedirect("dashboard");
    }
}