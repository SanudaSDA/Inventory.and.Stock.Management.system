<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inventory Management</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js" defer></script>
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="static/styles.css">

</head>
<body>
<header class="bg-gray-800 text-white p-4 shadow-md">
    <div class="container mx-auto flex justify-between items-center">
        <!-- Logo & Title -->
        <div class="flex items-center space-x-2">
            <img src="static/images/logo.png" alt="Logo" class="w-10 h-10 rounded-full">
            <h1 class="text-xl font-semibold">Inventory Management</h1>
        </div>

        <!-- Navigation Menu -->
        <nav class="hidden md:flex space-x-6">
            <a href="#" class="hover:text-gray-400">Dashboard</a>
            <a href="#" class="hover:text-gray-400">Inventory</a>
            <a href="#" class="hover:text-gray-400">Reports</a>
            <a href="#" class="hover:text-gray-400">Suppliers</a>
            <a href="#" class="hover:text-gray-400">Settings</a>
        </nav>

        <!-- Search Bar & Profile -->
        <div class="flex items-center space-x-4">
            <input type="text" placeholder="Search..." class="px-3 py-1 rounded bg-gray-700 border border-gray-600 text-white focus:outline-none focus:ring-2 focus:ring-gray-500">

            <!-- Profile Dropdown -->
            <div class="relative">
                <button id="profile-btn" class="flex items-center space-x-2 focus:outline-none">
                    <img src="https://via.placeholder.com/40" alt="User" class="w-10 h-10 rounded-full border-2 border-gray-500">
                </button>
                <div id="dropdown-menu" class="hidden absolute right-0 mt-2 w-48 bg-white text-gray-800 shadow-lg rounded-md">
                    <a href="#" class="block px-4 py-2 hover:bg-gray-200">Profile</a>
                    <a href="#" class="block px-4 py-2 hover:bg-gray-200">Settings</a>
                    <a href="#" class="block px-4 py-2 text-red-600 hover:bg-gray-200">Logout</a>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- Hero Section with Image Slider -->
<section x-data="{ images: ['static/images/warehouse.jpg', 'static/images/store-shelves.jpg', 'static/images/inventory-dashboard.jpg'], currentIndex: 0 }" class="relative w-full h-[500px] overflow-hidden">
    <div class="absolute inset-0" x-transition>
        <template x-for="(image, index) in images" :key="index">
            <div x-show="currentIndex === index" class="absolute inset-0 bg-cover bg-center" :style="'background-image: url(' + image + ');'">
                <div class="absolute inset-0 bg-black bg-opacity-50 flex items-center px-4 md:px-16">
                    <div class="text-white max-w-xl">
                        <h2 class="text-4xl font-bold" x-text="['Manage Your Inventory Efficiently', 'Track Stock in Real-Time', 'Simplify Your Workflow'][index]"></h2>
                        <p class="mt-2 text-lg">Seamlessly monitor and control your inventory with ease.</p>
                    </div>
                </div>
            </div>
        </template>
    </div>

    <!-- Navigation Buttons -->
    <button @click="currentIndex = (currentIndex === 0 ? images.length - 1 : currentIndex - 1)" class="absolute left-4 top-1/2 transform -translate-y-1/2 bg-gray-700 text-white p-2 rounded-full shadow-md hover:bg-gray-600">
        <i class="fas fa-chevron-left"></i>
    </button>
    <button @click="currentIndex = (currentIndex + 1) % images.length" class="absolute right-4 top-1/2 transform -translate-y-1/2 bg-gray-700 text-white p-2 rounded-full shadow-md hover:bg-gray-600">
        <i class="fas fa-chevron-right"></i>
    </button>
</section>

<div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-6 p-6">
    <!-- Total Stock -->
    <div class="bg-blue-500 text-white p-6 rounded-lg shadow-lg flex items-center space-x-4">
        <i class="fas fa-boxes fa-3x"></i>
        <div>
            <h2 class="text-lg font-semibold">Total Stock</h2>
            <p class="text-2xl font-bold">12,345</p>
        </div>
    </div>

    <!-- Low Stock Alerts -->
    <div class="bg-red-500 text-white p-6 rounded-lg shadow-lg flex items-center space-x-4">
        <i class="fas fa-exclamation-triangle fa-3x"></i>
        <div>
            <h2 class="text-lg font-semibold">Low Stock Alerts</h2>
            <p class="text-2xl font-bold">23</p>
        </div>
    </div>

    <!-- Orders -->
    <div class="bg-green-500 text-white p-6 rounded-lg shadow-lg flex items-center space-x-4">
        <i class="fas fa-shopping-cart fa-3x"></i>
        <div>
            <h2 class="text-lg font-semibold">Orders</h2>
            <p class="text-2xl font-bold">1,024</p>
        </div>
    </div>

    <!-- Revenue -->
    <div class="bg-yellow-500 text-white p-6 rounded-lg shadow-lg flex items-center space-x-4">
        <i class="fas fa-dollar-sign fa-3x"></i>
        <div>
            <h2 class="text-lg font-semibold">Revenue</h2>
            <p class="text-2xl font-bold">$50,000</p>
        </div>
    </div>
