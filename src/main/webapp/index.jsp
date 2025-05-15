<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inventory Management</title>
    <link rel="icon" type="image/png" href="static/images/favicon4.png" />
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
            <img src="static/images/favicon4.png" alt="Logo" class="w-10 h-10 rounded-full">
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


            <!-- Profile Dropdown (Top Right Corner) -->
            <div x-data="{ open: false }" class="relative z-50 ml-auto">
                <!-- Profile Button -->
                <button @click="open = !open" class="flex items-center space-x-2 focus:outline-none">
                    <img src="static/images3/user.jpg" alt="User" class="w-10 h-10 rounded-full shadow">
                    <span class="hidden sm:block text-gray-700 font-semibold">Admin</span>
                    <i class="fas fa-chevron-down text-gray-500 text-sm mt-1"></i>
                </button>

                <!-- Dropdown Menu -->
                <div
                        x-show="open"
                        @click.away="open = false"
                        x-transition
                        class="absolute right-0 mt-2 w-56 bg-white rounded-xl shadow-lg border border-gray-100 z-50"
                >
                    <div class="px-4 py-3 border-b">
                        <p class="text-sm text-gray-500">Signed in as</p>
                        <p class="text-sm font-medium text-gray-900 truncate">admin@example.com</p>
                    </div>

                    <ul class="py-2 text-gray-700">
                        <li>
                            <a href="#" class="flex items-center px-4 py-2 hover:bg-gray-100 transition">
                                <i class="fas fa-user-cog mr-3 w-4"></i> Profile Settings
                            </a>
                        </li>
                        <li>
                            <a href="#" class="flex items-center px-4 py-2 hover:bg-gray-100 transition">
                                <i class="fas fa-bell mr-3 w-4"></i> Notifications
                            </a>
                        </li>
                        <li>
                            <a href="#" class="flex items-center px-4 py-2 hover:bg-gray-100 transition">
                                <i class="fas fa-shield-alt mr-3 w-4"></i> Security
                            </a>
                        </li>
                        <li>
                            <a href="#" class="flex items-center px-4 py-2 hover:bg-gray-100 transition">
                                <i class="fas fa-question-circle mr-3 w-4"></i> Help Center
                            </a>
                        </li>
                    </ul>

                    <div class="border-t">
                        <a href="#" class="flex items-center px-4 py-3 text-red-600 hover:bg-red-50 transition">
                            <i class="fas fa-sign-out-alt mr-3 w-4"></i> Logout
                        </a>
                    </div>
                </div>
            </div>


        </div>
    </div>
</header>

<!-- Hero Section with Image Slider -->
<section
        x-data="{
    current: 0,
    slides: [
      { img: 'static/images/inventory-dashboard.jpg', title: 'Smart Inventory System', desc: 'Monitor and manage your stock efficiently.' },
      { img: 'static/images/store-shelves.jpg', title: 'Real-Time Alerts', desc: 'Stay informed with instant updates and low-stock notifications.' },
      { img: 'static/images/warehouse.jpg', title: 'Powerful Analytics', desc: 'Generate insightful reports and optimize inventory decisions.' }
    ],
    init() {
      setInterval(() => {
        this.current = (this.current + 1) % this.slides.length;
      }, 5000);
    }
  }"
        x-init="init"
        class="relative w-full h-[500px] overflow-hidden"
