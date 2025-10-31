package com.its152l.bm4.grp7.shopease.security;

import com.its152l.bm4.grp7.shopease.entity.Staff;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import java.util.Collection;
import java.util.List;

public class CustomUserDetails implements UserDetails {

    private final Staff staff;

    public CustomUserDetails(Staff staff) {
        this.staff = staff;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return List.of(new SimpleGrantedAuthority("ROLE_" + staff.getRole().toUpperCase()));
    }

    @Override
    public String getPassword() {
        return staff.getPassword();
    }

    @Override
    public String getUsername() {
        return staff.getUsername();
    }

    @Override
    public boolean isAccountNonExpired() { return true; }

    @Override
    public boolean isAccountNonLocked() { return true; }

    @Override
    public boolean isCredentialsNonExpired() { return true; }

    @Override
    public boolean isEnabled() { return true; }

    public Staff getStaff() {
        return staff;
    }
}
