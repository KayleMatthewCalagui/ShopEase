<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${(product?? && product.id??)?then("Edit Product", "Add Product")}</title>
</head>
<body>
<h2>${(product?? && product.id??)?then("Edit Product", "Add Product")}</h2>

<form action="/products/save" method="post">
    <#if product?? && product.id??>
        <input type="hidden" name="id" value="${product.id}">
    </#if>

    <label>Name:</label>
    <input type="text" name="name" value="${product.name!''}" required><br>

    <label>Category:</label>
    <select name="category.id" required>
        <#list categories as category>
            <option value="${category.id}"
                <#if product?? && product.category?? && product.category.id == category.id>selected</#if>>
                ${category.name}
            </option>
        </#list>
    </select><br>

    <label>Price:</label>
    <input type="number" step="0.01" name="price" value="${product.price!''}" required><br>

    <label>Stock:</label>
    <input type="number" name="stock" value="${product.stock!''}" required><br>

    <button type="submit">${(product?? && product.id??)?then("Update", "Add")}</button>
</form>

<a href="/products">Back to list</a>
</body>
</html>
