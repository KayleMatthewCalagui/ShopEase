<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ShopEase | Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-15px); }
        }
        .animate-float { animation: float 6s ease-in-out infinite; }
    </style>
</head>

<body class="min-h-screen flex items-center justify-center bg-gradient-to-br from-slate-950 via-blue-950 to-slate-950 relative overflow-hidden">

    <!-- Background glow effects -->
    <div class="absolute inset-0 overflow-hidden pointer-events-none">
        <div class="absolute w-96 h-96 bg-blue-500/20 rounded-full blur-3xl top-10 left-1/4 animate-float"></div>
        <div class="absolute w-80 h-80 bg-cyan-500/20 rounded-full blur-3xl bottom-10 right-1/4 animate-float"></div>
    </div>

    <!-- Login Card -->
    <div class="relative w-full max-w-md">
        <div class="absolute inset-0 bg-gradient-to-r from-blue-500 via-cyan-500 to-blue-500 rounded-3xl blur opacity-40"></div>

        <div class="relative bg-gradient-to-br from-slate-900/90 to-slate-950/90 backdrop-blur-lg rounded-3xl border border-blue-500/30 shadow-2xl p-10 text-center">
            <!-- Logo -->
            <div class="mb-8">
                <div class="inline-flex items-center justify-center w-16 h-16 bg-gradient-to-br from-blue-500 to-cyan-500 rounded-2xl mb-4 shadow-xl">
                    <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293
                            c-.63.63-.184 1.707.707 1.707H17m0 0
                            a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4
                            0 2 2 0 014 0z"></path>
                    </svg>
                </div>
                <h1 class="text-4xl font-bold bg-gradient-to-r from-blue-400 via-cyan-400 to-blue-400 bg-clip-text text-transparent">ShopEase</h1>
                <p class="text-slate-400 mt-2">Welcome back! Please login to your account.</p>
            </div>

            <!-- Login Form -->
            <form action="/login" method="post" class="space-y-5 text-left">

                <div>
                    <label class="block text-slate-300 text-sm mb-1">Username</label>
                    <input type="text" name="username" required
                        class="w-full px-4 py-3 rounded-lg bg-slate-800/70 border border-blue-500/30 text-slate-100 placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-blue-500">
                </div>

                <div>
                    <label class="block text-slate-300 text-sm mb-1">Password</label>
                    <input type="password" name="password" required
                        class="w-full px-4 py-3 rounded-lg bg-slate-800/70 border border-blue-500/30 text-slate-100 placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-blue-500">
                </div>

                <button type="submit"
                    class="w-full mt-4 bg-gradient-to-r from-blue-600 to-cyan-600 hover:from-blue-500 hover:to-cyan-500 text-white font-semibold py-3 rounded-xl shadow-lg shadow-blue-500/30 transition-all duration-300 hover:scale-[1.02]">
                    Login
                </button>
            </form>

            <!-- Error Message (Optional) -->
            <#if error??>
                <p class="mt-4 text-red-400 text-sm">Invalid username or password</p>
            </#if>

            <!-- Register Link -->
            <p class="text-slate-400 text-sm mt-6">
                Don’t have an account?
                <a href="/register" class="text-blue-400 hover:underline">Register here</a>
            </p>

            <!-- Back to Home -->
            <div class="mt-6">
                <a href="/" class="text-slate-400 text-sm hover:text-blue-400 transition-colors">
                    ← Back to Home
                </a>
            </div>
        </div>
    </div>
</body>
</html>
