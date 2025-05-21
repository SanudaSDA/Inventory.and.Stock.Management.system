<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.inventoryandstockmanagementsystem.entities.Item" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Inventory Management</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
  <style>
    .title {
      font-size: 1.5rem;
      font-weight: bold;
      text-align: center;
      margin: 20px 0;
    }
    .card-header {
      font-size: 1rem;
      font-weight: bold;
    }
    .btn-blue {
      background-color: #0dcaf0;
      color: white;
    }
    .btn-delete {
      background-color: #dc3545;
      color: white;
    }
  </style>
</head>
<body>
<div class="container py-4">

  <!-- Update Stock Form Card -->
  <div class="card mb-4">
    <div class="card-header bg-info text-white">
      <i class="bi bi-pencil-square me-2"></i>Update Stock Dates
    </div>
    <div class="card-body">
      <form id="updateStockForm" action="UpdateStockServlet" method="post">
        <div class="mb-3">
          <label class="form-label">Enter Product ID</label>
          <input type="text" id="productId" name="productId" class="form-control" required>
        </div>

        <div class="mb-3">
          <label class="form-label">New Delivery Date</label>
          <input type="date" id="deliveryDate" name="deliveryDate" class="form-control" required>
        </div>

        <div class="mb-3">
          <label class="form-label">New Expiry Date</label>
          <input type="date" id="expiryDate" name="expiryDate" class="form-control" required>
        </div>

        <button type="submit" class="btn btn-blue">
          <i class="bi bi-arrow-clockwise me-1"></i>Update Stock
        </button>
      </form>
    </div>
  </div>

  <!-- Inventory Table -->
  <div class="card">
    <div class="card-header bg-dark text-white">
      <i class="bi bi-table me-2"></i>Current Inventory (Sorted by Expiry Date)
    </div>
    <div class="card-body">
      <div class="table-responsive">
        <table class="table table-hover">
          <thead class="table-dark">
          <tr>
            <th>Product Name</th>
            <th>Code</th>
            <th>Stock</th>
            <th>Price</th>
            <th>Value</th>
            <th>Delivery Date</th>
            <th>Expiry Date</th>
            <th>Action</th>
          </tr>
          </thead>
          <tbody>
          <%
            Item[] itemArray = (Item[]) request.getAttribute("items");
            if (itemArray != null && itemArray.length > 0) {
              for (Item item : itemArray) {
          %>
          <tr>
            <td><%= item.getName() %></td>
            <td><%= item.getItemId() %></td>
            <td><%= item.getQuantity() %></td>
            <td>Rs. <%= String.format("%.2f", item.getPrice()) %></td>
            <td>Rs. <%= String.format("%.2f", item.getQuantity() * item.getPrice()) %></td>
            <td><%= item.getDescription() %></td> <!-- deliveryDate -->
            <td><%= item.getExpiryDate() %></td>
            <td>
              <form action="DeleteItemServlet" method="post" onsubmit="return confirm('Are you sure you want to delete this item?')">
                <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                <button type="submit" class="btn btn-delete btn-sm">
                  <i class="bi bi-trash"></i> Delete
                </button>
              </form>
            </td>
          </tr>
          <%
            }
          } else {
          %>
          <tr><td colspan="8" class="text-center">No items found in inventory.</td></tr>
          <%
            }
          %>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
