# CateringPro — Full Stack Catering Ordering System

A complete catering ordering web application built with **Spring Boot 3**, **Spring Security**, **Spring Data JPA**, and **Thymeleaf**. Designed to be opened and run directly in **IntelliJ IDEA**.

## Features

**Customer side**
- Browse menu by category, view featured dishes on the homepage
- Register / login (Spring Security, BCrypt password hashing)
- Add items to a session-based cart, update quantities, remove items
- Checkout with event date, delivery address, phone, special instructions
- View order history and detailed order receipts with live status

**Admin side** (role-protected `/admin/**`)
- Dashboard with order/item/category stats and recent orders
- Full CRUD on menu items (name, price, image, category, availability, featured, vegetarian flags)
- Manage categories
- View all orders and update their status (Pending → Confirmed → Preparing → Out for Delivery → Delivered / Cancelled)

**Look & feel**
- Custom warm, restaurant-style theme (no external CSS framework required) — `src/main/resources/static/css/style.css`
- Fully responsive layout, hero banner, card grids, status badges, admin dashboard with sidebar

## Tech Stack

- Java 17, Spring Boot 3.2.5
- Spring MVC + Thymeleaf (server-rendered views)
- Spring Security (form login, BCrypt, role-based access)
- Spring Data JPA + Hibernate
- H2 in-memory database (zero setup — pre-loaded with sample data on every startup)
- Maven

## Running in IntelliJ IDEA

1. **Open the project**: `File → Open...` → select the `catering-system` folder (the one containing `pom.xml`). IntelliJ will detect it as a Maven project and download dependencies automatically (make sure you have internet access for the first build).
2. Wait for Maven to finish importing (bottom-right progress bar).
3. Open `src/main/java/com/catering/CateringApplication.java` and click the green ▶ run icon, **or** run:
   ```
   mvn spring-boot:run
   ```
4. Visit **http://localhost:8080** in your browser.

No external database setup is required — the app uses an in-memory H2 database that is automatically created and seeded with sample categories, menu items, and demo users every time it starts.

### Demo accounts
| Role     | Username | Password     |
|----------|----------|---------------|
| Admin    | admin    | admin123      |
| Customer | jane     | customer123   |

You can also register a brand-new customer account from the **Sign Up** page.

### H2 Console (optional, for inspecting the DB)
Visit `http://localhost:8080/h2-console` while the app is running.
- JDBC URL: `jdbc:h2:mem:cateringdb`
- Username: `sa`
- Password: *(leave blank)*

## Switching to MySQL (optional)

By default the app uses H2 so it runs with zero configuration. If you'd rather use MySQL:

1. In `pom.xml`, uncomment the `mysql-connector-j` dependency block.
2. In `src/main/resources/application.properties`, comment out the H2 block and uncomment/fill in the MySQL block with your DB credentials.
3. Create the database (or let `createDatabaseIfNotExist=true` do it for you) and restart the app — Hibernate will create the tables and `data.sql` will seed them.

## Project Structure

```
catering-system/
├── pom.xml
└── src/main/
    ├── java/com/catering/
    │   ├── CateringApplication.java       # main entry point
    │   ├── config/SecurityConfig.java     # Spring Security setup
    │   ├── model/                         # JPA entities (User, Category, MenuItem, Order, OrderItem, enums)
    │   ├── repository/                    # Spring Data JPA repositories
    │   ├── service/                       # Business logic (Menu, Order, Cart, User, UserDetails)
    │   └── controller/                    # MVC controllers (Home, Auth, Menu, Cart, Order, Admin)
    └── resources/
        ├── application.properties
        ├── data.sql                       # seed data (users, categories, menu items)
        ├── static/css/style.css           # custom theme
        └── templates/                     # Thymeleaf views (+ admin/ subfolder, fragments/ for header/footer/sidebar)
```

## Notes & Possible Extensions

- Cart is stored in the HTTP session (per logged-in user, cleared after checkout).
- Passwords are hashed with BCrypt; the seed `data.sql` already contains valid BCrypt hashes for the demo accounts.
- Ideas to extend further: image upload for menu items instead of URLs, email notifications on order status change, payment gateway integration, pagination for large menus, REST API + JS frontend version.
