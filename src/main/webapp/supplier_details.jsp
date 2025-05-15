<%@ page import="com.example.inventoryandstockmanagementsystem.entities.Item" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Supplier Details</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 p-8">

<div class="container mx-auto">
    <div class="flex justify-between items-center mb-6">
        <h1 class="text-3xl font-bold text-blue-700">Supplier Details</h1>
        <button onclick="window.location.href='ItemsListServlet'" class="bg-gray-500 hover:bg-gray-600 text-white px-6 py-2 rounded-lg">Back to Item List</button>
    </div>

    <div class="overflow-x-auto bg-white rounded-lg shadow">
        <table class="min-w-full divide-y divide-gray-300">
            <thead class="bg-blue-100">
            <tr>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase">Product ID</th>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase">Product Name</th>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase">Supplier Name</th>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase">Supplier Contact</th>

            </tr>
            </thead>
            <tbody class="bg-white divide-y divide-gray-200">
            <%
                List<Item> items = (List<Item>) request.getAttribute("items");
                for (Item item : items) {
            %>
            <tr>
                <td class="px-6 py-4"><%= item.getItemId() %></td>
                <td class="px-6 py-4"><%= item.getName() %></td>
                <td class="px-6 py-4"><%= item.getSupplierName() %></td>
                <td class="px-6 py-4"><%= item.getSupplierContact() %></td>

            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
