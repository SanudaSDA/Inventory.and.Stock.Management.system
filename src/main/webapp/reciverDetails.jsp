<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stock Out Transaction Details</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 min-h-screen py-12 px-4 sm:px-6 lg:px-8">
<div class="max-w-3xl mx-auto">
    <div class="bg-white shadow-lg rounded-lg overflow-hidden">
        <div class="px-6 py-4 bg-gray-100 border-b border-gray-200">
            <div class="flex items-center justify-between">
                <h1 class="text-2xl font-bold text-gray-800">Stock Out Transaction Details</h1>
                <button class="bg-blue-600 text-white px-4 py-2 rounded-md hover:bg-blue-700 transition duration-200" onclick="window.print()">Print Details</button>
            </div>
        </div>

        <div class="p-6 space-y-6">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div class="space-y-2">
                    <label class="block text-sm font-medium text-gray-700">Item Identification Number</label>
                    <div class="text-lg font-semibold text-gray-900 p-3 bg-gray-50 rounded-md">#ITM-2024-001</div>
                </div>

                <div class="space-y-2">
                    <label class="block text-sm font-medium text-gray-700">Transaction Date</label>
                    <div class="flex items-center space-x-2 p-3 bg-gray-50 rounded-md">
                        <svg class="h-5 w-5 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
                        </svg>
                        <span class="text-lg text-gray-900">February 15, 2024</span>
                    </div>
                </div>
            </div>

            <div class="bg-gray-50 rounded-lg p-6 space-y-4">
                <h2 class="text-xl font-semibold text-gray-800">Receiver Information</h2>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div class="space-y-2">
                        <label class="block text-sm font-medium text-gray-700">Receiver Name</label>
                        <div class="p-3 bg-white rounded-md border border-gray-200">John Anderson</div>
                    </div>

                    <div class="space-y-2">
                        <label class="block text-sm font-medium text-gray-700">Department</label>
                        <div class="p-3 bg-white rounded-md border border-gray-200">Operations</div>
                    </div>

                    <div class="space-y-2 md:col-span-2">
                        <label class="block text-sm font-medium text-gray-700">Contact Number</label>
                        <div class="p-3 bg-white rounded-md border border-gray-200">+1 (555) 123-4567</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="px-6 py-4 bg-gray-50 border-t border-gray-200">
            <div class="text-sm text-gray-500 text-center">
                This is an electronic copy of the stock out transaction. Please retain for your records.
            </div>
        </div>
    </div>
</div>
</body>
</html>