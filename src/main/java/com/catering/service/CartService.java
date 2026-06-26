package com.catering.service;

import com.catering.model.MenuItem;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.web.context.WebApplicationContext;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.LinkedHashMap;
import java.util.Map;

@Service
@Scope(value = WebApplicationContext.SCOPE_SESSION, proxyMode = org.springframework.context.annotation.ScopedProxyMode.TARGET_CLASS)
public class CartService implements Serializable {

    private final Map<Long, CartItem> items = new LinkedHashMap<>();

    public void addItem(MenuItem menuItem, int quantity) {
        if (items.containsKey(menuItem.getId())) {
            items.get(menuItem.getId()).setQuantity(items.get(menuItem.getId()).getQuantity() + quantity);
        } else {
            items.put(menuItem.getId(), new CartItem(menuItem, quantity));
        }
    }

    public void updateQuantity(Long menuItemId, int quantity) {
        if (quantity <= 0) {
            items.remove(menuItemId);
        } else if (items.containsKey(menuItemId)) {
            items.get(menuItemId).setQuantity(quantity);
        }
    }

    public void removeItem(Long menuItemId) {
        items.remove(menuItemId);
    }

    public void clear() {
        items.clear();
    }

    public Map<Long, CartItem> getItems() {
        return items;
    }

    public int getItemCount() {
        return items.values().stream().mapToInt(CartItem::getQuantity).sum();
    }

    public BigDecimal getTotal() {
        return items.values().stream()
                .map(CartItem::getSubtotal)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
    }

    public boolean isEmpty() {
        return items.isEmpty();
    }
}
