// Payment.java
package com.its152l.bm4.grp7.shopease.entity;

import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;

@Entity
@Table(name = "payment")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Payment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "payment_id")
    private Long id;

    @Column(name = "payment_method")
    private String method; // e.g., Cash, GCash

    @Column(name = "payment_status")
    private String status; // e.g., Pending, Paid

    @Column(name = "amount_paid", precision = 10, scale = 2)
    private BigDecimal amountPaid;
}
