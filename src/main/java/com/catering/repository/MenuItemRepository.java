package com.catering.repository;

import com.catering.model.MenuItem;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface MenuItemRepository extends JpaRepository<MenuItem, Long> {
    List<MenuItem> findByAvailableTrue();
    List<MenuItem> findByFeaturedTrueAndAvailableTrue();
    List<MenuItem> findByCategoryIdAndAvailableTrue(Long categoryId);
}
