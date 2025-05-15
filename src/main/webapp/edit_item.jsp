<%@ page import="com.example.inventoryandstockmanagementsystem.entities.Item" %>
<%@ page import="com.example.inventoryandstockmanagementsystem.utils.ItemCatalog" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String itemId = request.getParameter("id");
  ItemCatalog catalog = new ItemCatalog();
  Item selectedItem = null;

  for (Item item : catalog.getAllItems()) {
    if (item.getItemId().equals(itemId)) {
      selectedItem = item;
      break;
    }
  }

  if (selectedItem == null) {
    response.sendRedirect("ItemsListServlet?message=Item+not+found!&type=error");
    return;
  }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Edit Item</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 p-8">

<div class="max-w-lg mx-auto bg-white p-6 rounded-lg shadow">
  <h2 class="text-2xl font-bold mb-6 text-blue-700">Edit Item</h2>
  <form action="EditItemServlet" method="post" class="space-y-4">
    <input type="hidden" name="itemId" value="<%= selectedItem.getItemId() %>">

    <div>
      <label class="block text-sm font-medium text-gray-700">Product Name</label>
      <input type="text" name="itemName" value="<%= selectedItem.getName() %>" class="w-full border p-2 rounded">
    </div>

    <div>
      <label class="block text-sm font-medium text-gray-700">Category</label>
      <input type="text" name="category" value="<%= selectedItem.getCategory() %>" class="w-full border p-2 rounded">
    </div>

    <div>
      <label class="block text-sm font-medium text-gray-700">Quantity</label>
      <input type="number" name="quantity" value="<%= selectedItem.getQuantity() %>" class="w-full border p-2 rounded">
    </div>

    <div>
      <label class="block text-sm font-medium text-gray-700">Price(Rs)</label>
      <input type="number" step="0.01" name="price" value="<%= selectedItem.getPrice() %>" class="w-full border p-2 rounded">
    </div>

    <div class="flex justify-end gap-4">
      <a href="ItemsListServlet" class="px-4 py-2 bg-gray-500 text-white rounded hover:bg-gray-600">Cancel</a>
      <button type="submit" class="px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700">Update</button>
    </div>
  </form>
</div>

</body>
</html>
