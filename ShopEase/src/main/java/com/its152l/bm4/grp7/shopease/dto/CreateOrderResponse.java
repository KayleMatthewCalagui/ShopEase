package com.its152l.bm4.grp7.shopease.dto;

import lombok.Data;
import java.math.BigDecimal;

@Data
public class CreateOrderResponse {
    private Long orderId;
    private String invoiceNumber;
    private String receiptNumber;
    private BigDecimal totalAmount;
}
