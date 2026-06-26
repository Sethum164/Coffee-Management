package com.catering.controller;

import com.catering.model.User;
import com.catering.service.CartService;
import com.catering.service.OrderService;
import com.catering.service.UserService;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Controller
public class OrderController {

    private final CartService cartService;
    private final OrderService orderService;
    private final UserService userService;

    public OrderController(CartService cartService, OrderService orderService, UserService userService) {
        this.cartService = cartService;
        this.orderService = orderService;
        this.userService = userService;
    }

    @GetMapping("/checkout")
    public String checkout(Model model, Authentication authentication) {
        if (cartService.isEmpty()) {
            return "redirect:/cart";
        }
        User user = userService.getByUsername(authentication.getName());
        model.addAttribute("cart", cartService);
        model.addAttribute("user", user);
        return "checkout";
    }

    @PostMapping("/checkout")
    public String placeOrder(@RequestParam String eventDate,
                              @RequestParam String deliveryAddress,
                              @RequestParam String contactPhone,
                              @RequestParam(required = false) String specialInstructions,
                              @RequestParam(defaultValue = "CASH_ON_DELIVERY") com.catering.model.PaymentMethod paymentMethod,
                              @RequestParam(required = false) String cardNumber,
                              @RequestParam(required = false) String cardExpiry,
                              @RequestParam(required = false) String cardCvv,
                              Authentication authentication,
                              Model model) {
        User user = userService.getByUsername(authentication.getName());
        LocalDateTime parsedDate = LocalDateTime.parse(eventDate, DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm"));

        var order = orderService.placeOrder(user, cartService.getItems(), parsedDate,
                deliveryAddress, contactPhone, specialInstructions, paymentMethod, cardNumber);
        cartService.clear();
        model.addAttribute("order", order);
        return "order-confirmation";
    }

    @GetMapping("/orders")
    public String myOrders(Model model, Authentication authentication) {
        User user = userService.getByUsername(authentication.getName());
        model.addAttribute("orders", orderService.getOrdersForUser(user));
        return "orders";
    }

    @GetMapping("/orders/{id}")
    public String orderDetail(@PathVariable Long id, Model model, Authentication authentication) {
        User user = userService.getByUsername(authentication.getName());
        var order = orderService.getById(id);
        if (!order.getUser().getId().equals(user.getId())) {
            return "redirect:/orders";
        }
        model.addAttribute("order", order);
        return "order-detail";
    }
}
