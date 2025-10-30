<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ShopEase | Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-20px); }
        }
        @keyframes pulse-slow {
            0%, 100% { opacity: 0.4; }
            50% { opacity: 0.6; }
        }
        @keyframes shimmer {
            0% { background-position: -200% center; }
            100% { background-position: 200% center; }
        }
        .animate-float { animation: float 6s ease-in-out infinite; }
        .animate-pulse-slow { animation: pulse-slow 4s ease-in-out infinite; }
        .animate-shimmer {
            background-size: 200% 100%;
            animation: shimmer 3s linear infinite;
        }
    </style>
</head>

<body class="min-h-screen bg-gradient-to-br from-slate-950 via-blue-950 to-slate-950 flex items-center justify-center p-4 relative ">

    <!-- Animated background elements -->
    <div class="absolute inset-0  pointer-events-none">
        <div class="absolute w-96 h-96 bg-blue-500/20 rounded-full blur-3xl top-0 left-1/4 animate-pulse-slow"></div>
        <div class="absolute w-80 h-80 bg-cyan-500/20 rounded-full blur-3xl bottom-0 right-1/4 animate-pulse-slow"></div>
        <div class="absolute w-64 h-64 bg-blue-400/10 rounded-full blur-3xl top-1/2 left-0 animate-pulse-slow"></div>
    </div>

    <div class="relative w-full max-w-lg">
        <!-- Premium card with gradient border -->
        <div class="relative">
            <!-- Gradient border effect -->
            <div class="absolute inset-0 bg-gradient-to-r from-blue-500 via-cyan-500 to-blue-500 rounded-3xl blur-sm opacity-50"></div>

            <div class="relative bg-gradient-to-br from-slate-900 to-slate-950 rounded-3xl shadow-2xl border border-blue-500/30 p-8 sm:p-12">

                <!-- Header -->
                <div class="text-center mb-10">
                    <div class="inline-flex items-center justify-center w-20 h-20 bg-gradient-to-br from-blue-500 to-cyan-500 rounded-2xl mb-6 shadow-xl hover:scale-110 transition-transform duration-300 animate-float">
                        <svg class="w-10 h-10 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z"></path>
                        </svg>
                    </div>

                    <h1 class="text-6xl font-bold mb-4 bg-gradient-to-r from-blue-400 via-cyan-400 to-blue-400 bg-clip-text text-transparent">
                        ShopEase
                    </h1>

                    <p class="text-slate-300 text-lg leading-relaxed max-w-md mx-auto">
                        Transform your store management experience with powerful tools designed for modern commerce
                    </p>
                </div>

                <!-- Features -->
                <div class="grid grid-cols-3 gap-3 mb-10">
                    <div class="flex flex-col items-center gap-2 p-4 rounded-xl bg-gradient-to-br from-blue-500/10 to-cyan-500/10 hover:from-blue-500/20 hover:to-cyan-500/20 transition-all duration-300 group border border-blue-400/20">
                        <div class="w-10 h-10 rounded-lg bg-blue-500/20 flex items-center justify-center group-hover:bg-blue-500/30 transition-colors">
                            <svg class="w-5 h-5 text-blue-400 group-hover:scale-110 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 7h8m0 0v8m0-8l-8 8-4-4-6 6"></path>
                            </svg>
                        </div>
                        <span class="text-xs text-slate-300 text-center font-medium">Analytics</span>
                    </div>
                    <div class="flex flex-col items-center gap-2 p-4 rounded-xl bg-gradient-to-br from-blue-500/10 to-cyan-500/10 hover:from-blue-500/20 hover:to-cyan-500/20 transition-all duration-300 group border border-blue-400/20">
                        <div class="w-10 h-10 rounded-lg bg-blue-500/20 flex items-center justify-center group-hover:bg-blue-500/30 transition-colors">
                            <svg class="w-5 h-5 text-blue-400 group-hover:scale-110 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"></path>
                            </svg>
                        </div>
                        <span class="text-xs text-slate-300 text-center font-medium">Secure</span>
                    </div>
                    <div class="flex flex-col items-center gap-2 p-4 rounded-xl bg-gradient-to-br from-blue-500/10 to-cyan-500/10 hover:from-blue-500/20 hover:to-cyan-500/20 transition-all duration-300 group border border-blue-400/20">
                        <div class="w-10 h-10 rounded-lg bg-blue-500/20 flex items-center justify-center group-hover:bg-blue-500/30 transition-colors">
                            <svg class="w-5 h-5 text-blue-400 group-hover:scale-110 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z"></path>
                            </svg>
                        </div>
                        <span class="text-xs text-slate-300 text-center font-medium">Fast</span>
                    </div>
                </div>

                <!-- Navigation buttons -->
                <nav class="flex flex-col gap-3 mb-8">
                    <a href="/products/store" class="group relative bg-gradient-to-r from-blue-600 to-cyan-600 text-white font-semibold py-4 px-6 rounded-xl shadow-lg shadow-blue-500/50 hover:shadow-xl hover:shadow-blue-500/60 transform hover:-translate-y-1 hover:scale-[1.02] transition-all duration-300 ">
                        <div class="absolute inset-0 bg-gradient-to-r from-blue-500 to-cyan-500 opacity-0 group-hover:opacity-100 transition-opacity duration-300"></div>
                        <div class="relative flex items-center justify-center gap-3">
                            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 3v4M3 5h4M6 17v4m-2-2h4m5-16l2.286 6.857L21 12l-5.714 2.143L13 21l-2.286-6.857L5 12l5.714-2.143L13 3z"></path>
                            </svg>
                            <span>Product Page</span>
                        </div>
                    </a>

                    <a href="/products" class="group relative bg-slate-800/50 hover:bg-slate-800 text-slate-200 font-semibold py-4 px-6 rounded-xl border border-blue-500/20 hover:border-blue-500/40 shadow-lg transform hover:-translate-y-1 transition-all duration-300">
                        <div class="relative flex items-center justify-center gap-3">
                            <svg class="w-5 h-5 text-blue-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4"></path>
                            </svg>
                            <span>Inventory</span>
                        </div>
                    </a>

                    <a href="/categories" class="group relative bg-slate-800/50 hover:bg-slate-800 text-slate-200 font-semibold py-4 px-6 rounded-xl border border-blue-500/20 hover:border-blue-500/40 shadow-lg transform hover:-translate-y-1 transition-all duration-300">
                        <div class="relative flex items-center justify-center gap-3">
                            <svg class="w-5 h-5 text-blue-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 5a1 1 0 011-1h4a1 1 0 011 1v7a1 1 0 01-1 1H5a1 1 0 01-1-1V5zM14 5a1 1 0 011-1h4a1 1 0 011 1v7a1 1 0 01-1 1h-4a1 1 0 01-1-1V5zM4 16a1 1 0 011-1h4a1 1 0 011 1v3a1 1 0 01-1 1H5a1 1 0 01-1-1v-3zM14 16a1 1 0 011-1h4a1 1 0 011 1v3a1 1 0 01-1 1h-4a1 1 0 01-1-1v-3z"></path>
                            </svg>
                            <span>Categories</span>
                        </div>
                    </a>

                    <a href="/login" class="group relative bg-slate-800/50 hover:bg-slate-800 text-slate-200 font-semibold py-4 px-6 rounded-xl border border-blue-500/20 hover:border-blue-500/40 shadow-lg transform hover:-translate-y-1 transition-all duration-300">
                        <div class="relative flex items-center justify-center gap-3">
                            <svg class="w-5 h-5 text-blue-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 16l-4-4m0 0l4-4m-4 4h14m-5 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h7a3 3 0 013 3v1"></path>
                            </svg>
                            <span>Login</span>
                        </div>
                    </a>
                </nav>

                <!-- Footer -->
                <div class="pt-6 border-t border-blue-500/20 text-center">
                    <p class="text-sm text-slate-400">
                        © 2025 ShopEase • Powered by Innovation
                    </p>
                </div>
            </div>
        </div>

        <!-- Enhanced floating elements -->
        <div class="absolute -top-6 -right-6 w-32 h-32 bg-gradient-to-br from-blue-500/30 to-cyan-500/30 rounded-full blur-2xl animate-pulse pointer-events-none"></div>
        <div class="absolute -bottom-6 -left-6 w-40 h-40 bg-gradient-to-br from-cyan-500/30 to-blue-500/30 rounded-full blur-2xl animate-pulse-slow pointer-events-none"></div>
    </div>

</body>
</html>