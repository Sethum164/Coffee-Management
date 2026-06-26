package com.catering.controller;

import com.catering.service.MenuService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MenuController {

    private final MenuService menuService;

    public MenuController(MenuService menuService) {
        this.menuService = menuService;
    }

    @GetMapping("/menu")
    public String menu(@RequestParam(required = false) Long categoryId, Model model) {
        if (categoryId != null) {
            model.addAttribute("items", menuService.getByCategory(categoryId));
            model.addAttribute("selectedCategory", categoryId);
        } else {
            model.addAttribute("items", menuService.getAllAvailable());
        }
        model.addAttribute("categories", menuService.getAllCategories());
        return "menu";
    }
}
