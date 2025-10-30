// Receipt.java
package com.its152l.bm4.grp7.shopease.entity;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "receipt")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Receipt {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "receipt_id")
    private Long id;

    @OneToOne
    @JoinColumn(name = "invoice_id", nullable = false)
    private Invoice invoice;

    @Column(name = "receipt_number", unique = true)
    private String receiptNumber;

    @Column(name = "receipt_date")
    private LocalDateTime receiptDate;

    @ManyToOne
    @JoinColumn(name = "received_by", nullable = false)
    private Staff receivedBy;
}
