package com.catering.config;

import com.catering.service.CartService;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

@ControllerAdvice
public class GlobalModelAdvice {

    private final CartService cartService;

    public GlobalModelAdvice(CartService cartService) {
        this.cartService = cartService;
    }

    @ModelAttribute("cartItemCount")
    public int cartItemCount() {
        try {
            return cartService.getItemCount();
        } catch (Exception e) {
            return 0;
        }
    }
}
