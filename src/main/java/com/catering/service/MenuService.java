package com.catering.service;

import com.catering.model.Category;
import com.catering.model.MenuItem;
import com.catering.repository.CategoryRepository;
import com.catering.repository.MenuItemRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuService {

    private final MenuItemRepository menuItemRepository;
    private final CategoryRepository categoryRepository;

    public MenuService(MenuItemRepository menuItemRepository, CategoryRepository categoryRepository) {
        this.menuItemRepository = menuItemRepository;
        this.categoryRepository = categoryRepository;
    }

    public List<MenuItem> getAllAvailable() {
        return menuItemRepository.findByAvailableTrue();
    }

    public List<MenuItem> getFeatured() {
        return menuItemRepository.findByFeaturedTrueAndAvailableTrue();
    }

    public List<MenuItem> getByCategory(Long categoryId) {
        return menuItemRepository.findByCategoryIdAndAvailableTrue(categoryId);
    }

    public List<Category> getAllCategories() {
        return categoryRepository.findAll();
    }

    public List<MenuItem> getAllItems() {
        return menuItemRepository.findAll();
    }

    public MenuItem getById(Long id) {
        return menuItemRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Menu item not found"));
    }

    public MenuItem save(MenuItem item) {
        return menuItemRepository.save(item);
    }

    public void delete(Long id) {
        menuItemRepository.deleteById(id);
    }

    public Category saveCategory(Category category) {
        return categoryRepository.save(category);
    }

    public Category getCategoryById(Long id) {
        return categoryRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Category not found"));
    }
}
