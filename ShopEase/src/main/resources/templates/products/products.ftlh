<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ShopEase | Products</title>
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
        .animate-float { animation: float 6s ease-in-out infinite; }
        .animate-pulse-slow { animation: pulse-slow 4s ease-in-out infinite; }
    </style>
</head>

<body class="min-h-screen bg-gradient-to-br from-slate-950 via-blue-950 to-slate-950">

    <!-- Animated background elements -->
    <div class="absolute inset-0 pointer-events-none overflow-hidden">
        <div class="absolute w-96 h-96 bg-blue-500/20 rounded-full blur-3xl top-0 left-1/4 animate-pulse-slow"></div>
        <div class="absolute w-80 h-80 bg-cyan-500/20 rounded-full blur-3xl bottom-0 right-1/4 animate-pulse-slow"></div>
    </div>

    <!-- Navigation -->
    <nav class="relative bg-slate-900/50 backdrop-blur-md border-b border-blue-500/20 shadow-xl">
        <div class="max-w-7xl mx-auto px-6 py-4">
            <div class="flex justify-between items-center">
                <!-- Logo -->
                <a href="/" class="text-3xl font-bold bg-gradient-to-r from-blue-400 via-cyan-400 to-blue-400 bg-clip-text text-transparent hover:scale-105 transition-transform">
                    SHOPEASE
                </a>

                <!-- Nav Links -->
                <ul class="hidden md:flex gap-8 text-slate-300">
                    <li><a href="/products" class="hover:text-blue-400 transition-colors">Products</a></li>
                    <li><a href="/categories" class="hover:text-blue-400 transition-colors">Categories</a></li>
                    <li><a href="/about" class="hover:text-blue-400 transition-colors">About</a></li>
                    <li><a href="/contact" class="hover:text-blue-400 transition-colors">Contact</a></li>
                </ul>

                <!-- Cart Icon (View Cart) -->
                <a href="/cart/view"
                class="w-12 h-12 rounded-full border-2 border-blue-400/50 flex items-center justify-center 
                        hover:bg-blue-500/20 hover:border-blue-400 transition-all group relative">

                    <!-- Cart SVG Icon -->
                    <svg class="w-5 h-5 text-blue-400 group-hover:scale-110 transition-transform"
                        fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0
                                a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z"></path>
                    </svg>
                </a>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="relative bg-gradient-to-r from-slate-800/80 via-blue-900/80 to-slate-800/80 backdrop-blur-sm">
        <div class="max-w-7xl mx-auto px-6 py-24">
            <div class="flex items-center justify-between">
                <div class="max-w-xl">
                    <h1 class="text-5xl md:text-6xl font-bold text-white mb-4">
                        NEW SEASON ARRIVALS.
                    </h1>
                    <p class="text-slate-300 text-sm tracking-widest mb-8">
                        CHECK OUT ALL THE NEW TRENDS
                    </p>
                    <button class="bg-white text-slate-900 px-8 py-3 font-semibold hover:bg-slate-100 transition-all hover:scale-105 shadow-xl">
                        SHOP NOW
                    </button>
                </div>
                <div class="hidden lg:block">
                    <div class="w-64 h-64 bg-gradient-to-br from-blue-500/30 to-cyan-500/30 rounded-full blur-3xl animate-float"></div>
                </div>
            </div>
        </div>
    </section>

    <!-- Latest Products Section -->
    <section class="relative py-16">
        <div class="max-w-7xl mx-auto px-6">
            <h2 class="text-3xl font-bold text-center text-white mb-12 tracking-wider">
                LATEST PRODUCTS
            </h2>

            <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                <#list latestProducts as product>
                <div class="group relative bg-slate-900/50 backdrop-blur-sm rounded-2xl border border-blue-500/20 hover:border-blue-500/40 overflow-hidden transition-all duration-300 hover:scale-105 hover:shadow-2xl hover:shadow-blue-500/20">
                    <#if product.discount??>
                    <div class="absolute top-4 left-4 bg-red-500 text-white text-xs font-bold px-3 py-1 rounded-full z-10">
                        -${product.discount}%
                    </div>
                    </#if>

                    <div class="aspect-square bg-slate-800/50 flex items-center justify-center p-8">
                        <div class="w-full h-full bg-gradient-to-br from-blue-500/10 to-cyan-500/10 rounded-xl flex items-center justify-center">
                            <svg class="w-24 h-24 text-blue-400/30" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1" d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4"></path>
                            </svg>
                        </div>
                    </div>

                    <div class="p-6 text-center">
                        <h3 class="text-slate-400 text-sm mb-2 uppercase tracking-wider">
                            ${product.name}
                        </h3>

                        <p class="text-white font-bold text-lg">
                            $${product.price?string["0.00"]}
                        </p>

                        <p class="text-slate-400 text-sm mb-3">
                            In Stock: <span class="text-blue-400 font-semibold">${product.stock}</span>
                        </p>
                    </div>

                    <!-- Add to Cart Button -->
                    <form action="/cart/add" method="post" class="mt-4">
                        <input type="hidden" name="productId" value="${product.id}">
                        <input type="hidden" name="quantity" value="1">
                        <button type="submit"
                            class="w-full bg-blue-500 hover:bg-blue-600 text-white font-semibold py-2 rounded-lg shadow-md transition-all hover:scale-105">
                            Add to Cart
                        </button>
                    </form>
                </div>
                </#list>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="relative bg-slate-900/80 backdrop-blur-md border-t border-blue-500/20 mt-16">
        <div class="max-w-7xl mx-auto px-6 py-12">


            <!-- Social Icons -->
            <div class="flex justify-center gap-6 mt-8 pt-8 border-t border-blue-500/20">
                <a href="#" class="w-10 h-10 rounded-full bg-slate-800/50 border border-blue-500/20 flex items-center justify-center hover:bg-blue-500/20 hover:border-blue-400 transition-all">
                    <svg class="w-5 h-5 text-slate-400 hover:text-blue-400" fill="currentColor" viewBox="0 0 24 24"><path d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z"/></svg>
                </a>
                <a href="#" class="w-10 h-10 rounded-full bg-slate-800/50 border border-blue-500/20 flex items-center justify-center hover:bg-blue-500/20 hover:border-blue-400 transition-all">
                    <svg class="w-5 h-5 text-slate-400 hover:text-blue-400" fill="currentColor" viewBox="0 0 24 24"><path d="M23.953 4.57a10 10 0 01-2.825.775 4.958 4.958 0 002.163-2.723c-.951.555-2.005.959-3.127 1.184a4.92 4.92 0 00-8.384 4.482C7.69 8.095 4.067 6.13 1.64 3.162a4.822 4.822 0 00-.666 2.475c0 1.71.87 3.213 2.188 4.096a4.904 4.904 0 01-2.228-.616v.06a4.923 4.923 0 003.946 4.827 4.996 4.996 0 01-2.212.085 4.936 4.936 0 004.604 3.417 9.867 9.867 0 01-6.102 2.105c-.39 0-.779-.023-1.17-.067a13.995 13.995 0 007.557 2.209c9.053 0 13.998-7.496 13.998-13.985 0-.21 0-.42-.015-.63A9.935 9.935 0 0024 4.59z"/></svg>
                </a>
                <a href="#" class="w-10 h-10 rounded-full bg-slate-800/50 border border-blue-500/20 flex items-center justify-center hover:bg-blue-500/20 hover:border-blue-400 transition-all">
                    <svg class="w-5 h-5 text-slate-400 hover:text-blue-400" fill="currentColor" viewBox="0 0 24 24"><path d="M12 0C8.74 0 8.333.015 7.053.072 5.775.132 4.905.333 4.14.63c-.789.306-1.459.717-2.126 1.384S.935 3.35.63 4.14C.333 4.905.131 5.775.072 7.053.012 8.333 0 8.74 0 12s.015 3.667.072 4.947c.06 1.277.261 2.148.558 2.913.306.788.717 1.459 1.384 2.126.667.666 1.336 1.079 2.126 1.384.766.296 1.636.499 2.913.558C8.333 23.988 8.74 24 12 24s3.667-.015 4.947-.072c1.277-.06 2.148-.262 2.913-.558.788-.306 1.459-.718 2.126-1.384.666-.667 1.079-1.335 1.384-2.126.296-.765.499-1.636.558-2.913.06-1.28.072-1.687.072-4.947s-.015-3.667-.072-4.947c-.06-1.277-.262-2.149-.558-2.913-.306-.789-.718-1.459-1.384-2.126C21.319 1.347 20.651.935 19.86.63c-.765-.297-1.636-.499-2.913-.558C15.667.012 15.26 0 12 0zm0 2.16c3.203 0 3.585.016 4.85.071 1.17.055 1.805.249 2.227.415.562.217.96.477 1.382.896.419.42.679.819.896 1.381.164.422.36 1.057.413 2.227.057 1.266.07 1.646.07 4.85s-.015 3.585-.074 4.85c-.061 1.17-.256 1.805-.421 2.227-.224.562-.479.96-.899 1.382-.419.419-.824.679-1.38.896-.42.164-1.065.36-2.235.413-1.274.057-1.649.07-4.859.07-3.211 0-3.586-.015-4.859-.074-1.171-.061-1.816-.256-2.236-.421-.569-.224-.96-.479-1.379-.899-.421-.419-.69-.824-.9-1.38-.165-.42-.359-1.065-.42-2.235-.045-1.26-.061-1.649-.061-4.844 0-3.196.016-3.586.061-4.861.061-1.17.255-1.814.42-2.234.21-.57.479-.96.9-1.381.419-.419.81-.689 1.379-.898.42-.166 1.051-.361 2.221-.421 1.275-.045 1.65-.06 4.859-.06l.045.03zm0 3.678c-3.405 0-6.162 2.76-6.162 6.162 0 3.405 2.76 6.162 6.162 6.162 3.405 0 6.162-2.76 6.162-6.162 0-3.405-2.76-6.162-6.162-6.162zM12 16c-2.21 0-4-1.79-4-4s1.79-4 4-4 4 1.79 4 4-1.79 4-4 4zm7.846-10.405c0 .795-.646 1.44-1.44 1.44-.795 0-1.44-.646-1.44-1.44 0-.794.646-1.439 1.44-1.439.793-.001 1.44.645 1.44 1.439z"/></svg>
                </a>
            </div>

            <div class="text-center mt-8 pt-8 border-t border-blue-500/20">
                <p class="text-slate-400 text-sm">© 2025 ShopEase • All Rights Reserved</p>
            </div>
        </div>
    </footer>

</body>
</html>