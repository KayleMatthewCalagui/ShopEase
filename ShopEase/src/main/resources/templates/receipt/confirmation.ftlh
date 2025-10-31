<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Receipt</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-slate-900 text-white min-h-screen flex justify-center items-center">
<div class="bg-slate-800 p-10 rounded-2xl shadow-xl w-full max-w-lg text-center">
    <h1 class="text-3xl font-bold text-blue-400 mb-4">Payment Successful</h1>
    <p class="text-lg mb-2">Thank you for your purchase!</p>

    <div class="bg-slate-700 rounded-lg p-4 mt-6 text-left">
        <p><strong>Receipt No:</strong> ${receipt.receiptNumber}</p>
        <p><strong>Invoice No:</strong> ${invoice.invoiceNumber}</p>
        <p><strong>Total:</strong> $${invoice.totalAmount?string["0.00"]}</p>
        <p><strong>Date:</strong> ${receipt.receiptDate}</p>
    </div>

    <a href="/products/store"
       class="mt-6 inline-block bg-blue-500 hover:bg-blue-600 px-6 py-2 rounded-lg text-white font-semibold">
        Continue Shopping
    </a>
</div>
</body>
</html>
