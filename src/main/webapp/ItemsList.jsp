<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.inventoryandstockmanagementsystem.entities.Item" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Inventory Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="<%= request.getContextPath() %>/css/thailand.css" rel="stylesheet">
</head>
<body class="bg-gray-50">

<div class="container mx-auto px-4 py-8">

    <!-- Header -->
    <div class="flex flex-col md:flex-row justify-between items-center mb-8">
        <h1 class="text-4xl font-bold text-blue-800">Inventory </h1>
        <div class="flex gap-4 mt-4 md:mt-0">
            <!-- Stock Management Button -->
            <button onclick="window.location.href='stockManage.jsp'"
                    class="bg-blue-600 hover:bg-blue-700 text-white px-5 py-2 rounded-lg flex items-center gap-2">
                📦 Stock Management
            </button>

            <!-- Supplier Details Button -->
            <button onclick="window.location.href='SupplierDetailsServlet'"
                    class="bg-green-600 hover:bg-green-700 text-white px-5 py-2 rounded-lg flex items-center gap-2">
                📇 Supplier Details
            </button>
        </div>
    </div>

    <!-- Product List Table -->
    <div class="overflow-x-auto bg-white rounded-lg shadow">
        <table class="min-w-full divide-y divide-gray-300">
            <thead class="bg-blue-100">
            <tr>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase">Product ID</th>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase">Product Name</th>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase">Stock</th>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase">Price</th>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase">Category</th>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase">Actions</th>
            </tr>
            </thead>
            <tbody class="bg-white divide-y divide-gray-200">
            <%
                List<Item> products = (List<Item>) request.getAttribute("itemsList");
                if (products != null && !products.isEmpty()) {
                    for (Item product : products) {
            %>
            <tr>
                <td class="px-6 py-4"><%= product.getItemId() %></td>
                <td class="px-6 py-4"><%= product.getName() %></td>
                <td class="px-6 py-4"><%= product.getQuantity() %></td>
                <td class="px-6 py-4">Rs<%= product.getPrice() %></td>
                <td class="px-6 py-4"><%= product.getCategory() %></td>
                <td class="px-6 py-4 flex gap-3">
                    <a href="edit_item.jsp?id=<%= product.getItemId() %>"
                       class="text-yellow-600 hover:text-yellow-700 font-semibold">Edit</a>
                    <a href="DeleteItemServlet?id=<%= product.getItemId() %>"
                       class="text-red-600 hover:text-red-700 font-semibold"
                       onclick="return confirm('Are you sure you want to delete this item?');">Delete</a>
                </td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="6" class="px-6 py-4 text-center text-gray-500">No products available.</td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>


</div>
</body>
</html>
