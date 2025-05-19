package com.example.salesreport;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.*;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
    private List<Transaction> transactions;

    @Override
    public void init() throws ServletException {
        // Dummy data for demo purposes
        transactions = new ArrayList<>();
        transactions.add(new Transaction(new Date(), "Electronics", 5, 2500.00, 20.5,1));
        transactions.add(new Transaction(new Date(), "Clothing", 10, 1000.00, 15.0,2));
        transactions.add(new Transaction(new Date(), "Accessories", 3, 600.00, 25.0,3));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        double totalSales = transactions.stream().mapToDouble(Transaction::getRevenue).sum();
        double avgTransaction = totalSales / transactions.size();
        int transactionCount = transactions.size();
        double revenueGrowth = 5.2; // Static or calculated value

        request.setAttribute("transactions", transactions);
        request.setAttribute("totalSales", totalSales);
        request.setAttribute("avgTransaction", avgTransaction);
        request.setAttribute("transactionCount", transactionCount);
        request.setAttribute("revenueGrowth", revenueGrowth);

        RequestDispatcher dispatcher = request.getRequestDispatcher("dashboard.jsp");
        dispatcher.forward(request, response);
    }
}
