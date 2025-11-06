<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>About - ShopEase</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
        }
        @keyframes pulse-slow {
            0%, 100% { opacity: 0.4; }
            50% { opacity: 0.6; }
        }
        .animate-float { animation: float 6s ease-in-out infinite; }
        .animate-pulse-slow { animation: pulse-slow 4s ease-in-out infinite; }
    </style>
</head>

<body class="min-h-screen bg-gradient-to-br from-slate-950 via-blue-950 to-slate-950">

    <!-- Background elements -->
    <div class="absolute inset-0 pointer-events-none overflow-hidden">
        <div class="absolute w-96 h-96 bg-blue-500/20 rounded-full top-0 left-1/4 filter blur-3xl animate-pulse-slow"></div>
        <div class="absolute w-80 h-80 bg-cyan-500/20 rounded-full bottom-0 right-1/4 filter blur-3xl animate-pulse-slow" style="animation-delay: 2s;"></div>
    </div>

    <!-- Navigation -->
    <nav class="relative bg-slate-900/50 backdrop-blur-md border-b border-blue-500/20 shadow-xl">
        <div class="max-w-7xl mx-auto px-6 py-4">
            <div class="flex justify-between items-center">
                <!-- Logo -->
                <a href="/" class="text-3xl font-bold bg-gradient-to-r from-blue-400 via-cyan-400 to-blue-400 bg-clip-text text-transparent">
                    SHOPEASE
                </a>

                <!-- Nav Links -->
                <div class="flex gap-8 text-slate-300">
                    <a href="/" class="hover:text-blue-400 transition-colors">Home</a>
                    <a href="/products" class="hover:text-blue-400 transition-colors">Products</a>
                    <a href="/about" class="text-blue-400 font-semibold">About</a>
                    <a href="/contact" class="hover:text-blue-400 transition-colors">Contact</a>
                </div>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="relative max-w-4xl mx-auto px-6 py-16">

        <!-- Header -->
        <div class="text-center mb-16">
            <div class="animate-float inline-flex items-center justify-center w-20 h-20 bg-gradient-to-br from-blue-500 to-cyan-500 rounded-2xl mb-6 shadow-xl">
                <svg class="w-10 h-10 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                </svg>
            </div>
            <h1 class="text-4xl font-bold bg-gradient-to-r from-blue-400 to-cyan-400 bg-clip-text text-transparent mb-4">
                About ShopEase
            </h1>
            <p class="text-slate-400 text-lg">Simplifying your shopping experience</p>
        </div>

        <!-- Mission & Vision Grid -->
        <div class="grid md:grid-cols-2 gap-8">

            <!-- Mission -->
            <div class="bg-slate-900/50 backdrop-blur-sm rounded-2xl border border-blue-500/20 p-8 hover:border-blue-500/40 transition-all duration-300">
                <div class="flex items-center mb-6">
                    <div class="w-12 h-12 bg-gradient-to-br from-blue-500 to-blue-600 rounded-xl flex items-center justify-center mr-4">
                        <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z"></path>
                        </svg>
                    </div>
                    <h2 class="text-2xl font-bold text-white">Our Mission</h2>
                </div>
                <p class="text-slate-300 leading-relaxed">
                    To provide a seamless, intuitive, and enjoyable shopping experience that connects customers
                    with quality products through innovative technology and exceptional service.
                </p>
            </div>

            <!-- Vision -->
            <div class="bg-slate-900/50 backdrop-blur-sm rounded-2xl border border-cyan-500/20 p-8 hover:border-cyan-500/40 transition-all duration-300">
                <div class="flex items-center mb-6">
                    <div class="w-12 h-12 bg-gradient-to-br from-cyan-500 to-cyan-600 rounded-xl flex items-center justify-center mr-4">
                        <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"></path>
                        </svg>
                    </div>
                    <h2 class="text-2xl font-bold text-white">Our Vision</h2>
                </div>
                <p class="text-slate-300 leading-relaxed">
                    To become the most trusted and customer-centric e-commerce platform, revolutionizing
                    online shopping with simplicity, reliability, and cutting-edge solutions for everyone.
                </p>
            </div>
        </div>

        <!-- Simple Footer -->
        <div class="text-center mt-16 pt-8 border-t border-blue-500/20">
            <p class="text-slate-400 text-sm">© 2024 ShopEase • Making shopping simple</p>
        </div>
    </div>

</body>
</html>