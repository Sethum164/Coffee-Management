package com.catering.controller;

import com.catering.model.Category;
import com.catering.model.MenuItem;
import com.catering.model.OrderStatus;
import com.catering.service.MenuService;
import com.catering.service.OrderService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private final MenuService menuService;
    private final OrderService orderService;

    public AdminController(MenuService menuService, OrderService orderService) {
        this.menuService = menuService;
        this.orderService = orderService;
    }

    @GetMapping
    public String dashboard(Model model) {
        var orders = orderService.getAllOrders();
        model.addAttribute("orderCount", orders.size());
        model.addAttribute("itemCount", menuService.getAllItems().size());
        model.addAttribute("categoryCount", menuService.getAllCategories().size());
        model.addAttribute("recentOrders", orders.stream().limit(5).toList());
        return "admin/dashboard";
    }

    // ----- Menu items -----
    @GetMapping("/items")
    public String items(Model model) {
        model.addAttribute("items", menuService.getAllItems());
        return "admin/items";
    }

    @GetMapping("/items/new")
    public String newItemForm(Model model) {
        model.addAttribute("item", new MenuItem());
        model.addAttribute("categories", menuService.getAllCategories());
        return "admin/item-form";
    }

    @GetMapping("/items/{id}/edit")
    public String editItemForm(@PathVariable Long id, Model model) {
        model.addAttribute("item", menuService.getById(id));
        model.addAttribute("categories", menuService.getAllCategories());
        return "admin/item-form";
    }

    @PostMapping("/items/save")
    public String saveItem(@ModelAttribute MenuItem item, @RequestParam(required = false) Long categoryId) {
        if (categoryId != null) {
            item.setCategory(menuService.getCategoryById(categoryId));
        }
        menuService.save(item);
        return "redirect:/admin/items";
    }

    @GetMapping("/items/{id}/delete")
    public String deleteItem(@PathVariable Long id) {
        menuService.delete(id);
        return "redirect:/admin/items";
    }

    // ----- Categories -----
    @GetMapping("/categories")
    public String categories(Model model) {
        model.addAttribute("categories", menuService.getAllCategories());
        model.addAttribute("category", new Category());
        return "admin/categories";
    }

    @PostMapping("/categories/save")
    public String saveCategory(@ModelAttribute Category category) {
        menuService.saveCategory(category);
        return "redirect:/admin/categories";
    }

    // ----- Orders -----
    @GetMapping("/orders")
    public String orders(Model model) {
        model.addAttribute("orders", orderService.getAllOrders());
        return "admin/orders";
    }

    @GetMapping("/orders/{id}")
    public String orderDetail(@PathVariable Long id, Model model) {
        model.addAttribute("order", orderService.getById(id));
        model.addAttribute("statuses", OrderStatus.values());
        return "admin/order-detail";
    }

    @PostMapping("/orders/{id}/status")
    public String updateStatus(@PathVariable Long id, @RequestParam OrderStatus status) {
        orderService.updateStatus(id, status);
        return "redirect:/admin/orders/" + id;
    }

    @PostMapping("/orders/{id}/mark-paid")
    public String markPaid(@PathVariable Long id) {
        orderService.markAsPaid(id);
        return "redirect:/admin/orders/" + id;
    }
}
