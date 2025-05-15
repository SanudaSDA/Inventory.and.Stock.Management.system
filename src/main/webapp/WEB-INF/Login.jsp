<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login | Inventory System</title>

    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- Font Awesome (already added in your project) -->
    <script src="https://kit.fontawesome.com/YOUR_KIT_ID.js" crossorigin="anonymous"></script>

    <!-- Favicon (Optional) -->
    <link rel="icon" href="static/images/favicon.ico" type="image/x-icon" />
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">

<!-- Login Card -->
<div class="bg-white shadow-lg rounded-2xl w-full max-w-md p-8">
    <div class="text-center mb-6">
        <h1 class="text-2xl font-bold text-gray-800">Login to Inventory System</h1>
        <p class="text-gray-500 text-sm mt-2">Enter your credentials below</p>
    </div>

    <form action="#" method="POST" class="space-y-5">
        <!-- Email -->
        <div>
            <label class="block text-sm font-medium text-gray-700 mb-1" for="email">Email</label>
            <div class="relative">
                <input type="email" id="email" name="email" required placeholder="you@example.com"
                       class="w-full px-4 py-3 border border-gray-300 rounded-xl focus:outline-none focus:ring-2 focus:ring-blue-500" />
                <i class="fas fa-envelope absolute right-4 top-3.5 text-gray-400"></i>
            </div>
        </div>

        <!-- Password -->
        <div>
            <label class="block text-sm font-medium text-gray-700 mb-1" for="password">Password</label>
            <div class="relative">
                <input type="password" id="password" name="password" required placeholder="••••••••"
                       class="w-full px-4 py-3 border border-gray-300 rounded-xl focus:outline-none focus:ring-2 focus:ring-blue-500" />
                <i class="fas fa-lock absolute right-4 top-3.5 text-gray-400"></i>
            </div>
        </div>

        <!-- Remember Me & Forgot -->
        <div class="flex items-center justify-between text-sm">
            <label class="flex items-center">
                <input type="checkbox" class="form-checkbox h-4 w-4 text-blue-600" />
                <span class="ml-2 text-gray-600">Remember me</span>
            </label>
            <a href="#" class="text-blue-600 hover:underline">Forgot password?</a>
        </div>

        <!-- Login Button -->
        <button type="submit"
                class="w-full py-3 bg-blue-600 text-white font-semibold rounded-xl hover:bg-blue-700 transition duration-300">
            Sign In
        </button>
    </form>

    <!-- Divider -->
    <div class="text-center my-4 text-sm text-gray-400">OR</div>

    <!-- Register Link -->
    <p class="text-center text-sm text-gray-600">
        Don't have an account?
        <a href="#" class="text-blue-600 hover:underline font-medium">Register here</a>
    </p>
</div>

</body>
</html>

