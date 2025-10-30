// OrderService.java
package com.its152l.bm4.grp7.shopease.service;

import com.its152l.bm4.grp7.shopease.client.InventoryClient;
import com.its152l.bm4.grp7.shopease.dto.CreateOrderRequest;
import com.its152l.bm4.grp7.shopease.dto.CreateOrderResponse;
import com.its152l.bm4.grp7.shopease.entity.*;
import com.its152l.bm4.grp7.shopease.repository.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class OrderService {
    private final OrderRepository orderRepository;
    private final OrderItemRepository orderItemRepository;
    private final PaymentRepository paymentRepository;
    private final InvoiceRepository invoiceRepository;
    private final ReceiptRepository receiptRepository;
    private final StaffRepository staffRepository;
    private final ProductRepository productRepository;
    private final InventoryClient inventoryClient;

    @Transactional
    public CreateOrderResponse createOrder(CreateOrderRequest req) {
        Staff staff = staffRepository.findById(req.getStaffId()).orElseThrow(() -> new RuntimeException("Staff not found"));

        // Create payment (status Pending -> will be set to Paid if successful)
        Payment payment = new Payment();
        payment.setMethod(req.getPaymentMethod());
        payment.setStatus("Pending");
        payment.setAmountPaid(req.getAmountPaid());
        payment = paymentRepository.save(payment);

        // Build Order
        OrderEntity order = new OrderEntity();
        order.setStaff(staff);
        order.setPayment(payment);
        order.setOrderDate(LocalDateTime.now());

        List<OrderItem> items = new ArrayList<>();
        BigDecimal total = BigDecimal.ZERO;

        for (CreateOrderRequest.OrderLine line : req.getItems()) {
            Product product = productRepository.findById(line.getProductId())
                    .orElseThrow(() -> new RuntimeException("Product not found: " + line.getProductId()));

            if (product.getStock() < line.getQuantity()) {
                throw new RuntimeException("Insufficient stock for product: " + product.getName());
            }

            BigDecimal subtotal = BigDecimal.valueOf(product.getPrice()).multiply(BigDecimal.valueOf(line.getQuantity()));
            total = total.add(subtotal);

            OrderItem oi = new OrderItem();
            oi.setProduct(product);
            oi.setQuantity(line.getQuantity());
            oi.setPriceSubtotal(subtotal);
            oi.setOrder(order);
            items.add(oi);
        }

        order.setItems(items);
        order.setTotalAmount(total);

        // Persist order (cascades will save items because cascade = ALL on Order.items)
        OrderEntity saved = orderRepository.save(order);

        // ✅ Manually save each order item (so orderItemRepository is used)
        for (OrderItem item : items) {
            item.setOrder(saved);
            orderItemRepository.save(item);
        }
        
        // Call Inventory service to decrement stock for each item
        // If any call fails, throw exception to rollback transaction
        for (OrderItem oi : items) {
            inventoryClient.decrementStock(oi.getProduct().getId(), oi.getQuantity());
            // Optionally update local product stock if Product is shared in same DB:
            Product prod = oi.getProduct();
            prod.setStock(prod.getStock() - oi.getQuantity());
            productRepository.save(prod);
        }

        // If all inventory updates succeed, mark payment as Paid
        payment.setStatus("Paid");
        paymentRepository.save(payment);

        // Generate invoice
        Invoice invoice = new Invoice();
        invoice.setOrder(saved);
        invoice.setInvoiceNumber("INV-" + UUID.randomUUID().toString().substring(0,8).toUpperCase());
        invoice.setInvoiceDate(LocalDateTime.now());
        invoice.setTotalAmount(total);
        invoice = invoiceRepository.save(invoice);

        // Generate receipt
        Receipt receipt = new Receipt();
        receipt.setInvoice(invoice);
        receipt.setReceiptNumber("RCT-" + UUID.randomUUID().toString().substring(0,8).toUpperCase());
        receipt.setReceiptDate(LocalDateTime.now());
        receipt.setReceivedBy(staff);
        receipt = receiptRepository.save(receipt);

        CreateOrderResponse resp = new CreateOrderResponse();
        resp.setOrderId(saved.getId());
        resp.setInvoiceNumber(invoice.getInvoiceNumber());
        resp.setReceiptNumber(receipt.getReceiptNumber());
        resp.setTotalAmount(total);
        return resp;
    }
}
