<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product List</title>
</head>
<body style="font-family: Arial, sans-serif; background-color: white; margin: 0; padding: 0;">

<div style="background: #64f8c1; margin: 20px auto; width: 800px; height: 450px; border-radius: 20px; padding: 20px; box-shadow: 0 4px 10px rgba(0,0,0,0.15);">

    <!-- Back Link -->
    <a href="/" style="display: inline-block; text-decoration: none; color: #374151; font-size: 14px; margin-left: 20px; margin-bottom: 5px;">
        ← Back
    </a>

    <h2 style="font-size: 38px; text-align: center; margin-bottom: 15px;">Products</h2>

    <!-- Add Product Button -->
    <a href="/products/new" style="display: inline-block; background: #2563eb; color: white; padding: 6px 12px; border-radius: 6px;
     text-decoration: none; margin-left: 40px;">Add Product</a>

    <table style="width: 90%; margin: 20px auto; border-collapse: collapse; background: white; border-radius: 6px;
     overflow: hidden; font-family: Arial, sans-serif; border: 2px solid #e5e7eb; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);">
        <thead>
            <tr style="background: #f9fafb; text-align: left;">
                <th style="padding: 12px;">ID</th>
                <th style="padding: 12px;">Name</th>
                <th style="padding: 12px;">Category</th>
                <th style="padding: 12px;">Price</th>
                <th style="padding: 12px;">Stock</th>
                <th style="padding: 12px;">Actions</th>
            </tr>
        </thead>
        <tbody>
        <#list products as product>
            <tr style="border-bottom: 1px solid #e5e7eb;">
                <td style="padding: 12px; color: #111827;">${product.id}</td>
                <td style="padding: 12px; color: #111827;">${product.name}</td>
                <td style="padding: 12px;">
                    <span style="background: #3b82f6; color: white; padding: 4px 10px; border-radius: 20px; font-size: 12px;">${product.category.name}</span>
                </td>
                <td style="padding: 12px; color: green;">$${product.price}</td>
                <td style="padding: 12px; color: #111827;">${product.stock}</td>
                <td style="padding: 12px;">
                    <a href="/products/edit/${product.id}" style="color: #2563eb; text-decoration: none; margin-right: 8px;">Edit</a>
                    <a href="/products/delete/${product.id}" style="color: #dc2626; text-decoration: none;" onclick="return confirm('Delete this product?')">Delete</a>
                </td>
            </tr>
        </#list>
        </tbody>
    </table>
</div>

</body>
</html>
