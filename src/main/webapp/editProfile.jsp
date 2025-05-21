<%--
  Created by IntelliJ IDEA.
  User: Dulmi Madusha
  Date: 5/16/2025
  Time: 6:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Profile | Inventory Pro</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 font-sans">

<div class="max-w-3xl mx-auto mt-10 bg-white shadow-md rounded-lg p-8">
    <h2 class="text-2xl font-bold text-blue-700 mb-6">Edit Profile</h2>

    <form action="editProfile" method="post" class="space-y-5">

        <div>
            <label for="fullName" class="block text-sm font-medium text-gray-700">Full Name</label>
            <input type="text" id="fullName" name="fullName" required
                   value="<%= request.getAttribute("fullName") != null ? request.getAttribute("fullName") : "" %>"
                   class="w-full px-4 py-2 border rounded-lg focus:ring-blue-500 focus:border-blue-500" />
        </div>

        <div>
            <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
            <input type="email" id="email" name="email" required
                   value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : "" %>"
                   class="w-full px-4 py-2 border rounded-lg focus:ring-blue-500 focus:border-blue-500" />
        </div>

        <div>
            <label for="phone" class="block text-sm font-medium text-gray-700">Phone Number</label>
            <input type="text" id="phone" name="phone"
                   value="<%= request.getAttribute("phone") != null ? request.getAttribute("phone") : "" %>"
                   class="w-full px-4 py-2 border rounded-lg focus:ring-blue-500 focus:border-blue-500" />
        </div>

        <div>
            <label for="gender" class="block text-sm font-medium text-gray-700">Gender</label>
            <select id="gender" name="gender"
                    class="w-full px-4 py-2 border rounded-lg focus:ring-blue-500 focus:border-blue-500">
                <option value="Male" <%= "Male".equals(request.getAttribute("gender")) ? "selected" : "" %>>Male</option>
                <option value="Female" <%= "Female".equals(request.getAttribute("gender")) ? "selected" : "" %>>Female</option>
                <option value="Other" <%= "Other".equals(request.getAttribute("gender")) ? "selected" : "" %>>Other</option>
            </select>
        </div>

        <div class="flex justify-end">
            <button type="submit" class="bg-blue-600 hover:bg-blue-700 text-white px-6 py-2 rounded-lg">
                Save Changes
            </button>
        </div>
    </form>
</div>

</body>
</html>
