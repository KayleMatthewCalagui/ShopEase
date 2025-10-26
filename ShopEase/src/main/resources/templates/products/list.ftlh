<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product List</title>
</head>
<body>
<h2>Products</h2>

<a href="/products/new">Add Product</a>
<table border="1">
    <tr>
        <th>ID</th><th>Name</th><th>Category</th><th>Price</th><th>Stock</th><th>Actions</th>
    </tr>
    <#list products as product>
        <tr>
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.category.name}</td>
            <td>${product.price}</td>
            <td>${product.stock}</td>
            <td>
                <a href="/products/edit/${product.id}">Edit</a> |
                <a href="/products/delete/${product.id}" onclick="return confirm('Delete this product?')">Delete</a>
            </td>
        </tr>
    </#list>
</table>
</body>
</html>
