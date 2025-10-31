<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Your Cart</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-slate-900 text-white min-h-screen">
<div class="max-w-5xl mx-auto py-12 px-6">
    <h1 class="text-3xl font-bold mb-8">Shopping Cart</h1>

    <#if cartItems?size == 0>
        <p>Your cart is empty.</p>
    <#else>
        <!-- ✅ Update Cart Form -->
        <form action="/cart/update" method="post">
            <table class="w-full text-left border border-slate-700">
                <thead>
                    <tr class="bg-slate-800 text-slate-300">
                        <th class="p-3">Product</th>
                        <th class="p-3">Price</th>
                        <th class="p-3">Quantity</th>
                        <th class="p-3">Subtotal</th>
                        <th class="p-3">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <#list cartItems as item>
                        <tr class="border-t border-slate-700">
                            <td class="p-3">${item.product.name}</td>
                            <td class="p-3">$${item.product.price?string["0.00"]}</td>
                            <td class="p-3">
                                <input type="number"
                                       name="quantities[${item.product.id}]"
                                       value="${item.quantity}"
                                       min="1"
                                       class="w-20 text-black rounded p-1">
                            </td>
                            <td class="p-3">$${item.subtotal?string["0.00"]}</td>
                            <td class="p-3">
                                <a href="/cart/remove/${item.product.id}"
                                   class="text-red-400 hover:text-red-600">Remove</a>
                            </td>
                        </tr>
                    </#list>
                </tbody>
            </table>

            <!-- ✅ Footer row with aligned buttons -->
            <div class="flex justify-between items-center mt-6">
                <button type="submit"
                        class="bg-yellow-500 hover:bg-yellow-600 px-6 py-2 rounded-lg text-white font-semibold transition-all">
                    Update Cart
                </button>

                <div class="flex flex-col items-end">
                    <p class="text-lg font-semibold mb-3">Total: $${total?string["0.00"]}</p>

                    <!-- Separate checkout form aligned perfectly under the total -->
                    <form action="/cart/checkout" method="post">
                        <button type="submit"
                                class="bg-blue-500 hover:bg-blue-600 px-6 py-2 rounded-lg text-white font-semibold transition-all">
                            Checkout
                        </button>
                    </form>
                </div>
            </div>
        </form>
    </#if>
</div>
</body>
</html>
