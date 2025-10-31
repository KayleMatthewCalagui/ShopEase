package com.its152l.bm4.grp7.shopease.repository;

import com.its152l.bm4.grp7.shopease.entity.Staff;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface StaffRepository extends JpaRepository<Staff, Long> {
    Optional<Staff> findByUsername(String username);
}
