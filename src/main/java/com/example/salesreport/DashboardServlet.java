//loads data and forwards to JSP
//it reads from ServletContext(data store), calculates stats, and forwards to JSP.
package com.example.salesreport;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

import java.io.IOException;
import java.util.List;


@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {



        List<Transaction> transactions = (List<Transaction>)getServletContext().getAttribute("transactions");



        double totalSales = transactions.stream().mapToDouble(Transaction::getRevenue).sum();
        double avgTransaction = totalSales / transactions.size();
        int transactionCount = transactions.size();
        double revenueGrowth = 5.2; // Optional: dynamic logic later

        request.setAttribute("transactions", transactions);
        request.setAttribute("totalSales", totalSales);
        request.setAttribute("avgTransaction", avgTransaction);
        request.setAttribute("transactionCount", transactionCount);
        request.setAttribute("revenueGrowth", revenueGrowth);

        RequestDispatcher dispatcher = request.getRequestDispatcher("sales.jsp");
        dispatcher.forward(request, response);
    }
}