>

    <!-- Slide Items -->
    <template x-for="(slide, index) in slides" :key="index">
        <div
                x-show="current === index"
                x-transition:enter="transition-opacity ease-in-out duration-1000"
                x-transition:enter-start="opacity-0"
                x-transition:enter-end="opacity-100"
                x-transition:leave="transition-opacity ease-in-out duration-1000"
                x-transition:leave-start="opacity-100"
                x-transition:leave-end="opacity-0"
                class="absolute inset-0 w-full h-full"
        >
            <img :src="slide.img" alt="Hero" class="w-full h-full object-cover" />

            <!-- Overlay Text -->
            <div class="absolute inset-0 bg-black bg-opacity-40 flex items-center">
                <div class="text-white max-w-xl px-8">
                    <h2 x-text="slide.title" class="text-4xl font-bold mb-4"></h2>
                    <p x-text="slide.desc" class="text-lg text-gray-200"></p>
                </div>
            </div>
        </div>
    </template>

    <!-- Slide Indicators -->
    <div class="absolute bottom-5 left-8 flex space-x-2 z-20">
        <template x-for="(slide, index) in slides" :key="index">
            <div
                    @click="current = index"
                    :class="{'bg-white': current === index, 'bg-gray-400': current !== index}"
                    class="w-3 h-3 rounded-full cursor-pointer transition-all"
            ></div>
        </template>
    </div>
</section>

</section>

</header>
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
<footer class="bg-gray-900 text-gray-300 mt-16">
    <div class="max-w-7xl mx-auto px-6 py-12 grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-10">

        <!-- Logo and Tagline -->
        <div>
            <div class="flex items-center space-x-3 mb-4">
                <img src="static/images/favicon4.png" alt="Logo" class="w-10 h-10 rounded-full">
                <span class="text-xl font-semibold text-white">Inventory Pro</span>
            </div>
            <p class="text-sm">Smart tracking. Smarter inventory. <br>Your warehouse in one system.</p>
            <img src="images/warehouse-illustration.png" alt="Warehouse Illustration" class="mt-4 w-28 opacity-80">
        </div>

        <!-- Quick Links -->
        <div>
            <h4 class="text-white text-lg font-semibold mb-3">Quick Links</h4>
            <ul class="space-y-2">
                <li><a href="#" class="hover:text-white transition"><i class="fas fa-tachometer-alt mr-2 w-4"></i>Dashboard</a></li>
                <li><a href="#" class="hover:text-white transition"><i class="fas fa-box mr-2 w-4"></i>Products</a></li>
                <li><a href="#" class="hover:text-white transition"><i class="fas fa-chart-pie mr-2 w-4"></i>Stock Reports</a></li>
                <li><a href="#" class="hover:text-white transition"><i class="fas fa-cog mr-2 w-4"></i>Settings</a></li>
            </ul>
        </div>

        <!-- Contact Information -->
        <div>
            <h4 class="text-white text-lg font-semibold mb-3">Contact Us</h4>
            <ul class="space-y-2 text-sm">
                <li><i class="fas fa-envelope mr-2 text-blue-400"></i> support@inventorypro.com</li>
                <li><i class="fas fa-phone mr-2 text-green-400"></i> +123 456 7890</li>
                <li><i class="fas fa-map-marker-alt mr-2 text-red-400"></i> 123 Warehouse Ave, City</li>
            </ul>
        </div>

        <!-- Social Media -->
        <div>
            <h4 class="text-white text-lg font-semibold mb-3">Follow Us</h4>
            <div class="flex space-x-4 mt-2">
                <a href="#" class="hover:text-white text-xl transition"><i class="fab fa-facebook-f"></i></a>
                <a href="#" class="hover:text-white text-xl transition"><i class="fab fa-twitter"></i></a>
                <a href="#" class="hover:text-white text-xl transition"><i class="fab fa-linkedin-in"></i></a>
                <a href="#" class="hover:text-white text-xl transition"><i class="fab fa-instagram"></i></a>
            </div>
        </div>
    </div>

    <!-- Bottom Bar -->
    <div class="border-t border-gray-700 py-4 text-center text-sm text-gray-500">
        © 2025 Inventory Pro | University Project – Designed by [Your Name]
    </div>
</footer>




<script>
    document.getElementById('profile-btn').addEventListener('click', function() {
        document.getElementById('dropdown-menu').classList.toggle('hidden');
    });
</script>



</body>
</html>