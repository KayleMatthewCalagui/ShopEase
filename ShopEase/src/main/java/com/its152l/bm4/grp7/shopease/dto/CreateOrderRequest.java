package com.its152l.bm4.grp7.shopease.dto;

import lombok.Data;
import java.math.BigDecimal;
import java.util.List;

@Data
public class CreateOrderRequest {
    private Long staffId;
    private List<OrderLine> items;
    private String paymentMethod;
    private BigDecimal amountPaid;

    @Data
    public static class OrderLine {
        private Long productId;
        private Integer quantity;
    }
}
