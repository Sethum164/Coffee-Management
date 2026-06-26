package com.catering.service;

import com.catering.model.*;
import com.catering.repository.OrderRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@Service
public class OrderService {

    private final OrderRepository orderRepository;

    public OrderService(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    public Order placeOrder(User user, Map<Long, CartItem> cartItems, LocalDateTime eventDate,
                             String address, String phone, String instructions,
                             PaymentMethod paymentMethod, String cardNumber) {
        Order order = new Order();
        order.setUser(user);
        order.setEventDate(eventDate);
        order.setDeliveryAddress(address);
        order.setContactPhone(phone);
        order.setSpecialInstructions(instructions);
        order.setStatus(OrderStatus.PENDING);
        order.setPaymentMethod(paymentMethod);

        for (CartItem ci : cartItems.values()) {
            OrderItem oi = new OrderItem(ci.getMenuItem(), ci.getQuantity(), ci.getMenuItem().getPrice());
            order.addItem(oi);
        }
        order.setTotalAmount(order.getItems().stream()
                .map(OrderItem::getSubtotal)
                .reduce(java.math.BigDecimal.ZERO, java.math.BigDecimal::add));

        // ---- Simulated payment processing ----
        // In a real system this is where you'd call a payment gateway (Stripe, PayHere, etc.)
        // using a server-side API call and only mark PAID after a verified webhook/response.
        if (paymentMethod == PaymentMethod.CASH_ON_DELIVERY) {
            order.setPaymentStatus(PaymentStatus.PENDING); // paid when delivered
        } else {
            order.setPaymentStatus(PaymentStatus.PAID);
            order.setPaymentReference("SIM-" + System.currentTimeMillis());
            if (paymentMethod == PaymentMethod.CARD && cardNumber != null) {
                String digitsOnly = cardNumber.replaceAll("\\s+", "");
                if (digitsOnly.length() >= 4) {
                    order.setCardLast4(digitsOnly.substring(digitsOnly.length() - 4));
                }
            }
        }

        return orderRepository.save(order);
    }

    public List<Order> getOrdersForUser(User user) {
        return orderRepository.findByUserOrderByOrderDateDesc(user);
    }

    public List<Order> getAllOrders() {
        return orderRepository.findAllByOrderByOrderDateDesc();
    }

    public Page<Order> getOrdersForUser(User user, Pageable pageable) {
        return orderRepository.findByUserOrderByOrderDateDesc(user, pageable);
    }

    public Page<Order> getAllOrders(Pageable pageable) {
        return orderRepository.findAllByOrderByOrderDateDesc(pageable);
    }

    public Order getById(Long id) {
        return orderRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Order not found"));
    }

    public Order updateStatus(Long id, OrderStatus status) {
        Order order = getById(id);
        order.setStatus(status);
        return orderRepository.save(order);
    }

    public Order markAsPaid(Long id) {
        Order order = getById(id);
        order.setPaymentStatus(PaymentStatus.PAID);
        if (order.getPaymentReference() == null) {
            order.setPaymentReference("MANUAL-" + System.currentTimeMillis());
        }
        return orderRepository.save(order);
    }

    /** Customers may only cancel their own order, and only while it's still PENDING. */
    public Order cancelOrder(Long id, User requestingUser) {
        Order order = getById(id);
        if (!order.getUser().getId().equals(requestingUser.getId())) {
            throw new SecurityException("You cannot cancel an order that isn't yours.");
        }
        if (order.getStatus() != OrderStatus.PENDING) {
            throw new IllegalStateException("This order can no longer be cancelled.");
        }
        order.setStatus(OrderStatus.CANCELLED);
        return orderRepository.save(order);
    }
}
