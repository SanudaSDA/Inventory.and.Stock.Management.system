package com.example.salesreport;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.List;
//Reads transaction data from memory (stored in ServletContext)
//Calculates sales statistics (total, average, count, etc.)
//Sends the data to a JSP page (sales.jsp) to be displayed to the user

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


    //Gets the list of transactions from the shared ServletContext, initialized by  DataStoreServlet
        List<Transaction> transactions = (List<Transaction>)getServletContext().getAttribute("transactions");


        //Java Streams to calculate total revenue by summing the revenue of each transaction
        double totalSales = transactions.stream().mapToDouble(Transaction::getRevenue).sum();
        double avgTransaction = totalSales / transactions.size();
        int transactionCount = transactions.size();
        double revenueGrowth = 5.2; // Optional: dynamic logic later

        //attach the calculated values to the request so they can be accessed in the JSP page
        request.setAttribute("transactions", transactions);
        request.setAttribute("totalSales", totalSales);
        request.setAttribute("avgTransaction", avgTransaction);
        request.setAttribute("transactionCount", transactionCount);
        request.setAttribute("revenueGrowth", revenueGrowth);

        RequestDispatcher dispatcher = request.getRequestDispatcher("sales.jsp");
        dispatcher.forward(request, response);
    }
}
