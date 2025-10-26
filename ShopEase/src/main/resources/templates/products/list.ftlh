<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product List</title>
    <style>
        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
        }
        @keyframes pulse-slow {
            0%, 100% { opacity: 0.4; }
            50% { opacity: 0.6; }
        }
        .animate-float { animation: float 4s ease-in-out infinite; }
        .animate-pulse-slow { animation: pulse-slow 4s ease-in-out infinite; }

        tr:hover {
            background-color: rgba(59, 130, 246, 0.05) !important;
        }

        a.btn-primary:hover {
            background: linear-gradient(135deg, #3b82f6 0%, #06b6d4 100%);
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(59, 130, 246, 0.4);
        }

        a.edit-link:hover {
            color: #3b82f6;
        }

        a.delete-link:hover {
            color: #ef4444;
        }
    </style>
</head>
<body style="font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif; background: linear-gradient(135deg, #0f172a 0%, #1e3a8a 50%, #0f172a 100%); margin: 0; padding: 20px; min-height: 100vh; position: relative; overflow-x: hidden;">

    <!-- Animated background elements -->
    <div style="position: fixed; inset: 0; overflow: hidden; pointer-events: none; z-index: 0;">
        <div class="animate-pulse-slow" style="position: absolute; width: 384px; height: 384px; background: radial-gradient(circle, rgba(59, 130, 246, 0.2) 0%, transparent 70%); border-radius: 50%; top: 10%; left: 20%; filter: blur(60px);"></div>
        <div class="animate-pulse-slow" style="position: absolute; width: 320px; height: 320px; background: radial-gradient(circle, rgba(6, 182, 212, 0.2) 0%, transparent 70%); border-radius: 50%; bottom: 10%; right: 20%; filter: blur(60px); animation-delay: 2s;"></div>
    </div>

    <div style="position: relative; z-index: 1; max-width: 1200px; margin: 0 auto;">

        <!-- Header Section -->
        <div style="position: relative; margin-bottom: 30px;">
            <!-- Gradient border effect -->
            <div style="position: absolute; inset: 0; background: linear-gradient(135deg, #3b82f6 0%, #06b6d4 100%); border-radius: 24px; filter: blur(8px); opacity: 0.5;"></div>

            <div style="position: relative; background: linear-gradient(135deg, #1e293b 0%, #0f172a 100%); border-radius: 24px; padding: 35px 40px; border: 1px solid rgba(59, 130, 246, 0.3); box-shadow: 0 20px 60px rgba(0, 0, 0, 0.5);">

                <!-- Back Link -->
                <a href="/" style="display: inline-flex; align-items: center; gap: 6px; text-decoration: none; color: #94a3b8; font-size: 14px; margin-bottom: 20px; transition: all 0.3s;">
                    <svg style="width: 16px; height: 16px;" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"></path>
                    </svg>
                    Back to Home
                </a>

                <!-- Title and Add Button Row -->
                <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 0;">
                    <div style="display: flex; align-items: center; gap: 16px;">
                        <div class="animate-float" style="display: inline-flex; align-items: center; justify-content: center; width: 56px; height: 56px; background: linear-gradient(135deg, #3b82f6 0%, #06b6d4 100%); border-radius: 14px; box-shadow: 0 8px 24px rgba(59, 130, 246, 0.4);">
                            <svg style="width: 28px; height: 28px; color: white;" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4"></path>
                            </svg>
                        </div>
                        <h2 style="font-size: 36px; background: linear-gradient(135deg, #60a5fa 0%, #22d3ee 100%); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text; font-weight: bold; margin: 0;">
                            Product Inventory
                        </h2>
                    </div>

                    <!-- Add Product Button -->
                    <a href="/products/new" class="btn-primary" style="display: inline-flex; align-items: center; gap: 8px; background: linear-gradient(135deg, #2563eb 0%, #0891b2 100%); color: white; padding: 12px 24px; border-radius: 12px; text-decoration: none; font-weight: 600; box-shadow: 0 8px 20px rgba(37, 99, 235, 0.4); transition: all 0.3s;">
                        <svg style="width: 18px; height: 18px;" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path>
                        </svg>
                        Add Product
                    </a>
                </div>
            </div>
        </div>

        <!-- Table Section -->
        <div style="position: relative;">
            <!-- Gradient border effect -->
            <div style="position: absolute; inset: 0; background: linear-gradient(135deg, #3b82f6 0%, #06b6d4 100%); border-radius: 24px; filter: blur(8px); opacity: 0.3;"></div>

            <div style="position: relative; background: linear-gradient(135deg, #1e293b 0%, #0f172a 100%); border-radius: 24px; padding: 30px; border: 1px solid rgba(59, 130, 246, 0.3); box-shadow: 0 20px 60px rgba(0, 0, 0, 0.5); overflow: hidden;">

                <div style="overflow-x: auto;">
                    <table style="width: 100%; border-collapse: collapse; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;">
                        <thead>
                            <tr style="background: rgba(59, 130, 246, 0.1); border-bottom: 2px solid rgba(59, 130, 246, 0.3);">
                                <th style="padding: 16px; text-align: left; color: #60a5fa; font-weight: 600; font-size: 14px; text-transform: uppercase; letter-spacing: 0.5px;">ID</th>
                                <th style="padding: 16px; text-align: left; color: #60a5fa; font-weight: 600; font-size: 14px; text-transform: uppercase; letter-spacing: 0.5px;">Name</th>
                                <th style="padding: 16px; text-align: left; color: #60a5fa; font-weight: 600; font-size: 14px; text-transform: uppercase; letter-spacing: 0.5px;">Category</th>
                                <th style="padding: 16px; text-align: left; color: #60a5fa; font-weight: 600; font-size: 14px; text-transform: uppercase; letter-spacing: 0.5px;">Price</th>
                                <th style="padding: 16px; text-align: left; color: #60a5fa; font-weight: 600; font-size: 14px; text-transform: uppercase; letter-spacing: 0.5px;">Stock</th>
                                <th style="padding: 16px; text-align: left; color: #60a5fa; font-weight: 600; font-size: 14px; text-transform: uppercase; letter-spacing: 0.5px;">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                        <#list products as product>
                            <tr style="border-bottom: 1px solid rgba(59, 130, 246, 0.1); transition: all 0.3s;">
                                <td style="padding: 16px; color: #94a3b8; font-weight: 500;">#${product.id}</td>
                                <td style="padding: 16px; color: #e2e8f0; font-weight: 600;">${product.name}</td>
                                <td style="padding: 16px;">
                                    <span style="background: linear-gradient(135deg, #3b82f6 0%, #06b6d4 100%); color: white; padding: 6px 14px; border-radius: 20px; font-size: 12px; font-weight: 600; display: inline-block;">${product.category.name}</span>
                                </td>
                                <td style="padding: 16px; color: #22d3ee; font-weight: 700; font-size: 16px;">$${product.price}</td>
                                <td style="padding: 16px;">
                                    <span style="background: rgba(6, 182, 212, 0.15); color: #22d3ee; padding: 6px 14px; border-radius: 8px; font-size: 13px; font-weight: 600; border: 1px solid rgba(6, 182, 212, 0.3);">${product.stock} units</span>
                                </td>
                                <td style="padding: 16px;">
                                    <div style="display: flex; gap: 12px;">
                                        <a href="/products/edit/${product.id}" class="edit-link" style="color: #60a5fa; text-decoration: none; font-weight: 600; font-size: 14px; display: inline-flex; align-items: center; gap: 4px; transition: all 0.3s;">
                                            <svg style="width: 16px; height: 16px;" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
                                            </svg>
                                            Edit
                                        </a>
                                        <a href="/products/delete/${product.id}" class="delete-link" style="color: #f87171; text-decoration: none; font-weight: 600; font-size: 14px; display: inline-flex; align-items: center; gap: 4px; transition: all 0.3s;" onclick="return confirm('Delete this product?')">
                                            <svg style="width: 16px; height: 16px;" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path>
                                            </svg>
                                            Delete
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </#list>
                        </tbody>
                    </table>
                </div>

                <!-- Footer Info -->
                <div style="margin-top: 25px; padding-top: 20px; border-top: 1px solid rgba(59, 130, 246, 0.2); text-align: center;">
                    <p style="color: #94a3b8; font-size: 14px; margin: 0;">
                        Showing <span style="color: #60a5fa; font-weight: 600;">${products?size}</span> products •
                        <a href="/" style="color: #60a5fa; font-weight: 600; text-decoration: none; margin-left: 4px; transition: color 0.3s;">Back to Dashboard</a>
                    </p>
                </div>
            </div>
        </div>

        <!-- Floating elements -->
        <div class="animate-pulse-slow" style="position: absolute; top: -24px; right: 10%; width: 128px; height: 128px; background: radial-gradient(circle, rgba(59, 130, 246, 0.3) 0%, transparent 70%); border-radius: 50%; filter: blur(30px); pointer-events: none; z-index: 0;"></div>
    </div>

</body>
</html>