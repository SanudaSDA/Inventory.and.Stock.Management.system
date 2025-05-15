<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stock Out Form</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 min-h-screen flex items-center justify-center p-4">
<div class="w-full max-w-4xl bg-white rounded-lg shadow-lg p-8">
    <h1 class="text-3xl font-bold text-gray-800 mb-8 text-center">Stock Out Form</h1>

    <form id="stockOutForm" action="StockOut" method="post" class="space-y-8">
        <div class="grid md:grid-cols-2 gap-6">
            <div class="space-y-6">
                <h2 class="text-xl font-semibold text-gray-700">Item Details</h2>

                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1" for="itemId">Item ID *</label>
                    <input type="text" id="itemId" name="itemId" required maxlength="20"
                           placeholder="Enter unique item identifier"
                           class="w-full px-4 py-2 border border-gray-300 rounded-md focus:ring-2 focus:ring-blue-500">
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1" for="itemName">Item Name *</label>
                    <input type="text" id="itemName" name="itemName" required maxlength="100"
                           placeholder="Enter full item name"
                           class="w-full px-4 py-2 border border-gray-300 rounded-md focus:ring-2 focus:ring-blue-500">
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1" for="quantity">Quantity *</label>
                    <input type="number" id="quantity" name="quantity" required min="1" max="1000"
                           class="w-full px-4 py-2 border border-gray-300 rounded-md focus:ring-2 focus:ring-blue-500">
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1" for="pricePerUnit">Price per Unit (Rs) *</label>
                    <input type="number" id="pricePerUnit" name="pricePerUnit" required min="0" step="0.01"
                           class="w-full px-4 py-2 border border-gray-300 rounded-md focus:ring-2 focus:ring-blue-500">
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1" for="totalPrice">Total Price (Rs)</label>
                    <input type="text" id="totalPrice" name="totalPrice" readonly
                           class="w-full px-4 py-2 bg-gray-100 border border-gray-300 rounded-md">
                </div>
            </div>

            <div class="space-y-6">
                <h2 class="text-xl font-semibold text-gray-700">Receiver Information</h2>

                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1" for="receiverName">Receiver Name *</label>
                    <input type="text" id="receiverName" name="receiverName" required maxlength="100"
                           placeholder="Full name of receiver"
                           class="w-full px-4 py-2 border border-gray-300 rounded-md focus:ring-2 focus:ring-blue-500">
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1" for="department">Department *</label>
                    <select id="department" name="department" required
                            class="w-full px-4 py-2 border border-gray-300 rounded-md focus:ring-2 focus:ring-blue-500">
                        <option value="">Select Department</option>
                        <option value="inventory">Inventory</option>
                        <option value="procurement">Procurement</option>
                        <option value="sales">Sales</option>
                        <option value="administration">Administration</option>
                        <option value="other">Other</option>
                    </select>
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1" for="contactNumber">Contact Number *</label>
                    <input type="tel" id="contactNumber" name="contactNumber" required pattern="[+][0-9]{2}\s[0-9]{10}"
                           placeholder="+91 XXXXXXXXXX"
                           class="w-full px-4 py-2 border border-gray-300 rounded-md focus:ring-2 focus:ring-blue-500">
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1" for="stockOutDate">Stock Out Date *</label>
                    <input type="date" id="stockOutDate" name="stockOutDate" required
                           class="w-full px-4 py-2 border border-gray-300 rounded-md focus:ring-2 focus:ring-blue-500">
                </div>
            </div>
        </div>

        <div class="flex justify-end space-x-4 mt-8">
            <button type="reset"
                    class="px-6 py-2 bg-gray-200 text-gray-700 rounded-md hover:bg-gray-300 transition-colors">
                Clear Form
            </button>
            <button type="submit"
                    class="px-6 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700 transition-colors disabled:opacity-50 disabled:cursor-not-allowed">
                Process Stock Out
            </button>
        </div>
    </form>

    <!-- Confirmation Modal -->
    <div id="confirmationModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center">
        <div class="bg-white p-6 rounded-lg shadow-xl max-w-md w-full">
            <h3 class="text-lg font-semibold mb-4">Confirm Stock Out</h3>
            <p class="text-gray-600 mb-6">Are you sure you want to process this stock out?</p>
            <div class="flex justify-end space-x-4">
                <button type="button" onclick="closeModal()"
                        class="px-4 py-2 bg-gray-200 text-gray-700 rounded-md hover:bg-gray-300">Cancel
                </button>
                <button type="button" onclick="submitForm()"
                        class="px-4 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700">Confirm
                </button>
            </div>
        </div>
    </div>

    <!-- Success Notification -->
    <div id="successNotification"
         class="hidden fixed top-4 right-4 bg-green-500 text-white px-6 py-3 rounded-md shadow-lg">
        Stock out processed successfully!
    </div>
</div>

<script>
    const form = document.getElementById('stockOutForm');
    const quantityInput = document.getElementById('quantity');
    const priceInput = document.getElementById('pricePerUnit');
    const totalPriceInput = document.getElementById('totalPrice');
    const modal = document.getElementById('confirmationModal');
    const notification = document.getElementById('successNotification');

    function calculateTotal() {
        const quantity = Number(quantityInput.value) || 0;
        const price = Number(priceInput.value) || 0;
        totalPriceInput.value = (quantity * price).toFixed(2);
    }

    quantityInput.addEventListener('input', calculateTotal);
    priceInput.addEventListener('input', calculateTotal);

    form.addEventListener('submit', (e) => {
        e.preventDefault();
        if (form.checkValidity()) {
            modal.classList.remove('hidden');
        }
    });

    function closeModal() {
        modal.classList.add('hidden');
    }

    function submitForm() {
        closeModal();
        form.submit();
    }

    // Set max date to today
    const today = new Date().toISOString().split('T')[0];
    document.getElementById('stockOutDate').setAttribute('max', today);
</script>
</body>
</html>
