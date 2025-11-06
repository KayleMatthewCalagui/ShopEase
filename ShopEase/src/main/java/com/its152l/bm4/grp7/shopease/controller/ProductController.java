package com.its152l.bm4.grp7.shopease.controller;

import com.its152l.bm4.grp7.shopease.entity.Product;
import com.its152l.bm4.grp7.shopease.repository.ProductRepository;
import com.its152l.bm4.grp7.shopease.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import java.util.Optional;

import java.io.IOException;
import java.util.Base64;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/products")
public class ProductController {

    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private CategoryRepository categoryRepository;

        // 🚫 Prevent Spring from binding MultipartFile directly to Product.image
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.setDisallowedFields("image");
    }

    @GetMapping
    public String list(Model model) {
        List<Product> products = productRepository.findAll().stream().map(this::addImageUrl).collect(Collectors.toList());
        model.addAttribute("products", products);
        return "products/list";
    }

    @GetMapping("/store")
    public String store(Model model) {
        List<Product> products = productRepository.findAll().stream().map(this::addImageUrl).collect(Collectors.toList());
        model.addAttribute("latestProducts", products);
        model.addAttribute("popularProducts", products);
        return "products/products";
    }

    @GetMapping("/new")
    public String showForm(Model model) {
        model.addAttribute("product", new Product());
        model.addAttribute("categories", categoryRepository.findAll());
        return "products/form";
    }

    @PostMapping("/save")
    public String saveProduct(@ModelAttribute Product product,
                            @RequestParam("image") MultipartFile imageFile) throws IOException {

        // Only set image manually
        if (!imageFile.isEmpty()) {
            product.setImage(imageFile.getBytes());
        } else if (product.getId() != null) {
            // Preserve existing image on update
            Product existing = productRepository.findById(product.getId()).orElseThrow();
            product.setImage(existing.getImage());
        }

        productRepository.save(product);
        return "redirect:/products";
    }


    @GetMapping("/edit/{id}")
    public String edit(@PathVariable Long id, Model model) {
        Product product = productRepository.findById(id).orElseThrow();
        addImageUrl(product);
        model.addAttribute("product", product);
        model.addAttribute("categories", categoryRepository.findAll());
        return "products/form";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        productRepository.deleteById(id);
        return "redirect:/products";
    }

    // Helper: Convert byte[] to Base64 data URL
    private Product addImageUrl(Product product) {
        if (product.getImage() != null && product.getImage().length > 0) {
            String base64 = Base64.getEncoder().encodeToString(product.getImage());
            product.setImageUrl("data:image/jpeg;base64," + base64);
        } else {
            product.setImageUrl("/images/placeholder.png"); // fallback image
        }
        return product;
    }

    @GetMapping("/image/{id}")
    @ResponseBody
    public ResponseEntity<byte[]> getProductImage(@PathVariable Long id) {
        Optional<Product> productOpt = productRepository.findById(id);
        if (productOpt.isPresent() && productOpt.get().getImage() != null) {
            Product product = productOpt.get();

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.IMAGE_JPEG);
            return new ResponseEntity<>(product.getImage(), headers, HttpStatus.OK);
        } else {
            return ResponseEntity.notFound().build();
        }
    }


}
