package com.its152l.bm4.grp7.shopease.controller;

import com.its152l.bm4.grp7.shopease.entity.*;
import com.its152l.bm4.grp7.shopease.repository.*;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.*;

@Controller
@RequestMapping("/cart")
@RequiredArgsConstructor
public class CartController {

    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private OrderRepository orderRepository;
    @Autowired
    private InvoiceRepository invoiceRepository;
    @Autowired
    private ReceiptRepository receiptRepository;
    @Autowired
    private StaffRepository staffRepository;

    // ✅ Add product to cart
    @PostMapping("/add")
    public String addToCart(@RequestParam Long productId,
                            @RequestParam(defaultValue = "1") int quantity,
                            HttpSession session) {

        Map<Long, Integer> cart = (Map<Long, Integer>) session.getAttribute("cart");
        if (cart == null) {
            cart = new HashMap<>();
        }

        // update quantity
        cart.put(productId, cart.getOrDefault(productId, 0) + quantity);
        session.setAttribute("cart", cart);

        return "redirect:/products/store";
    }

    // ✅ Display cart
    @GetMapping("/view")
    public String viewCart(HttpSession session, Model model) {
        Map<Long, Integer> cart = (Map<Long, Integer>) session.getAttribute("cart");
        List<Map<String, Object>> cartItems = new ArrayList<>();
        double total = 0;

        if (cart != null) {
            for (Map.Entry<Long, Integer> entry : cart.entrySet()) {
                Product product = productRepository.findById(entry.getKey()).orElse(null);
                if (product != null) {
                    int qty = entry.getValue();
                    double subtotal = product.getPrice() * qty;
                    total += subtotal;

                    Map<String, Object> item = new HashMap<>();
                    item.put("product", product);
                    item.put("quantity", qty);
                    item.put("subtotal", subtotal);
                    cartItems.add(item);
                }
            }
        }

        model.addAttribute("cartItems", cartItems);
        model.addAttribute("total", total);

        return "cart/view";
    }

    @PostMapping("/update")
    public String updateCart(@RequestParam Map<String, String> quantities, HttpSession session) {
        Map<Long, Integer> cart = (Map<Long, Integer>) session.getAttribute("cart");
        if (cart == null) return "redirect:/cart";

        for (Map.Entry<String, String> entry : quantities.entrySet()) {
            try {
                Long productId = Long.parseLong(entry.getKey().replace("quantities[", "").replace("]", ""));
                int newQuantity = Integer.parseInt(entry.getValue());
                if (newQuantity > 0) {
                    cart.put(productId, newQuantity);
                } else {
                    cart.remove(productId);
                }
            } catch (NumberFormatException ignored) {}
        }

        session.setAttribute("cart", cart);
        return "redirect:/cart/view";
    }

    @GetMapping("/remove/{productId}")
    public String removeItem(@PathVariable Long productId, HttpSession session) {
        Map<Long, Integer> cart = (Map<Long, Integer>) session.getAttribute("cart");
        if (cart != null) {
            cart.remove(productId);
            session.setAttribute("cart", cart);
        }
        return "redirect:/cart/view";
    }



    // ✅ Checkout
    @PostMapping("/checkout")
    public String checkout(HttpSession session, Model model) {
        Map<Long, Integer> cart = (Map<Long, Integer>) session.getAttribute("cart");
        if (cart == null || cart.isEmpty()) {
            return "redirect:/cart/view";
        }

        // Create order
        OrderEntity order = new OrderEntity();
        order.setOrderDate(LocalDateTime.now());
        Staff staff = staffRepository.findById(1L).orElseThrow(); // default
        order.setStaff(staff);

        List<OrderItem> items = new ArrayList<>();
        BigDecimal total = BigDecimal.ZERO;

        for (Map.Entry<Long, Integer> entry : cart.entrySet()) {
            Product product = productRepository.findById(entry.getKey()).orElseThrow();
            int quantity = entry.getValue();

            // Update stock
            product.setStock(product.getStock() - quantity);
            productRepository.save(product);

            BigDecimal subtotal = BigDecimal.valueOf(product.getPrice() * quantity);

            OrderItem item = new OrderItem();
            item.setOrder(order);
            item.setProduct(product);
            item.setQuantity(quantity);
            item.setPriceSubtotal(subtotal);
            items.add(item);

            total = total.add(subtotal);
        }

        order.setItems(items);
        order.setTotalAmount(total);
        orderRepository.save(order);

        // Create Invoice
        Invoice invoice = new Invoice();
        invoice.setOrder(order);
        invoice.setInvoiceDate(LocalDateTime.now());
        invoice.setInvoiceNumber("INV-" + System.currentTimeMillis());
        invoice.setTotalAmount(total);
        invoiceRepository.save(invoice);

        // Create Receipt
        Receipt receipt = new Receipt();
        receipt.setInvoice(invoice);
        receipt.setReceiptDate(LocalDateTime.now());
        receipt.setReceiptNumber("RCT-" + System.currentTimeMillis());
        receipt.setReceivedBy(staff);
        receiptRepository.save(receipt);

        // Clear cart
        session.removeAttribute("cart");

        model.addAttribute("order", order);
        model.addAttribute("invoice", invoice);
        model.addAttribute("receipt", receipt);

        return "receipt/confirmation";
    }
}
