<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.example.salesreport.Transaction" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sales Report Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <script>
        function toggleEditForm(id) {
            const form = document.getElementById('edit-form-' + id);
            form.classList.toggle('hidden');
        }
    </script>
</head>
<body class="bg-gray-50 font-[Inter]">
<div class="min-h-screen p-4 md:p-8">
    <!-- Header -->
    <header class="flex flex-col md:flex-row items-center justify-between mb-8 gap-4">
        <div class="flex items-center gap-4">
            <img src="https://images.unsplash.com/photo-1614119068601-483274e9dcb7" alt="Company Logo" class="w-12 h-12 rounded-lg object-cover">
            <div>
                <h1 class="text-2xl font-bold text-gray-800">Sales Report</h1>
                <p class="text-gray-600">Monthly Performance Overview</p>
            </div>
        </div>
        <div class="flex gap-4">
            <select class="px-4 py-2 border rounded-lg bg-white">
                <option>Last 7 days</option>
                <option>Last 30 days</option>
                <option>Last 90 days</option>
            </select>
            <select class="px-4 py-2 border rounded-lg bg-white">
                <option>All Categories</option>
                <option>Electronics</option>
                <option>Clothing</option>
                <option>Accessories</option>
            </select>
        </div>
    </header>

    <!-- KPIs -->
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
        <div class="bg-white p-6 rounded-xl shadow-sm hover:shadow-md transition-shadow">
            <p class="text-gray-600 mb-1">Total Sales</p>
            <h3 class="text-2xl font-bold text-gray-800">
                $<%= request.getAttribute("totalSales") != null ? request.getAttribute("totalSales") : "0" %>
            </h3>
            <span class="text-green-500 text-sm font-medium">+12.5%</span>
        </div>
        <div class="bg-white p-6 rounded-xl shadow-sm hover:shadow-md transition-shadow">
            <p class="text-gray-600 mb-1">Avg Transaction</p>
            <h3 class="text-2xl font-bold text-gray-800">
                $<%= request.getAttribute("avgTransaction") != null ? request.getAttribute("avgTransaction") : "0" %>
            </h3>
            <span class="text-red-500 text-sm font-medium">-2.3%</span>
        </div>
        <div class="bg-white p-6 rounded-xl shadow-sm hover:shadow-md transition-shadow">
            <p class="text-gray-600 mb-1">Transactions</p>
            <h3 class="text-2xl font-bold text-gray-800">
                <%= request.getAttribute("transactionCount") != null ? request.getAttribute("transactionCount") : "0" %>
            </h3>
            <span class="text-green-500 text-sm font-medium">+5.4%</span>
        </div>
        <div class="bg-white p-6 rounded-xl shadow-sm hover:shadow-md transition-shadow">
            <p class="text-gray-600 mb-1">Revenue Growth</p>
            <h3 class="text-2xl font-bold text-gray-800">
                <%= request.getAttribute("revenueGrowth") != null ? request.getAttribute("revenueGrowth") : "0" %>%</h3>
            <span class="text-green-500 text-sm font-medium">+3.1%</span>
        </div>
    </div>

    <!-- Table -->
    <div class="bg-white rounded-xl shadow-sm overflow-hidden mb-8">
        <div class="p-4 border-b border-gray-200 flex justify-between items-center">
            <h2 class="text-lg font-semibold text-gray-800">Sales Summary</h2>
            <input type="text" placeholder="Search transactions..." class="px-4 py-2 border rounded-lg">
        </div>
        <div class="overflow-x-auto">
            <table class="w-full">
                <thead class="bg-gray-50">
                <tr>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Date</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Category</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Quantity</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Revenue</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Margin</th>
                    <th class="px-6 py-3"></th>
                </tr>
                </thead>
                <tbody class="divide-y divide-gray-200">
                <%
                    List<Transaction> transactions = (List<Transaction>) request.getAttribute("transactions");
                    if (transactions != null) {
                        for (Transaction tx : transactions) {
                %>
                <!-- Display Row -->
                <tr class="hover:bg-gray-50 transition-colors">
                    <td class="px-6 py-4 text-sm text-gray-600"><%= tx.getDate() %></td>
                    <td class="px-6 py-4 text-sm text-gray-600"><%= tx.getCategory() %></td>
                    <td class="px-6 py-4 text-sm text-gray-600"><%= tx.getQuantity() %></td>
                    <td class="px-6 py-4 text-sm text-gray-600">$<%= tx.getRevenue() %></td>
                    <td class="px-6 py-4 text-sm text-green-600"><%= tx.getMargin() %>%</td>
                    <td class="px-6 py-4 text-right text-sm">
                        <button onclick="toggleEditForm('<%= tx.getId() %>')" class="text-blue-600 hover:underline">Edit</button>
                    </td>
                </tr>

                <!-- Edit Form Row (Initially Hidden) -->
                <tr id="edit-form-<%= tx.getId() %>" class="hidden bg-blue-50">
                    <td colspan="6" class="p-4">
                        <form action="updateTransaction" method="post" class="grid grid-cols-6 gap-4">
                            <input type="hidden" name="id" value="<%= tx.getId() %>">
                            <input type="text" name="date" value="<%= tx.getDate() %>" class="col-span-1 border px-2 py-1 rounded">
                            <input type="text" name="category" value="<%= tx.getCategory() %>" class="col-span-1 border px-2 py-1 rounded">
                            <input type="number" name="quantity" value="<%= tx.getQuantity() %>" class="col-span-1 border px-2 py-1 rounded">
                            <input type="number" name="revenue" value="<%= tx.getRevenue() %>" step="0.01" class="col-span-1 border px-2 py-1 rounded">
                            <input type="number" name="margin" value="<%= tx.getMargin() %>" step="0.01" class="col-span-1 border px-2 py-1 rounded">
                            <button type="submit" class="col-span-1 bg-blue-600 text-white px-3 py-1 rounded hover:bg-blue-700">Save</button>
                        </form>
                    </td>
                </tr>
                <%
                        }
                    }
                %>
                </tbody>
            </table>
        </div>
        <div class="p-4 border-t border-gray-200 flex justify-between items-center">
            <p class="text-sm text-gray-600">
                Showing <%= (transactions != null) ? transactions.size() : 0 %> entries
            </p>
            <div class="flex gap-2">
                <button class="px-4 py-2 border rounded-lg hover:bg-gray-50">Previous</button>
                <button class="px-4 py-2 border rounded-lg hover:bg-gray-50">Next</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
