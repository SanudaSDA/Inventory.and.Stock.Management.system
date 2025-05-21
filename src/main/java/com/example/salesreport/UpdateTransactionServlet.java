//it updates the in-memory list and redirects back.
package com.example.salesreport;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/updateTransaction")
public class UpdateTransactionServlet extends HttpServlet {

    @SuppressWarnings("unchecked")
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Transaction> transactions = (List<Transaction>) getServletContext().getAttribute("transactions");

        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String date = request.getParameter("date");
            String category = request.getParameter("category");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            double revenue = Double.parseDouble(request.getParameter("revenue"));
            double margin = Double.parseDouble(request.getParameter("margin"));

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
            e.printStackTrace();
        }

        response.sendRedirect("dashboard");
    }
}
