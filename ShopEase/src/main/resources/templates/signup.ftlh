<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ShopEase | Register</title>
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

    <!-- Registration Card -->
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
                <p class="text-slate-400 mt-2">Create your user account</p>
            </div>

            <!-- Registration Form -->
            <form action="/register" method="post" class="space-y-5 text-left">

                <div class="grid grid-cols-2 gap-4">
                    <div>
                        <label class="block text-slate-300 text-sm mb-1">First Name *</label>
                        <input type="text" name="firstName" required
                            class="w-full px-4 py-3 rounded-lg bg-slate-800/70 border border-blue-500/30 text-slate-100 placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-blue-500"
                            placeholder="John">
                    </div>

                    <div>
                        <label class="block text-slate-300 text-sm mb-1">Last Name *</label>
                        <input type="text" name="lastName" required
                            class="w-full px-4 py-3 rounded-lg bg-slate-800/70 border border-blue-500/30 text-slate-100 placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-blue-500"
                            placeholder="Doe">
                    </div>
                </div>

                <div>
                    <label class="block text-slate-300 text-sm mb-1">Username *</label>
                    <input type="text" name="username" required
                        class="w-full px-4 py-3 rounded-lg bg-slate-800/70 border border-blue-500/30 text-slate-100 placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-blue-500"
                        placeholder="johndoe">
                </div>

                <div>
                    <label class="block text-slate-300 text-sm mb-1">Password *</label>
                    <input type="password" name="password" required minlength="6"
                        class="w-full px-4 py-3 rounded-lg bg-slate-800/70 border border-blue-500/30 text-slate-100 placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-blue-500"
                        placeholder="At least 6 characters">
                </div>

                <div>
                    <label class="block text-slate-300 text-sm mb-1">Confirm Password *</label>
                    <input type="password" name="confirmPassword" required minlength="6"
                        class="w-full px-4 py-3 rounded-lg bg-slate-800/70 border border-blue-500/30 text-slate-100 placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-blue-500"
                        placeholder="Confirm your password">
                </div>

                <button type="submit"
                    class="w-full mt-4 bg-gradient-to-r from-blue-600 to-cyan-600 hover:from-blue-500 hover:to-cyan-500 text-white font-semibold py-3 rounded-xl shadow-lg shadow-blue-500/30 transition-all duration-300 hover:scale-[1.02]">
                    Create Account
                </button>
            </form>

            <!-- Static Messages (remove the Thymeleaf/Freemarker conditionals) -->
            <!-- Success message will show after redirect -->
            <!-- Error message will show after redirect -->

            <!-- Login Link -->
            <p class="text-slate-400 text-sm mt-6">
                Already have an account?
                <a href="/login" class="text-blue-400 hover:underline">Login here</a>
            </p>

            <!-- Back to Home -->
            <div class="mt-6">
                <a href="/" class="text-slate-400 text-sm hover:text-blue-400 transition-colors">
                    ← Back to Home
                </a>
            </div>
        </div>
    </div>

    <!-- Password Match Validation Script -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const password = document.querySelector('input[name="password"]');
            const confirmPassword = document.querySelector('input[name="confirmPassword"]');
            const form = document.querySelector('form');

            function validatePassword() {
                if (password.value !== confirmPassword.value) {
                    confirmPassword.setCustomValidity("Passwords don't match");
                    confirmPassword.style.borderColor = '#f87171';
                } else {
                    confirmPassword.setCustomValidity('');
                    confirmPassword.style.borderColor = '';
                }
            }

            password.addEventListener('change', validatePassword);
            confirmPassword.addEventListener('keyup', validatePassword);

            form.addEventListener('submit', function(e) {
                validatePassword();
                if (!confirmPassword.validity.valid) {
                    e.preventDefault();
                }
            });
        });
    </script>
</body>
</html>