package com.catering.controller;

import com.catering.service.CartService;
import com.catering.service.MenuService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/cart")
public class CartController {

    private final CartService cartService;
    private final MenuService menuService;

    public CartController(CartService cartService, MenuService menuService) {
        this.cartService = cartService;
        this.menuService = menuService;
    }

    @GetMapping
    public String viewCart(Model model) {
        model.addAttribute("cart", cartService);
        return "cart";
    }

    @PostMapping("/add")
    public String addToCart(@RequestParam Long menuItemId, @RequestParam(defaultValue = "1") int quantity) {
        cartService.addItem(menuService.getById(menuItemId), quantity);
        return "redirect:/menu";
    }

    @PostMapping("/update")
    public String updateCart(@RequestParam Long menuItemId, @RequestParam int quantity) {
        cartService.updateQuantity(menuItemId, quantity);
        return "redirect:/cart";
    }

    @PostMapping("/remove")
    public String removeFromCart(@RequestParam Long menuItemId) {
        cartService.removeItem(menuItemId);
        return "redirect:/cart";
    }
}
