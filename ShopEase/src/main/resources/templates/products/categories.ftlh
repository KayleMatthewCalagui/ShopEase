<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${(category?? && category.id??)?then("Edit Category", "Add Category")}</title>
    <style>
        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
        }
        @keyframes pulse-slow {
            0%, 100% { opacity: 0.3; }
            50% { opacity: 0.5; }
        }
        .animate-float { animation: float 4s ease-in-out infinite; }
        .animate-pulse-slow { animation: pulse-slow 4s ease-in-out infinite; }

        input:focus {
            outline: none;
            border-color: #3b82f6;
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
        }

        button:hover {
            background: linear-gradient(135deg, #3b82f6 0%, #06b6d4 100%);
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(59, 130, 246, 0.3);
        }

        button:active {
            transform: translateY(0px);
        }
    </style>
</head>

<body style="background: linear-gradient(135deg, #0f172a 0%, #1e3a8a 50%, #0f172a 100%); min-height: 100vh; display: flex; align-items: center; justify-content: center; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif; margin: 0; padding: 20px; position: relative; overflow: hidden;">

    <!-- Animated background elements -->
    <div style="position: absolute; inset: 0; overflow: hidden; pointer-events: none;">
        <div class="animate-pulse-slow" style="position: absolute; width: 384px; height: 384px; background: radial-gradient(circle, rgba(59, 130, 246, 0.2) 0%, transparent 70%); border-radius: 50%; top: 0; left: 25%; filter: blur(60px);"></div>
        <div class="animate-pulse-slow" style="position: absolute; width: 320px; height: 320px; background: radial-gradient(circle, rgba(6, 182, 212, 0.2) 0%, transparent 70%); border-radius: 50%; bottom: 0; right: 25%; filter: blur(60px); animation-delay: 2s;"></div>
    </div>

    <div style="position: relative; width: 100%; max-width: 480px;">
        <!-- Gradient border effect -->
        <div style="position: absolute; inset: 0; background: linear-gradient(135deg, #3b82f6 0%, #06b6d4 100%); border-radius: 24px; filter: blur(8px); opacity: 0.5;"></div>

        <div style="position: relative; background: linear-gradient(135deg, #1e293b 0%, #0f172a 100%); border-radius: 24px; box-shadow: 0 20px 60px rgba(0, 0, 0, 0.5); border: 1px solid rgba(59, 130, 246, 0.3); padding: 40px;">

            <!-- Back link -->
            <a href="/" style="text-decoration: none; color: #94a3b8; font-size: 14px; display: inline-flex; align-items: center; gap: 6px; margin-bottom: 20px; transition: all 0.3s;">
                <svg style="width: 16px; height: 16px;" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"></path>
                </svg>
                Back to Home
            </a>

            <!-- Icon and Title -->
            <div style="text-align: center; margin-bottom: 35px;">
                <div class="animate-float" style="display: inline-flex; align-items: center; justify-content: center; width: 64px; height: 64px; background: linear-gradient(135deg, #3b82f6 0%, #06b6d4 100%); border-radius: 16px; margin-bottom: 20px; box-shadow: 0 8px 24px rgba(59, 130, 246, 0.4);">
                    <svg style="width: 32px; height: 32px; color: white;" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 7h.01M7 3h5c.512 0 1.024.195 1.414.586l7 7a2 2 0 010 2.828l-7 7a2 2 0 01-2.828 0l-7-7A1.994 1.994 0 013 12V7a4 4 0 014-4z"></path>
                    </svg>
                </div>

                <h2 style="font-size: 32px; background: linear-gradient(135deg, #60a5fa 0%, #22d3ee 100%); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text; font-weight: bold; margin: 0;">
                    ${(category?? && category.id??)?then("Edit Category", "Add Category")}
                </h2>
            </div>

            <form action="/categories" method="post" style="display: flex; flex-direction: column; gap: 20px;">
                <#if category?? && category.id??>
                    <input type="hidden" name="id" value="${category.id}">
                </#if>

                <!-- Category Name -->
                <div style="width: 100%;">
                    <label style="display: block; font-weight: 600; color: #e2e8f0; margin-bottom: 8px; font-size: 14px;">Category Name</label>
                    <input type="text" name="name" value="${category.name!''}" required
                           placeholder="Enter category name..."
                           style="width: 100%; box-sizing: border-box; padding: 14px 16px; border: 1px solid rgba(59, 130, 246, 0.2); border-radius: 12px; background-color: rgba(30, 41, 59, 0.5); color: #e2e8f0; font-size: 15px; transition: all 0.3s;">
                </div>

                <!-- Info Box -->
                <div style="background: rgba(59, 130, 246, 0.1); border: 1px solid rgba(59, 130, 246, 0.3); border-radius: 12px; padding: 14px; display: flex; gap: 12px; align-items: start;">
                    <svg style="width: 20px; height: 20px; color: #60a5fa; flex-shrink: 0; margin-top: 2px;" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                    </svg>
                    <p style="color: #94a3b8; font-size: 13px; margin: 0; line-height: 1.5;">
                        Categories help organize your products. Choose a clear, descriptive name that's easy to remember.
                    </p>
                </div>

                <!-- Submit Button -->
                <button type="submit"
                        style="width: 100%; background: linear-gradient(135deg, #2563eb 0%, #0891b2 100%); color: white; font-weight: 600; font-size: 16px; padding: 16px; border: none; border-radius: 12px; cursor: pointer; box-shadow: 0 8px 20px rgba(37, 99, 235, 0.4); transition: all 0.3s; margin-top: 10px;">
                    ${(category?? && category.id??)?then("Update Category", "Create Category")}
                </button>
            </form>

            <!-- Footer -->
            <div style="text-align: center; margin-top: 25px; padding-top: 25px; border-top: 1px solid rgba(59, 130, 246, 0.2);">
                <p style="color: #94a3b8; font-size: 14px; margin: 0;">
                    Need to cancel?
                    <a href="/categories" style="color: #60a5fa; font-weight: 600; text-decoration: none; margin-left: 4px; transition: color 0.3s;">View All Categories</a>
                </p>
            </div>
        </div>

        <!-- Floating elements -->
        <div class="animate-pulse-slow" style="position: absolute; top: -24px; right: -24px; width: 128px; height: 128px; background: radial-gradient(circle, rgba(59, 130, 246, 0.3) 0%, transparent 70%); border-radius: 50%; filter: blur(30px); pointer-events: none;"></div>
        <div class="animate-pulse-slow" style="position: absolute; bottom: -24px; left: -24px; width: 160px; height: 160px; background: radial-gradient(circle, rgba(6, 182, 212, 0.3) 0%, transparent 70%); border-radius: 50%; filter: blur(30px); pointer-events: none; animation-delay: 2s;"></div>
    </div>

</body>
</html>