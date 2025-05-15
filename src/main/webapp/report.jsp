<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Item Report</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @media print {
            .no-print {
                display: none;
            }
            body {
                background: white;
            }
        }
    </style>
</head>
<body class="bg-gray-100 min-h-screen p-8">

<div class="max-w-6xl mx-auto bg-white rounded-2xl shadow-lg p-8">
    <div class="flex items-center justify-between mb-6">
        <h2 class="text-3xl font-bold text-gray-800">Item Report</h2>
        <button onclick="window.print()" class="no-print bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600">Print Report</button>
    </div>

    <table class="w-full table-auto border-collapse border border-gray-300">
        <thead class="bg-blue-500 text-white">
        <tr>
            <th class="border border-gray-300 px-4 py-2">Item ID</th>
            <th class="border border-gray-300 px-4 py-2">Item Name</th>
            <th class="border border-gray-300 px-4 py-2">Category</th>
            <th class="border border-gray-300 px-4 py-2">Quantity</th>
            <th class="border border-gray-300 px-4 py-2">Unit Price</th>
        </tr>
        </thead>
        <tbody class="text-gray-700">

        <!-- Example row -->
        <tr class="hover:bg-gray-50">
            <td class="border border-gray-300 px-4 py-2 text-center">101</td>
            <td class="border border-gray-300 px-4 py-2">Notebook</td>
            <td class="border border-gray-300 px-4 py-2">Stationery</td>
            <td class="border border-gray-300 px-4 py-2 text-center">50</td>
            <td class="border border-gray-300 px-4 py-2 text-center">5.00</td>
        </tr>

        <tr class="hover:bg-gray-50">
            <td class="border border-gray-300 px-4 py-2 text-center">102</td>
            <td class="border border-gray-300 px-4 py-2">Pen</td>
            <td class="border border-gray-300 px-4 py-2">Stationery</td>
            <td class="border border-gray-300 px-4 py-2 text-center">120</td>
            <td class="border border-gray-300 px-4 py-2 text-center">1.50</td>
        </tr>

        <!-- More rows can be dynamically added -->

        </tbody>
    </table>
</div>

</body>
</html>
