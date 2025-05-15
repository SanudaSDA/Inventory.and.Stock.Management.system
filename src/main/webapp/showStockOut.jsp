<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stock Out Management</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body class="bg-gray-50">
<div class="container mx-auto px-4 py-8">
    <h1 class="text-3xl font-bold text-gray-800 mb-8">Stock Out Management</h1>
<%--test--%>
    <div class="bg-white p-6 rounded-lg shadow-lg overflow-hidden w-full">
        <div class="flex justify-between items-center mb-6">
            <h2 class="text-xl font-semibold">Stock Out Items</h2>
            <div class="flex space-x-4">
                <input type="text" placeholder="Search items..." class="rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500">
                <button class="px-4 py-2 bg-green-600 text-white rounded-md hover:bg-green-700">
                    <i class="fas fa-file-export mr-2"></i>Export
                </button>
                <button onclick="window.location.href='ItemsListServlet'"
                        class="px-4 py-2 bg-green-600 text-white rounded-md hover:bg-green-700">
                    📦Inventory
                </button>
            </div>
        </div>

        <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-gray-200">
                <thead class="bg-gray-50">
                <tr>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Item ID</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Item Name</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Quantity</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Price</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Receiver</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Date</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Action</th>
                </tr>
                </thead>
                <tbody>
                <%
                    String filePath = "C:/Users/User/Desktop/neeeeeew/data/StockOutRecords.txt";
                    File file = new File(filePath);
                    if (file.exists()) {
                        BufferedReader br = new BufferedReader(new FileReader(file));
                        String line;
                        while ((line = br.readLine()) != null) {
                            String[] data = line.split(",");
                %>
                <tr class="border-t">
                    <td class="px-4 py-2"><%= data[0] %></td>
                    <td class="px-4 py-2"><%= data[1] %></td>
                    <td class="px-4 py-2"><%= data[2] %></td>
                    <td class="px-4 py-2"><%= data[3] %></td>
                    <td class="px-4 py-2"><%= data[4] %></td>
                    <td class="px-4 py-2"><%= data[7] %></td>
                    <td class="px-4 py-2">
                        <form action="DeleteStockOut" method="post" onsubmit="return confirm('Are you sure you want to delete this record?');">
                            <input type="hidden" name="itemId" value="<%= data[0] %>">
                            <button type="submit" class="bg-red-500 text-white px-3 py-1 rounded">Delete</button>
                        </form>
                    </td>
                </tr>
                <%
                        }
                        br.close();
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
