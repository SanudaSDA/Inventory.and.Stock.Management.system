<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard | Inventory Management</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>
<body class="bg-gray-100">

<section class="p-6 min-h-screen">

    <!-- Header -->
    <div class="mb-6 flex justify-between items-center">
        <div>
            <h2 class="text-3xl font-bold text-gray-800">📊 Dashboard Overview</h2>
            <p class="text-gray-500">Monitor key metrics and perform quick actions</p>
        </div>
        <button onclick="window.location.href='ItemListServlet'"
                class="bg-blue-600 hover:bg-blue-700 text-white py-2 px-4 rounded-lg shadow">
            <i class="fas fa-list mr-2"></i>View Item List
        </button>
    </div>

    <!-- Metrics -->
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 mb-10">
        <div class="bg-white rounded-xl shadow-lg p-6 flex items-center space-x-4 hover:scale-[1.02] transition">
            <i class="fas fa-box fa-3x text-blue-500"></i>
            <div>
                <h4 class="text-gray-600 text-sm">Total Products</h4>
                <p class="text-2xl font-bold text-gray-800">1,254</p>
            </div>
        </div>
        <div class="bg-white rounded-xl shadow-lg p-6 flex items-center space-x-4 hover:scale-[1.02] transition">
            <i class="fas fa-shopping-cart fa-3x text-green-500"></i>
            <div>
                <h4 class="text-gray-600 text-sm">Orders</h4>
                <p class="text-2xl font-bold text-gray-800">487</p>
            </div>
        </div>
        <div class="bg-white rounded-xl shadow-lg p-6 flex items-center space-x-4 hover:scale-[1.02] transition">
            <i class="fas fa-exclamation-circle fa-3x text-red-500"></i>
            <div>
                <h4 class="text-gray-600 text-sm">Low Stock</h4>
                <p class="text-2xl font-bold text-gray-800">19</p>
            </div>
        </div>
        <div class="bg-white rounded-xl shadow-lg p-6 flex items-center space-x-4 hover:scale-[1.02] transition">
            <i class="fas fa-dollar-sign fa-3x text-yellow-500"></i>
            <div>
                <h4 class="text-gray-600 text-sm">Revenue</h4>
                <p class="text-2xl font-bold text-gray-800">$25,890</p>
            </div>
        </div>
    </div>

    <!-- Chart & Quick Actions -->
    <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-10">
        <div class="bg-white rounded-xl shadow-lg p-6">
            <h4 class="text-lg font-semibold text-gray-700 mb-4">📈 Stock Flow (Last 6 Months)</h4>
            <div class="h-60 bg-gray-100 rounded-xl flex items-center justify-center text-gray-400 text-sm">
                [Chart.js Placeholder]
            </div>
        </div>

        <!-- Quick Actions -->
        <div class="bg-white rounded-xl shadow-lg p-6">
            <h4 class="text-lg font-semibold text-gray-700 mb-4">⚡ Quick Actions</h4>
            <div class="grid grid-cols-2 gap-4">
                <button onclick="window.location.href='add_product.jsp'"
                        class="bg-blue-500 hover:bg-blue-600 text-white font-semibold py-3 rounded-lg shadow transition">
                    <i class="fas fa-plus-circle mr-2"></i>Add Product
                </button>

                <button onclick="window.location.href='ItemListServlet'"
                        class="bg-green-500 hover:bg-green-600 text-white font-semibold py-3 rounded-lg shadow transition">
                    <i class="fas fa-boxes mr-2"></i>Manage Stock
                </button>

                <button onclick="window.location.href='report.jsp'"
                        class="bg-purple-500 hover:bg-purple-600 text-white font-semibold py-3 rounded-lg shadow transition">
                    <i class="fas fa-chart-line mr-2"></i>Generate Report
                </button>

                <button onclick="window.location.href='orders.jsp'"
                        class="bg-yellow-500 hover:bg-yellow-600 text-white font-semibold py-3 rounded-lg shadow transition">
                    <i class="fas fa-truck mr-2"></i>Orders
                </button>

                <!-- New Supplier Details Button -->
                <button onclick="window.location.href='SupplierDetailsServlet'"
                        class="bg-indigo-500 hover:bg-indigo-600 text-white font-semibold py-3 rounded-lg shadow transition col-span-2">
                    <i class="fas fa-address-book mr-2"></i>Supplier Details
                </button>
            </div>
        </div>
    </div>

    <!-- Recent Activity -->
    <div class="bg-white rounded-xl shadow-lg p-6">
        <h4 class="text-lg font-semibold text-gray-700 mb-4">🕒 Recent Activity</h4>
        <ul class="divide-y divide-gray-200">
            <li class="py-3 flex justify-between">
                <span class="text-gray-600">✅ Order #987 completed</span>
                <span class="text-sm text-gray-400">5 mins ago</span>
            </li>
            <li class="py-3 flex justify-between">
                <span class="text-gray-600">📦 Added “Logitech Mouse” to Electronics</span>
                <span class="text-sm text-gray-400">15 mins ago</span>
            </li>
            <li class="py-3 flex justify-between">
                <span class="text-gray-600">⚠️ Low stock: USB Drives</span>
                <span class="text-sm text-gray-400">1 hr ago</span>
            </li>
        </ul>
    </div>
</section>

</body>
</html>
