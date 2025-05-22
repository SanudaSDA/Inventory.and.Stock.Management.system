//loads data on start up
package com.example.salesreport;

//creates transactions, then stores the list in the ServletContext so other servlets like DashboardServlet can access the shared data.

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;

import java.util.List;

@WebServlet(name = "DataStoreServlet", urlPatterns = {}, loadOnStartup = 1)
public class DataStoreServlet extends HttpServlet {
    @Override
    //hide complex internal details and show only essential behavior(init())
    public void init() throws ServletException {//Initializes transaction data
        List<Transaction> transactions = FileStorageHelper.loadTransactions();

        //creating and adding new Transaction objects to the list
        transactions.add(new Transaction("2023-05-01", "Electronics", 20, 5000.0, 1200.0, 1));
        transactions.add(new Transaction("2023-05-03", "Clothing", 35, 3000.0, 800.0, 2));
        transactions.add(new Transaction("2023-05-06", "Home & Kitchen", 15, 2500.0, 600.0, 3));
        transactions.add(new Transaction("2023-05-10", "Sports", 10, 1800.0, 400.0, 4));
        transactions.add(new Transaction("2023-05-12", "Books", 25, 1200.0, 300.0, 5));

        //Shares the data with other servlets
        getServletContext().setAttribute("transactions", transactions);

    }
}