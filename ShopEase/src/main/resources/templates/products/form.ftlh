<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${(product?? && product.id??)?then("Edit Product", "Add Product")}</title>
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

        input:focus, select:focus {
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

        .image-upload-container {
            position: relative;
            width: 100%;
            min-height: 200px;
            border: 2px dashed rgba(59, 130, 246, 0.3);
            border-radius: 12px;
            background-color: rgba(30, 41, 59, 0.3);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.3s;
            overflow: hidden;
        }

        .image-upload-container:hover {
            border-color: rgba(59, 130, 246, 0.6);
            background-color: rgba(30, 41, 59, 0.5);
        }

        .image-preview {
            width: 100%;
            height: 100%;
            object-fit: contain;
            max-height: 300px;
        }

        .upload-placeholder {
            text-align: center;
            padding: 40px 20px;
        }

        .remove-image-btn {
            position: absolute;
            top: 10px;
            right: 10px;
            background: rgba(239, 68, 68, 0.9);
            color: white;
            border: none;
            border-radius: 50%;
            width: 32px;
            height: 32px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.3s;
            z-index: 10;
        }

        .remove-image-btn:hover {
            background: rgba(220, 38, 38, 1);
            transform: scale(1.1);
        }

        #imageInput {
            display: none;
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
            <a href="/products" style="text-decoration: none; color: #94a3b8; font-size: 14px; display: inline-flex; align-items: center; gap: 6px; margin-bottom: 20px; transition: all 0.3s;">
                <svg style="width: 16px; height: 16px;" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"></path>
                </svg>
                Back to Products
            </a>

            <!-- Icon and Title -->
            <div style="text-align: center; margin-bottom: 35px;">
                <div class="animate-float" style="display: inline-flex; align-items: center; justify-content: center; width: 64px; height: 64px; background: linear-gradient(135deg, #3b82f6 0%, #06b6d4 100%); border-radius: 16px; margin-bottom: 20px; box-shadow: 0 8px 24px rgba(59, 130, 246, 0.4);">
                    <svg style="width: 32px; height: 32px; color: white;" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4"></path>
                    </svg>
                </div>

                <h2 style="font-size: 32px; background: linear-gradient(135deg, #60a5fa 0%, #22d3ee 100%); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text; font-weight: bold; margin: 0;">
                    ${(product?? && product.id??)?then("Edit Product", "Add Product")}
                </h2>
            </div>

            <form action="/products/save" method="post" enctype="multipart/form-data" style="display: flex; flex-direction: column; gap: 20px;">
                <#if product?? && product.id??>
                    <input type="hidden" name="id" value="${product.id}">
                </#if>

                <!-- Image Upload -->
                <div style="width: 100%;">
                    <label style="display: block; font-weight: 600; color: #e2e8f0; margin-bottom: 8px; font-size: 14px;">Product Image</label>
                    <div class="image-upload-container" id="imageUploadContainer" onclick="document.getElementById('imageInput').click()">
                        <div class="upload-placeholder" id="uploadPlaceholder">
                            <svg style="width: 48px; height: 48px; color: #60a5fa; margin: 0 auto 12px;" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                            </svg>
                            <p style="color: #e2e8f0; margin: 0 0 4px 0; font-size: 14px; font-weight: 500;">Click to upload product image</p>
                            <p style="color: #94a3b8; margin: 0; font-size: 12px;">PNG, JPG, GIF up to 10MB</p>
                        </div>
                        <img id="imagePreview" class="image-preview" style="display: none;" alt="Product preview">
                        <button type="button" id="removeImageBtn" class="remove-image-btn" style="display: none;" onclick="event.stopPropagation(); removeImage()">
                            <svg style="width: 18px; height: 18px;" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
                            </svg>
                        </button>
                    </div>
                    <input type="file" id="imageInput" name="image" accept="image/*" onchange="previewImage(event)">
                </div>

                <!-- Name -->
                <div style="width: 100%;">
                    <label style="display: block; font-weight: 600; color: #e2e8f0; margin-bottom: 8px; font-size: 14px;">Product Name</label>
                    <input type="text" name="name" value="${product.name!''}" required
                           style="width: 100%; box-sizing: border-box; padding: 14px 16px; border: 1px solid rgba(59, 130, 246, 0.2); border-radius: 12px; background-color: rgba(30, 41, 59, 0.5); color: #e2e8f0; font-size: 15px; transition: all 0.3s;">
                </div>

                <!-- Category -->
                <div style="width: 100%;">
                    <label style="display: block; font-weight: 600; color: #e2e8f0; margin-bottom: 8px; font-size: 14px;">Category</label>
                    <select name="category.id" required
                            style="width: 100%; box-sizing: border-box; padding: 14px 16px; border: 1px solid rgba(59, 130, 246, 0.2); border-radius: 12px; background-color: rgba(30, 41, 59, 0.5); color: #e2e8f0; font-size: 15px; transition: all 0.3s; cursor: pointer;">
                        <#list categories as category>
                            <option value="${category.id}" style="background-color: #1e293b;"
                                <#if product?? && product.category?? && product.category.id == category.id>selected</#if>>
                                ${category.name}
                            </option>
                        </#list>
                    </select>
                </div>

                <!-- Price and Stock Grid -->
                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 15px;">
                    <!-- Price -->
                    <div style="width: 100%;">
                        <label style="display: block; font-weight: 600; color: #e2e8f0; margin-bottom: 8px; font-size: 14px;">Price</label>
                        <input type="number" step="0.01" name="price" value="${product.price!''}" required
                               style="width: 100%; box-sizing: border-box; padding: 14px 16px; border: 1px solid rgba(59, 130, 246, 0.2); border-radius: 12px; background-color: rgba(30, 41, 59, 0.5); color: #e2e8f0; font-size: 15px; transition: all 0.3s;">
                    </div>

                    <!-- Stock -->
                    <div style="width: 100%;">
                        <label style="display: block; font-weight: 600; color: #e2e8f0; margin-bottom: 8px; font-size: 14px;">Stock</label>
                        <input type="number" name="stock" value="${product.stock!''}" required
                               style="width: 100%; box-sizing: border-box; padding: 14px 16px; border: 1px solid rgba(59, 130, 246, 0.2); border-radius: 12px; background-color: rgba(30, 41, 59, 0.5); color: #e2e8f0; font-size: 15px; transition: all 0.3s;">
                    </div>
                </div>

                <!-- Submit Button -->
                <button type="submit"
                        style="width: 100%; background: linear-gradient(135deg, #2563eb 0%, #0891b2 100%); color: white; font-weight: 600; font-size: 16px; padding: 16px; border: none; border-radius: 12px; cursor: pointer; box-shadow: 0 8px 20px rgba(37, 99, 235, 0.4); transition: all 0.3s; margin-top: 10px;">
                    ${(product?? && product.id??)?then("Update Product", "Add Product")}
                </button>
            </form>

            <!-- Footer -->
            <div style="text-align: center; margin-top: 25px; padding-top: 25px; border-top: 1px solid rgba(59, 130, 246, 0.2);">
                <p style="color: #94a3b8; font-size: 14px; margin: 0;">
                    Need to cancel?
                    <a href="/products" style="color: #60a5fa; font-weight: 600; text-decoration: none; margin-left: 4px; transition: color 0.3s;">View All Products</a>
                </p>
            </div>
        </div>

        <!-- Floating elements -->
        <div class="animate-pulse-slow" style="position: absolute; top: -24px; right: -24px; width: 128px; height: 128px; background: radial-gradient(circle, rgba(59, 130, 246, 0.3) 0%, transparent 70%); border-radius: 50%; filter: blur(30px); pointer-events: none;"></div>
        <div class="animate-pulse-slow" style="position: absolute; bottom: -24px; left: -24px; width: 160px; height: 160px; background: radial-gradient(circle, rgba(6, 182, 212, 0.3) 0%, transparent 70%); border-radius: 50%; filter: blur(30px); pointer-events: none; animation-delay: 2s;"></div>
    </div>

    <script>
        function previewImage(event) {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    const preview = document.getElementById('imagePreview');
                    const placeholder = document.getElementById('uploadPlaceholder');
                    const removeBtn = document.getElementById('removeImageBtn');
                    
                    preview.src = e.target.result;
                    preview.style.display = 'block';
                    placeholder.style.display = 'none';
                    removeBtn.style.display = 'flex';
                };
                reader.readAsDataURL(file);
            }
        }

        function removeImage() {
            const preview = document.getElementById('imagePreview');
            const placeholder = document.getElementById('uploadPlaceholder');
            const removeBtn = document.getElementById('removeImageBtn');
            const input = document.getElementById('imageInput');
            
            preview.src = '';
            preview.style.display = 'none';
            placeholder.style.display = 'block';
            removeBtn.style.display = 'none';
            input.value = '';
        }

        // If editing and there's an existing image, show it
        <#if product?? && product.imageUrl??>
        window.addEventListener('DOMContentLoaded', function() {
            const preview = document.getElementById('imagePreview');
            const placeholder = document.getElementById('uploadPlaceholder');
            const removeBtn = document.getElementById('removeImageBtn');
            
            preview.src = '${product.imageUrl}';
            preview.style.display = 'block';
            placeholder.style.display = 'none';
            removeBtn.style.display = 'flex';
        });
        </#if>
    </script>

</body>
</html>