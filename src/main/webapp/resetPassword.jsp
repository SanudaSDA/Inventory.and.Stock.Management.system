<%--
  Created by IntelliJ IDEA.
  User: Dulmi Madusha
  Date: 5/16/2025
  Time: 6:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Reset Password | Inventory Pro</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 font-sans">

<div class="max-w-xl mx-auto mt-10 bg-white shadow-md rounded-lg p-8">
  <h2 class="text-2xl font-bold text-blue-700 mb-6">Reset Password</h2>

  <% String error = (String) request.getAttribute("error"); if (error != null) { %>
  <div class="bg-red-100 text-red-700 p-3 rounded mb-4">
    <%= error %>
  </div>
  <% } %>

  <form action="resetPassword" method="post" class="space-y-5">

    <div>
      <label for="currentPassword" class="block text-sm font-medium text-gray-700">Current Password</label>
      <input type="password" id="currentPassword" name="currentPassword" required
             class="w-full px-4 py-2 border rounded-lg focus:ring-blue-500 focus:border-blue-500" />
    </div>

    <div>
      <label for="newPassword" class="block text-sm font-medium text-gray-700">New Password</label>
      <input type="password" id="newPassword" name="newPassword" required
             class="w-full px-4 py-2 border rounded-lg focus:ring-blue-500 focus:border-blue-500" />
    </div>

    <div>
      <label for="confirmPassword" class="block text-sm font-medium text-gray-700">Confirm New Password</label>
      <input type="password" id="confirmPassword" name="confirmPassword" required
             class="w-full px-4 py-2 border rounded-lg focus:ring-blue-500 focus:border-blue-500" />
    </div>

    <div class="flex justify-end">
      <button type="submit" class="bg-blue-600 hover:bg-blue-700 text-white px-6 py-2 rounded-lg">
        Update Password
      </button>
    </div>
  </form>
</div>

</body>
</html>

