//loads data on start up
package com.example.salesreport;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;

import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "DataStoreServlet", urlPatterns = {}, loadOnStartup = 1)
public class DataStoreServlet extends HttpServlet {
    @Override
    public void init() throws ServletException {
        List<Transaction> transactions = FileStorageHelper.loadTransactions();

        transactions.add(new Transaction("2023-05-01", "Electronics", 20, 5000.0, 1200.0, 1));
        transactions.add(new Transaction("2023-05-03", "Clothing", 35, 3000.0, 800.0, 2));
        transactions.add(new Transaction("2023-05-06", "Home & Kitchen", 15, 2500.0, 600.0, 3));
        transactions.add(new Transaction("2023-05-10", "Sports", 10, 1800.0, 400.0, 4));
        transactions.add(new Transaction("2023-05-12", "Books", 25, 1200.0, 300.0, 5));

        getServletContext().setAttribute("transactions", transactions);

    }
}