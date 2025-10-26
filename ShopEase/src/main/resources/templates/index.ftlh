<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ShopEase | Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>
<style>
        nav {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        nav a {
            color: white;
            text-decoration: none;
            padding: 10px;
            border-radius: 8px;
            font-weight: bold;
            transition: 0.3s;
            display: block;
        }

        nav a:nth-child(1) { background-color: #1e1b4b; }
        nav a:nth-child(2) { background-color: #2563eb; }
        nav a:nth-child(3) { background-color: #10b981; }
        nav a:nth-child(4) { background-color: #dc2626; }

        /* Optional hover effect for better UX */
        nav a:hover {
            transform: scale(1.05);
            opacity: 0.9;
        }
</style>


<body style="background-color: white; font-family: Arial, sans-serif; margin: 0; padding: 0; display: flex; justify-content: center; align-items: center; height: 100vh;">

<div style="background-color: #64f8c1; border-radius: 20px; box-shadow: 0 4px 10px rgba(0,0,0,0.2); width: 400px; padding: 40px; text-align: center;">

    <h1 style="color: #1e1b4b; font-size: 28px; margin-bottom: 10px;">Welcome to <span style="color: #0f172a;">ShopEase!</span></h1>
    <p style="color: #111827; font-size: 14px; margin-bottom: 30px;">Manage your store’s inventory and sales with ease.</p>

    <nav style="display: flex; flex-direction: column; gap: 12px;">
        <a href="/hello" >Say Hello</a>
        <a href="/products" >Inventory</a>
        <a href="/categories" >Categories</a>
        <a href="/login" >Login</a>
    </nav>

</div>

</body>
</html>
