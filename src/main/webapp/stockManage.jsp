<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Stock Management Interface</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 min-h-screen">
<main class="h-screen w-full flex items-center justify-center">
  <div class="flex flex-col sm:flex-row gap-6 p-8">
    <button aria-label="Stock In Button" class="px-8 py-4 bg-emerald-500 hover:bg-emerald-600 text-white font-semibold rounded-lg shadow-lg hover:shadow-xl transition-all duration-300 transform hover:scale-105 focus:outline-none focus:ring-2 focus:ring-emerald-400 focus:ring-offset-2 text-lg sm:text-xl min-w-[200px]">
      Stock In
    </button>
    <button onclick="window.location.href='stockoutForm.jsp'"
            aria-label="Stock Out Button" class="px-8 py-4 bg-rose-500 hover:bg-rose-600 text-white font-semibold rounded-lg shadow-lg hover:shadow-xl transition-all duration-300 transform hover:scale-105 focus:outline-none focus:ring-2 focus:ring-rose-400 focus:ring-offset-2 text-lg sm:text-xl min-w-[200px]">
      Stock Out
    </button>
  </div>
</main>
</body>
</html>