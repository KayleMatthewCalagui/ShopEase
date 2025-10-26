<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${(product?? && product.id??)?then("Edit Product", "Add Product")}</title>
    <!-- ✅ Import Tailwind CSS -->
    <link href="/css/output.css" rel="stylesheet">
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center p-6">

<div class="bg-white shadow-lg rounded-2xl p-8 w-full max-w-lg">
    <h2 class="text-3xl font-bold text-blue-600 mb-6 text-center">
        ${(product?? && product.id??)?then("Edit Product", "Add Product")}
    </h2>

    <form action="/products/save" method="post" class="space-y-5">
        <#if product?? && product.id??>
            <input type="hidden" name="id" value="${product.id}">
        </#if>

        <div>
            <label class="block text-gray-700 font-medium mb-1">Name:</label>
            <input type="text" name="name" value="${product.name!''}" required
                   class="w-full border border-gray-300 rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-400">
        </div>

        <div>
            <label class="block text-gray-700 font-medium mb-1">Category:</label>
            <select name="category.id" required
                    class="w-full border border-gray-300 rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-400">
                <#list categories as category>
                    <option value="${category.id}"
                        <#if product?? && product.category?? && product.category.id == category.id>selected</#if>>
                        ${category.name}
                    </option>
                </#list>
            </select>
        </div>

        <div>
            <label class="block text-gray-700 font-medium mb-1">Price:</label>
            <input type="number" step="0.01" name="price" value="${product.price!''}" required
                   class="w-full border border-gray-300 rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-400">
        </div>

        <div>
            <label class="block text-gray-700 font-medium mb-1">Stock:</label>
            <input type="number" name="stock" value="${product.stock!''}" required
                   class="w-full border border-gray-300 rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-400">
        </div>

        <button type="submit"
                class="w-full bg-blue-600 text-white font-semibold py-2 rounded-lg hover:bg-blue-700 transition">
            ${(product?? && product.id??)?then("Update", "Add")}
        </button>
    </form>

    <div class="mt-4 text-center">
        <a href="/products" class="text-blue-600 hover:underline text-sm">← Back to list</a>
    </div>
</div>

</body>
</html>
