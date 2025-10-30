// SalesController.java
package com.its152l.bm4.grp7.shopease.controller;

import com.its152l.bm4.grp7.shopease.dto.CreateOrderRequest;
import com.its152l.bm4.grp7.shopease.dto.CreateOrderResponse;
import com.its152l.bm4.grp7.shopease.service.OrderService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;

@RestController
@RequestMapping("/sales")
@RequiredArgsConstructor
public class SalesController {
    private final OrderService orderService;

    @PostMapping("/orders")
    public CreateOrderResponse createOrder(@RequestBody CreateOrderRequest req) {
        return orderService.createOrder(req);
    }

    @GetMapping("/orders/{id}")
    public Object getOrder(@PathVariable Long id) {
        // implement retrieval if needed: orderRepository.findById(id)
        return null;
    }

    // Optional: web admin page to list orders for Freemarker
    @GetMapping("/admin/orders")
    public String ordersPage(Model model) {
        // add list to model and return template, e.g. "admin/orders"
        return "orders/list"; 
    }
}