</div>
<section class="p-6">
    <h2 class="text-2xl font-bold mb-4 text-gray-800">Quick Actions</h2>
    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-6">

        <!-- Add New Item -->
        <div class="bg-white p-4 rounded-2xl shadow-md hover:shadow-xl transition-all cursor-pointer">
            <img src="static/images2/add-item.png" alt="Add Item" class="h-28 mx-auto">
            <div class="text-center mt-4">
                <h3 class="font-semibold text-lg text-gray-700"><i class="fas fa-plus-circle mr-2 text-blue-500"></i>Add New Item</h3>
            </div>
        </div>

        <!-- View Inventory -->
        <div class="bg-white p-4 rounded-2xl shadow-md hover:shadow-xl transition-all cursor-pointer">
            <img src="static/images2/inventory.jpg" alt="Inventory" class="w-full h-32 object-contain">
            <div class="text-center mt-4">
                <h3 class="font-semibold text-lg text-gray-700"><i class="fas fa-box-open mr-2 text-green-500"></i>View Inventory</h3>
            </div>
        </div>

        <!-- Generate Report -->
        <div class="bg-white p-4 rounded-2xl shadow-md hover:shadow-xl transition-all cursor-pointer">
            <img src="static/images2/report.jpg" alt="Report" class="h-28 mx-auto">
            <div class="text-center mt-4">
                <h3 class="font-semibold text-lg text-gray-700"><i class="fas fa-chart-line mr-2 text-purple-500"></i>Generate Report</h3>
            </div>
        </div>

        <!-- Manage Orders -->
        <div class="bg-white p-4 rounded-2xl shadow-md hover:shadow-xl transition-all cursor-pointer">
            <img src="static/images2/orders.jpg" alt="Orders" class="h-28 mx-auto">
            <div class="text-center mt-4">
                <h3 class="font-semibold text-lg text-gray-700"><i class="fas fa-shopping-cart mr-2 text-yellow-500"></i>Manage Orders</h3>
            </div>
        </div>

    </div>
</section>
<section class="p-6">
    <h2 class="text-2xl font-bold mb-4 text-gray-800">Recent Activity & Notifications</h2>

    <div class="bg-white shadow-xl rounded-2xl p-6 max-h-96 overflow-y-auto border border-gray-100">
        <ul class="space-y-5">

            <!-- Activity: Product Added -->
            <li class="flex items-center space-x-4 p-4 rounded-lg hover:bg-gray-50 border-l-4 border-blue-500">
                <img src="static/images/activities/add-product.png" alt="Add Product" class="w-12 h-12 rounded shadow-sm">
                <div>
                    <p class="text-gray-700 font-medium">📦 <strong>New Product Added:</strong> “HP Laptop” added to Electronics.</p>
                    <span class="text-sm text-gray-400">2 minutes ago</span>
                </div>
            </li>

            <!-- Activity: Report Generated -->
            <li class="flex items-center space-x-4 p-4 rounded-lg hover:bg-gray-50 border-l-4 border-yellow-500">
                <img src="static/images/activities/report.png" alt="Report" class="w-12 h-12 rounded shadow-sm">
                <div>
                    <p class="text-gray-700 font-medium">📊 <strong>Report Generated:</strong> March inventory summary exported.</p>
                    <span class="text-sm text-gray-400">15 minutes ago</span>
                </div>
            </li>

            <!-- Activity: Low Stock Alert -->
            <li class="flex items-center space-x-4 p-4 rounded-lg hover:bg-gray-50 border-l-4 border-red-500">
                <img src="static/images/activities/low-stock.png" alt="Low Stock" class="w-12 h-12 rounded shadow-sm">
                <div>
                    <p class="text-gray-700 font-medium">⚠️ <strong>Low Stock Alert:</strong> Only 3 USB Drives left.</p>
                    <span class="text-sm text-gray-400">30 minutes ago</span>
                </div>
            </li>

            <!-- Activity: Order Completed -->
            <li class="flex items-center space-x-4 p-4 rounded-lg hover:bg-gray-50 border-l-4 border-green-500">
                <img src="static/images/activities/order-complete.png" alt="Order Complete" class="w-12 h-12 rounded shadow-sm">
                <div>
                    <p class="text-gray-700 font-medium">✅ <strong>Order Completed:</strong> Order #01245 fulfilled.</p>
                    <span class="text-sm text-gray-400">1 hour ago</span>
                </div>
            </li>

        </ul>
    </div>
</section>
<footer class="footer">
    <div class="footer-container">
        <!-- Column 1: Logo + Intro -->
        <div class="footer-col">
            <img src="images/logo.png" alt="Inventory Logo" class="footer-logo">
            <p>Smart tracking. Smarter inventory.<br>Your warehouse in one system.</p>
            <img src="images/warehouse-illustration.png" alt="Warehouse Illustration" class="footer-img">
        </div>

        <!-- Column 2: Quick Links -->
        <div class="footer-col">
            <h4>Quick Links</h4>
            <ul>
                <li><a href="#">Dashboard</a></li>
                <li><a href="#">Products</a></li>
                <li><a href="#">Stock Reports</a></li>
                <li><a href="#">Settings</a></li>
            </ul>
        </div>

        <!-- Column 3: Contact Info -->
        <div class="footer-col">
            <h4>Contact Us</h4>
            <ul>
                <li><i class="fa fa-envelope"></i> support@inventorypro.com</li>
                <li><i class="fa fa-phone"></i> +123 456 7890</li>
                <li><i class="fa fa-map-marker"></i> 123 Warehouse Ave, City</li>
            </ul>
        </div>

        <!-- Column 4: Social Links -->
        <div class="footer-col">
            <h4>Follow Us</h4>
            <div class="social-icons">
                <a href="#"><i class="fa fa-facebook"></i></a>
                <a href="#"><i class="fa fa-twitter"></i></a>
                <a href="#"><i class="fa fa-linkedin"></i></a>
            </div>
        </div>
    </div>

    <div class="footer-bottom">
        <p>© 2025 Inventory Pro | University Project – Designed by [Your Name]</p>
    </div>
</footer>



<script>
    document.getElementById('profile-btn').addEventListener('click', function() {
        document.getElementById('dropdown-menu').classList.toggle('hidden');
    });
</script>



</body>
</html>
