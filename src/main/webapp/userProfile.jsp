<%--
  Created by IntelliJ IDEA.
  User: Dulmi Madusha
  Date: 5/16/2025
  Time: 6:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Profile | Inventory Pro</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 font-sans">

<!-- Top Navbar -->
<header class="bg-blue-600 text-white shadow">
    <div class="max-w-7xl mx-auto px-6 py-4 flex justify-between items-center">
        <h1 class="text-2xl font-bold">Inventory Pro</h1>
        <nav class="space-x-4">
            <a href="dashboard.jsp" class="hover:underline">Dashboard</a>
            <a href="inventory.jsp" class="hover:underline">Inventory</a>
            <a href="userProfile.jsp" class="underline font-semibold">Profile</a>
            <a href="logout.jsp" class="hover:underline">Logout</a>
        </nav>
    </div>
</header>

<!-- Profile Section -->
<section class="max-w-6xl mx-auto mt-10 bg-white rounded-lg shadow-md p-8 grid grid-cols-1 md:grid-cols-3 gap-6">

    <!-- Left: Avatar and Buttons -->
    <div class="flex flex-col items-center text-center">
        <img src="<%= request.getContextPath() %>/static/images/avatar.png" alt="User Avatar" class="w-32 h-32 rounded-full border-4 border-blue-600 shadow-md mb-4" />
        <h2 class="text-xl font-semibold mb-2">Welcome, <%= request.getAttribute("fullName") %>!</h2>

        <div class="space-y-3 w-full mt-4">
            <a href="editProfile.jsp" class="block bg-blue-600 hover:bg-blue-700 text-white py-2 px-4 rounded w-full">Edit Profile</a>
            <a href="resetPassword.jsp" class="block bg-yellow-500 hover:bg-yellow-600 text-white py-2 px-4 rounded w-full">Reset Password</a>
            <a href="test.jsp" class="block bg-red-600 hover:bg-red-700 text-white py-2 px-4 rounded w-full">Logout</a>
        </div>
    </div>

    <!-- Right: User Info -->
    <div class="md:col-span-2">
        <h3 class="text-2xl font-bold mb-4 text-gray-800">My Profile</h3>
        <table class="w-full text-left border border-gray-200 bg-white shadow-sm rounded">
            <tr class="border-b">
                <th class="p-3 text-gray-600">Full Name</th>
                <td class="p-3 text-gray-800 font-medium"><%= request.getAttribute("fullName") %></td>
            </tr>
            <tr class="border-b">
                <th class="p-3 text-gray-600">Email Address</th>
                <td class="p-3 text-gray-800 font-medium"><%= request.getAttribute("email") %></td>
            </tr>
            <tr class="border-b">
                <th class="p-3 text-gray-600">Role</th>
                <td class="p-3 text-gray-800 font-medium"><%= request.getAttribute("role") %></td>
            </tr>
            <tr class="border-b">
                <th class="p-3 text-gray-600">Contact No</th>
                <td class="p-3 text-gray-800 font-medium"><%= request.getAttribute("phone") %></td>
            </tr>
            <tr>
                <th class="p-3 text-gray-600">Gender</th>
                <td class="p-3 text-gray-800 font-medium"><%= request.getAttribute("gender") %></td>
            </tr>
        </table>

        <!-- Delete Button -->
        <form action="deleteAccount" method="post" class="mt-6">
            <button type="submit" onclick="return confirm('Are you sure you want to delete your account?');"
                    class="bg-red-500 hover:bg-red-600 text-white px-4 py-2 rounded">
                Delete My Account
            </button>
        </form>
    </div>
</section>

</body>
</html>