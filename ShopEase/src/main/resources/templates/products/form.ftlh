<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${(product?? && product.id??)?then("Edit Product", "Add Product")}</title>
</head>

<body style="background-color: white; min-height: 100vh; display: flex; align-items: center; justify-content: center; font-family: Arial, sans-serif; margin: 0;">

    <div style="background-color: #64f8c1; border-radius: 20px; box-shadow: 0 4px 10px rgba(0,0,0,0.2); width: 380px; padding: 30px;">

        <!-- Back link -->
        <a href="/products" style="text-decoration: none; color: #374151; font-size: 14px; display: inline-block; margin-bottom: 10px;">
            ← Back
        </a>

        <!-- Title -->
        <h2 style="text-align: center; font-size: 38px; color: #111827; font-weight: bold; margin-bottom: 25px;">
            ${(product?? && product.id??)?then("Edit Product", "Add Product")}
        </h2>

        <form action="/products/save" method="post" style="display: flex; flex-direction: column; gap: 15px;">
            <#if product?? && product.id??>
                <input type="hidden" name="id" value="${product.id}">
            </#if>

            <!-- Name -->
            <div style="width: 100%;">
                <label style="display: block; font-weight: 600; color: #111827; margin-bottom: 5px;">Name</label>
                <input type="text" name="name" value="${product.name!''}" required
                       style="width: 100%; box-sizing: border-box; padding: 12px; border: 1px solid #d1d5db; border-radius: 8px; background-color: #eff6ff; font-size: 14px;">
            </div>

            <!-- Category -->
            <div style="width: 100%;">
                <label style="display: block; font-weight: 600; color: #111827; margin-bottom: 5px;">Category</label>
                <select name="category.id" required
                        style="width: 100%; box-sizing: border-box; padding: 12px; border: 1px solid #d1d5db; border-radius: 8px; background-color: #eff6ff; font-size: 14px;">
                    <#list categories as category>
                        <option value="${category.id}"
                            <#if product?? && product.category?? && product.category.id == category.id>selected</#if>>
                            ${category.name}
                        </option>
                    </#list>
                </select>
            </div>

            <!-- Price -->
            <div style="width: 100%;">
                <label style="display: block; font-weight: 600; color: #111827; margin-bottom: 5px;">Price</label>
                <input type="number" step="0.01" name="price" value="${product.price!''}" required
                       style="width: 100%; box-sizing: border-box; padding: 12px; border: 1px solid #d1d5db; border-radius: 8px; background-color: #eff6ff; font-size: 14px;">
            </div>

            <!-- Stock -->
            <div style="width: 100%;">
                <label style="display: block; font-weight: 600; color: #111827; margin-bottom: 5px;">Stock</label>
                <input type="number" name="stock" value="${product.stock!''}" required
                       style="width: 100%; box-sizing: border-box; padding: 12px; border: 1px solid #d1d5db; border-radius: 8px; background-color: #eff6ff; font-size: 14px;">
            </div>

            <!-- Submit Button -->
            <button type="submit"
                    style="width: 100%; background-color: #1e1b4b; color: white; font-weight: bold; font-size: 15px; padding: 12px; border: none; border-radius: 8px; cursor: pointer;">
                ${(product?? && product.id??)?then("Update Product", "Add Product")}
            </button>
        </form>

        <!-- Footer -->
        <div style="text-align: center; margin-top: 15px; font-size: 13px;">
            <p style="color: #111827;">Want to go back?
                <a href="/products" style="color: #1e1b4b; font-weight: bold; text-decoration: none;">View Products</a>
            </p>
        </div>
    </div>

</body>
</html>
