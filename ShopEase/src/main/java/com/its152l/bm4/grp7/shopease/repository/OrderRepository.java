package com.its152l.bm4.grp7.shopease.repository;

import com.its152l.bm4.grp7.shopease.entity.OrderEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderRepository extends JpaRepository<OrderEntity, Long> {
}
