<%--
  Created by IntelliJ IDEA.
  User: Dulmi Madusha
  Date: 5/9/2025
  Time: 7:04 AM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Guest | Inventory Pro</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-r from-blue-50 via-blue-100 to-blue-200 text-gray-800">

<!-- Hero Section with Buttons -->
<section class="relative h-[80vh] bg-cover bg-center flex items-center justify-center text-white"
         style="background-image: url('<%= request.getContextPath() %>/static/images/06.jpeg');">
    <div class="bg-black bg-opacity-60 absolute inset-0"></div>
    <div class="relative z-10 text-center px-6">
        <h1 class="text-4xl md:text-5xl font-bold mb-4">Welcome to Inventory Pro</h1>
        <p class="text-lg md:text-xl mb-8">Track stock, monitor inventory, and optimize warehouse management — all in one place.</p>
        <div class="space-x-4">
            <a href="login.jsp" class="bg-white text-blue-600 font-semibold px-6 py-2 rounded hover:bg-blue-50 transition">Log In</a>
            <a href="Register.jsp" class="bg-blue-600 text-white font-semibold px-6 py-2 rounded hover:bg-blue-700 transition">Sign Up</a>
        </div>
    </div>
</section>

<!-- Featured Products -->
<section class="py-16 px-6 max-w-7xl mx-auto">
    <h2 class="text-3xl font-bold text-center mb-10 text-gray-800">Featured Products</h2>
    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-8">

        <!-- Product Card Template -->
        <!-- Repeat for 9 products -->
        <!-- You can replace titles and descriptions as needed -->

        <!-- Product 1 -->
        <div class="bg-white rounded-lg shadow hover:shadow-xl transition overflow-hidden">
            <img src="/static/images/03.jpeg" class="w-full h-48 object-cover">

            <div class="p-4">
                <h3 class="text-xl font-semibold mb-2">Barcode Scanner</h3>
                <p class="text-sm text-gray-600">Efficient scanning to manage inventory instantly.</p>
            </div>
        </div>

        <!-- Product 2 -->
        <div class="bg-white rounded-lg shadow hover:shadow-xl transition overflow-hidden">
            <img src="/static/images/05.jpg" class="w-full h-48 object-cover">
            <div class="p-4">
                <h3 class="text-xl font-semibold mb-2">Smart Shelving Unit</h3>
                <p class="text-sm text-gray-600">Automated stock detection for smarter storage.</p>
            </div>
        </div>

        <!-- Product 3 -->
        <div class="bg-white rounded-lg shadow hover:shadow-xl transition overflow-hidden">
            <img src="/static/images/04.jpeg" class="w-full h-48 object-cover">
            <div class="p-4">
                <h3 class="text-xl font-semibold mb-2">Inventory Tablet</h3>
                <p class="text-sm text-gray-600">Track and update stock with mobility and ease.</p>
            </div>
        </div>

        <!-- Product 4 -->
        <div class="bg-white rounded-lg shadow hover:shadow-xl transition overflow-hidden">
            <img src="/static/images/01.jpg" class="w-full h-48 object-cover">
            <div class="p-4">
                <h3 class="text-xl font-semibold mb-2">Label Printer</h3>
                <p class="text-sm text-gray-600">Print accurate product labels with ease.</p>
            </div>
        </div>

        <!-- Product 5 -->
        <div class="bg-white rounded-lg shadow hover:shadow-xl transition overflow-hidden">
            <img src="/static/images/02.jpeg" class="w-full h-48 object-cover">
            <div class="p-4">
                <h3 class="text-xl font-semibold mb-2">Stock Trolley</h3>
                <p class="text-sm text-gray-600">Easily move goods around the warehouse.</p>
            </div>
        </div>

        <!-- Product 6 -->
        <div class="bg-white rounded-lg shadow hover:shadow-xl transition overflow-hidden">
            <img src="/static/images/product6.jpg" class="w-full h-48 object-cover">
            <div class="p-4">
                <h3 class="text-xl font-semibold mb-2">Shelf Sensor Kit</h3>
                <p class="text-sm text-gray-600">Real-time shelf monitoring sensors.</p>
            </div>
        </div>

        <!-- Product 7 -->
        <div class="bg-white rounded-lg shadow hover:shadow-xl transition overflow-hidden">
            <img src="/static/images/product7.jpg" class="w-full h-48 object-cover">
            <div class="p-4">
                <h3 class="text-xl font-semibold mb-2">Packing Station</h3>
                <p class="text-sm text-gray-600">Streamline packaging workflows.</p>
            </div>
        </div>

        <!-- Product 8 -->
        <div class="bg-white rounded-lg shadow hover:shadow-xl transition overflow-hidden">
            <img src="/static/images/product8.jpg" class="w-full h-48 object-cover">
            <div class="p-4">
                <h3 class="text-xl font-semibold mb-2">Warehouse Camera</h3>
                <p class="text-sm text-gray-600">Keep an eye on operations and security.</p>
            </div>
        </div>

        <!-- Product 9 -->
        <div class="bg-white rounded-lg shadow hover:shadow-xl transition overflow-hidden">
            <img src="/static/images/product9.jpg" class="w-full h-48 object-cover">
            <div class="p-4">
                <h3 class="text-xl font-semibold mb-2">Automated Picker Arm</h3>
                <p class="text-sm text-gray-600">Boost order fulfillment speed with robotics.</p>
            </div>
        </div>

    </div>
</section>

<!-- YouTube Video Section -->
<section class="py-16 px-6 bg-blue-50">
    <h2 class="text-3xl font-bold text-center text-gray-800 mb-8">See Inventory Pro in Action</h2>
    <div class="max-w-5xl mx-auto aspect-w-16 aspect-h-9">
        <iframe
                class="w-full h-96 rounded-lg shadow-lg"
                src="https://www.youtube.com/embed/xkQeal47fYY?si=XTWMMscgvfnUYsDv"
                title="Inventory Demo Video"
                frameborder="0"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                allowfullscreen>
        </iframe>

    </div>
</section>

<!-- Footer -->
<footer class="bg-gray-900 text-gray-300 py-10">
    <div class="max-w-6xl mx-auto text-center">
        <h4 class="text-lg font-semibold">Inventory Pro</h4>
        <p class="text-sm mt-2">Smart inventory made simple. © 2025</p>
    </div>
</footer>

</body>
</html>
