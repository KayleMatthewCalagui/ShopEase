package com.its152l.bm4.grp7.shopease.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "product_id")
    private Long id;

    @Column(name = "product_name", nullable = false)
    private String name;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;

    @Column(name = "unit_price")
    private Double price;

    @Column(name = "stock_quantity")
    private Integer stock;

    @Lob
    @Column(name = "product_img", columnDefinition = "LONGBLOB")
    private byte[] image;

    @Transient
    private String imageUrl; // used for display (Base64)
}
