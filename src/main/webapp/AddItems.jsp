<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Inventory Item</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-blue-50 min-h-screen flex items-center justify-center p-6">

<div class="bg-white shadow-xl rounded-2xl w-full max-w-xl p-8">
    <h1 class="text-3xl font-bold text-blue-700 mb-6 text-center">Add New Inventory Item</h1>

    <%-- Display message if available --%>
    <%
        String message = request.getParameter("message");
        String messageType = request.getParameter("type");
        if (message != null && !message.isEmpty()) {
    %>
    <div class="p-4 mb-6 rounded-lg text-sm
            <%= "error".equals(messageType) ? "bg-red-100 text-red-800" : "bg-green-100 text-green-800" %>">
        <%= message %>
    </div>
    <% } %>

    <form action="AddItemServlet" method="post" class="space-y-5">

        <div>
            <label for="itemId" class="block font-semibold text-gray-700 mb-1">Item ID</label>
            <input type="text" id="itemId" name="itemId" required
                   class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:ring-2 focus:ring-blue-500 focus:outline-none">
        </div>

        <div>
            <label for="itemName" class="block font-semibold text-gray-700 mb-1">Item Name</label>
            <input type="text" id="itemName" name="itemName" required
                   class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:ring-2 focus:ring-blue-500 focus:outline-none">
        </div>

        <div>
            <label for="category" class="block font-semibold text-gray-700 mb-1">Category</label>
            <input type="text" id="category" name="category" required
                   class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:ring-2 focus:ring-blue-500 focus:outline-none">
        </div>

        <div>
            <label for="quantity" class="block font-semibold text-gray-700 mb-1">Quantity in Stock</label>
            <input type="number" id="quantity" name="quantity" min="0" required
                   class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:ring-2 focus:ring-blue-500 focus:outline-none">
        </div>

        <div>
            <label for="price" class="block font-semibold text-gray-700 mb-1">Price per Unit (Rs)</label>
            <input type="number" id="price" name="price" min="0" step="0.01" required
                   class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:ring-2 focus:ring-blue-500 focus:outline-none">
        </div>

        <div>
            <label for="supplierName" class="block font-semibold text-gray-700 mb-1">Supplier Name</label>
            <input type="text" id="supplierName" name="supplierName" required
                   class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:ring-2 focus:ring-blue-500 focus:outline-none">
        </div>

        <div>
            <label for="supplierContact" class="block font-semibold text-gray-700 mb-1">Supplier Contact</label>
            <input type="text" id="supplierContact" name="supplierContact" required
                   class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:ring-2 focus:ring-blue-500 focus:outline-none">
        </div>

        <div>
            <label for="deliveryDate" class="block font-semibold text-gray-700 mb-1">Delivery Date</label>
            <%
                java.time.LocalDate today = java.time.LocalDate.now();
                String todayStr = today.format(java.time.format.DateTimeFormatter.ofPattern("yyyy-MM-dd"));
            %>
            <input type="date" id="deliveryDate" name="deliveryDate" value="<%= todayStr %>" required
                   class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:ring-2 focus:ring-blue-500 focus:outline-none">
        </div>

        <button type="submit"
                class="w-full bg-blue-600 text-white py-2 rounded-lg hover:bg-blue-700 transition duration-300">
            Add Item to Inventory
        </button>

    </form>
</div>

</body>
</html>
