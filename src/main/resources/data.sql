-- ===================== USERS =====================
INSERT INTO app_users (id, username, email, password, full_name, phone, address, enabled) VALUES
(1, 'admin', 'admin@cateringpro.com', '$2b$10$M44qYaluFdcLjfNaiiA9Uen62Bn5FuSQ4BM2Zmf0FlDcnAFDiv2Yq', 'System Administrator', '0771234567', 'Head Office, Colombo', true),
(2, 'jane', 'jane@example.com', '$2b$10$rdztVpW9//IwpqK/9UYX8eB7rlhCIZ78/df6a6GIGcEDf1sIJ72oS', 'Jane Perera', '0719876543', '12 Lake Road, Maharagama', true);

INSERT INTO app_users_roles (user_id, roles) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_CUSTOMER');

-- ===================== CATEGORIES =====================
INSERT INTO categories (id, name, description) VALUES
(1, 'Starters', 'Delicious appetizers to begin your event'),
(2, 'Main Course', 'Hearty mains for every occasion'),
(3, 'Rice & Noodles', 'Classic rice and noodle dishes'),
(4, 'Desserts', 'Sweet endings to a perfect meal'),
(5, 'Beverages & Juices', 'Refreshing drinks for your guests'),
(6, 'Soups', 'Warm and comforting soups'),
(7, 'Salads', 'Fresh and healthy salads'),
(8, 'Bread & Rotis', 'Freshly made breads to pair with your curries'),
(9, 'BBQ & Grills', 'Smoky grilled favorites'),
(10, 'Seafood Specials', 'Fresh catch prepared to perfection'),
(11, 'Kids Menu', 'Kid-friendly favorites for younger guests'),
(12, 'Live Counters', 'Interactive food stations for your event');

-- ===================== MENU ITEMS =====================
-- Starters (1)
INSERT INTO menu_items (id, name, description, price, image_url, available, vegetarian, featured, category_id) VALUES
(1, 'Crispy Spring Rolls', 'Golden fried rolls stuffed with veggies, served with sweet chili sauce', 450.00, 'https://images.unsplash.com/photo-1548340748-6d2b7d7da280?w=600', true, true, true, 1),
(2, 'Chicken Satay Skewers', 'Grilled marinated chicken skewers with peanut sauce', 650.00, 'https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?w=600', true, false, true, 1),
(3, 'Devilled Cashew Nuts', 'Spicy stir-fried cashews, a local favorite', 550.00, 'https://images.unsplash.com/photo-1599599810769-bcde5a160d32?w=600', true, true, false, 1),
(4, 'Fish Cutlets', 'Crispy potato and tuna cutlets, deep fried golden brown', 480.00, 'https://images.unsplash.com/photo-1606755962773-d324e0a13086?w=600', true, false, false, 1),
(5, 'Vegetable Samosas', 'Crispy pastry filled with spiced potatoes and peas', 380.00, 'https://images.unsplash.com/photo-1601050690597-df0568f70950?w=600', true, true, false, 1),
(6, 'Prawn Tempura', 'Light and crispy battered prawns with dipping sauce', 850.00, 'https://images.unsplash.com/photo-1606491956689-2ea866880c84?w=600', true, false, true, 1),
(7, 'Chicken 65', 'Spicy deep-fried chicken bites, a South Indian classic', 620.00, 'https://images.unsplash.com/photo-1606728035253-49e8a23146de?w=600', true, false, false, 1),
(8, 'Stuffed Mushrooms', 'Mushroom caps stuffed with herbed cheese, baked till golden', 520.00, 'https://images.unsplash.com/photo-1607330289024-1535c6b4e1c1?w=600', true, true, false, 1);

-- Main Course (2)
INSERT INTO menu_items (id, name, description, price, image_url, available, vegetarian, featured, category_id) VALUES
(9, 'Butter Chicken', 'Creamy tomato based curry with tender chicken', 950.00, 'https://images.unsplash.com/photo-1588166524941-3bf61a9c41db?w=600', true, false, true, 2),
(10, 'Grilled Lamb Chops', 'Herb marinated lamb chops grilled to perfection', 1450.00, 'https://images.unsplash.com/photo-1432139509613-5c4255815697?w=600', true, false, false, 2),
(11, 'Paneer Tikka Masala', 'Cottage cheese cubes in a rich spiced gravy', 850.00, 'https://images.unsplash.com/photo-1631452180519-c014fe946bc7?w=600', true, true, false, 2),
(12, 'Sri Lankan Chicken Curry', 'Traditional spicy coconut milk chicken curry', 880.00, 'https://images.unsplash.com/photo-1631292784640-2b24be784d5d?w=600', true, false, true, 2),
(13, 'Beef Black Curry', 'Slow cooked beef in roasted black curry powder', 980.00, 'https://images.unsplash.com/photo-1626508035297-0cd9c361b75e?w=600', true, false, false, 2),
(14, 'Dhal Curry', 'Creamy lentils simmered with coconut milk and spices', 420.00, 'https://images.unsplash.com/photo-1546833999-b9f581a1996d?w=600', true, true, false, 2),
(15, 'Cashew Curry', 'Sri Lankan style cashew nuts in a mild coconut gravy', 720.00, 'https://images.unsplash.com/photo-1631515243349-e0cb75fb8d3a?w=600', true, true, false, 2),
(16, 'Pork Belly Roast', 'Slow roasted pork belly with crackling skin and spices', 1100.00, 'https://images.unsplash.com/photo-1432139555190-58524dae6a55?w=600', true, false, false, 2),
(17, 'Egg Curry', 'Boiled eggs simmered in a spiced coconut curry', 480.00, 'https://images.unsplash.com/photo-1607103058027-4c5d36ddc8c3?w=600', true, true, false, 2),
(18, 'Vegetable Kottu', 'Chopped roti stir-fried with mixed vegetables and spices', 650.00, 'https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?w=600', true, true, false, 2);

-- Rice & Noodles (3)
INSERT INTO menu_items (id, name, description, price, image_url, available, vegetarian, featured, category_id) VALUES
(19, 'Seafood Fried Rice', 'Wok-tossed rice with prawns, squid and fish cake', 950.00, 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=600', true, false, true, 3),
(20, 'Pad Thai Noodles', 'Stir-fried rice noodles with tamarind sauce and peanuts', 850.00, 'https://images.unsplash.com/photo-1559314809-0d155014e29e?w=600', true, true, false, 3),
(21, 'Yellow Rice', 'Fragrant turmeric and cardamom infused rice', 380.00, 'https://images.unsplash.com/photo-1596797038530-2c107229654b?w=600', true, true, true, 3),
(22, 'Chicken Fried Rice', 'Classic fried rice with diced chicken and vegetables', 750.00, 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=600', true, false, false, 3),
(23, 'Vegetable Biryani', 'Layered basmati rice with mixed vegetables and saffron', 680.00, 'https://images.unsplash.com/photo-1631515243349-e0cb75fb8d3a?w=600', true, true, false, 3),
(24, 'Mutton Biryani', 'Slow cooked mutton biryani with caramelized onions', 1150.00, 'https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=600', true, false, true, 3),
(25, 'Singapore Noodles', 'Curry flavored rice noodles with shrimp and vegetables', 820.00, 'https://images.unsplash.com/photo-1585032226651-759b368d7246?w=600', true, false, false, 3),
(26, 'Plain Steamed Rice', 'Simple steamed white rice, perfect with any curry', 250.00, 'https://images.unsplash.com/photo-1516684732162-798a0062be99?w=600', true, true, false, 3);

-- Desserts (4)
INSERT INTO menu_items (id, name, description, price, image_url, available, vegetarian, featured, category_id) VALUES
(27, 'Chocolate Lava Cake', 'Warm chocolate cake with a molten center, served with ice cream', 550.00, 'https://images.unsplash.com/photo-1624353365286-3f8d62daad51?w=600', true, true, true, 4),
(28, 'Watalappan', 'Traditional Sri Lankan coconut custard pudding', 400.00, 'https://images.unsplash.com/photo-1551024506-0bccd828d307?w=600', true, true, false, 4),
(29, 'Tiramisu', 'Classic Italian layered coffee and mascarpone dessert', 580.00, 'https://images.unsplash.com/photo-1571877227200-a0d98ea607e9?w=600', true, true, false, 4),
(30, 'Fruit Trifle', 'Layers of sponge cake, custard, cream and fresh fruit', 450.00, 'https://images.unsplash.com/photo-1488477181946-6428a0291777?w=600', true, true, false, 4),
(31, 'Cheesecake Slice', 'Creamy baked cheesecake with a berry compote', 520.00, 'https://images.unsplash.com/photo-1567171466295-4afa63d45416?w=600', true, true, true, 4),
(32, 'Gulab Jamun', 'Soft milk dumplings soaked in rose flavored sugar syrup', 350.00, 'https://images.unsplash.com/photo-1601050690597-df0568f70950?w=600', true, true, false, 4),
(33, 'Ice Cream Sundae', 'A scoop trio topped with chocolate sauce and nuts', 420.00, 'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=600', true, true, false, 4);

-- Beverages & Juices (5)
INSERT INTO menu_items (id, name, description, price, image_url, available, vegetarian, featured, category_id) VALUES
(34, 'Fresh Fruit Punch', 'A refreshing blend of seasonal tropical fruits', 350.00, 'https://images.unsplash.com/photo-1546173159-315724a31696?w=600', true, true, false, 5),
(35, 'Iced Ceylon Tea', 'Chilled premium Ceylon tea with a hint of lemon', 300.00, 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=600', true, true, false, 5),
(36, 'Fresh Watermelon Juice', 'Chilled, naturally sweet watermelon juice', 320.00, 'https://images.unsplash.com/photo-1589733955941-5eeaf752f6dd?w=600', true, true, true, 5),
(37, 'Mango Lassi', 'Creamy yogurt drink blended with sweet mango pulp', 380.00, 'https://images.unsplash.com/photo-1626200943756-58c66f1b9577?w=600', true, true, true, 5),
(38, 'Fresh Orange Juice', 'Freshly squeezed orange juice, no added sugar', 350.00, 'https://images.unsplash.com/photo-1613478223719-2ab802602423?w=600', true, true, false, 5),
(39, 'Pineapple Ginger Cooler', 'Pineapple juice with a refreshing ginger kick', 360.00, 'https://images.unsplash.com/photo-1622597467836-f3285f2131b8?w=600', true, true, false, 5),
(40, 'Passionfruit Cordial', 'Sweet and tangy passionfruit cordial over ice', 330.00, 'https://images.unsplash.com/photo-1614145121029-83a9f7b68bf4?w=600', true, true, false, 5),
(41, 'King Coconut Water', 'Naturally hydrating fresh king coconut, served chilled', 280.00, 'https://images.unsplash.com/photo-1601493700631-2b16ec4b4716?w=600', true, true, true, 5),
(42, 'Strawberry Milkshake', 'Thick and creamy strawberry milkshake', 420.00, 'https://images.unsplash.com/photo-1572490122747-3968b75cc699?w=600', true, true, false, 5),
(43, 'Lime Mint Soda', 'Sparkling soda with fresh lime and mint', 300.00, 'https://images.unsplash.com/photo-1437418747212-8d9709afab22?w=600', true, true, false, 5),
(44, 'Hot Ceylon Tea', 'Freshly brewed premium Ceylon black tea', 200.00, 'https://images.unsplash.com/photo-1564890369478-c89ca6d9cde9?w=600', true, true, false, 5),
(45, 'Filter Coffee', 'Freshly brewed aromatic filter coffee', 220.00, 'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=600', true, true, false, 5);

-- Soups (6)
INSERT INTO menu_items (id, name, description, price, image_url, available, vegetarian, featured, category_id) VALUES
(46, 'Cream of Mushroom Soup', 'Velvety mushroom soup with a touch of cream', 380.00, 'https://images.unsplash.com/photo-1547592180-85f173990554?w=600', true, true, false, 6),
(47, 'Chicken Sweet Corn Soup', 'Comforting soup with shredded chicken and sweet corn', 400.00, 'https://images.unsplash.com/photo-1605522561233-768ad7a8fabf?w=600', true, false, true, 6),
(48, 'Tom Yum Soup', 'Spicy and sour Thai soup with prawns and lemongrass', 450.00, 'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?w=600', true, false, false, 6),
(49, 'Tomato Basil Soup', 'Classic roasted tomato soup with fresh basil', 350.00, 'https://images.unsplash.com/photo-1583309217394-a3e9b6c8ff5e?w=600', true, true, false, 6);

-- Salads (7)
INSERT INTO menu_items (id, name, description, price, image_url, available, vegetarian, featured, category_id) VALUES
(50, 'Greek Salad', 'Fresh tomatoes, cucumber, olives and feta cheese', 480.00, 'https://images.unsplash.com/photo-1540420773420-3366772f4999?w=600', true, true, false, 7),
(51, 'Caesar Salad', 'Crisp lettuce, parmesan, croutons and Caesar dressing', 520.00, 'https://images.unsplash.com/photo-1550304943-4f24f54ddde9?w=600', true, false, true, 7),
(52, 'Coconut Sambol Salad', 'Traditional Sri Lankan coconut and onion sambol', 320.00, 'https://images.unsplash.com/photo-1540420773420-3366772f4999?w=600', true, true, false, 7),
(53, 'Grilled Chicken Salad', 'Mixed greens topped with grilled chicken strips', 580.00, 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=600', true, false, false, 7);

-- Bread & Rotis (8)
INSERT INTO menu_items (id, name, description, price, image_url, available, vegetarian, featured, category_id) VALUES
(54, 'Garlic Naan', 'Soft tandoor-baked bread brushed with garlic butter', 280.00, 'https://images.unsplash.com/photo-1601050690597-df0568f70950?w=600', true, true, true, 8),
(55, 'Plain Roti', 'Soft and flaky Sri Lankan style roti', 150.00, 'https://images.unsplash.com/photo-1565299585323-38d6b0865b47?w=600', true, true, false, 8),
(56, 'Cheese Kottu Roti', 'Chopped roti stir-fried with cheese and vegetables', 720.00, 'https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?w=600', true, false, false, 8),
(57, 'Butter Naan', 'Classic tandoor bread brushed with melted butter', 250.00, 'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=600', true, true, false, 8);

-- BBQ & Grills (9)
INSERT INTO menu_items (id, name, description, price, image_url, available, vegetarian, featured, category_id) VALUES
(58, 'BBQ Chicken Wings', 'Smoky grilled wings glazed with BBQ sauce', 680.00, 'https://images.unsplash.com/photo-1527477396000-e27163b481c2?w=600', true, false, true, 9),
(59, 'Grilled Beef Steak', 'Char-grilled beef steak served with pepper sauce', 1350.00, 'https://images.unsplash.com/photo-1546833999-b9f581a1996d?w=600', true, false, false, 9),
(60, 'Tandoori Chicken', 'Yogurt and spice marinated chicken roasted in tandoor', 850.00, 'https://images.unsplash.com/photo-1599487488170-d11ec9c172f0?w=600', true, false, true, 9),
(61, 'Grilled Vegetable Skewers', 'Seasonal vegetables grilled on skewers with herb oil', 480.00, 'https://images.unsplash.com/photo-1529193591184-b1d58069ecdd?w=600', true, true, false, 9),
(62, 'BBQ Pork Ribs', 'Slow grilled pork ribs glazed in smoky BBQ sauce', 1250.00, 'https://images.unsplash.com/photo-1544025162-d76694265947?w=600', true, false, false, 9);

-- Seafood Specials (10)
INSERT INTO menu_items (id, name, description, price, image_url, available, vegetarian, featured, category_id) VALUES
(63, 'Grilled Whole Fish', 'Fresh whole fish marinated and grilled with herbs', 1450.00, 'https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2?w=600', true, false, true, 10),
(64, 'Garlic Butter Prawns', 'Jumbo prawns sautéed in garlic butter sauce', 1150.00, 'https://images.unsplash.com/photo-1565680018434-b513d5e5fd47?w=600', true, false, true, 10),
(65, 'Crab Curry', 'Sri Lankan style crab curry in a spicy coconut gravy', 1650.00, 'https://images.unsplash.com/photo-1559737558-2f5a35f4523b?w=600', true, false, false, 10),
(66, 'Calamari Rings', 'Crispy fried squid rings served with tartar sauce', 750.00, 'https://images.unsplash.com/photo-1604908554007-e2c0ce3acebf?w=600', true, false, false, 10),
(67, 'Cuttlefish Black Curry', 'Tender cuttlefish slow cooked in roasted spices', 980.00, 'https://images.unsplash.com/photo-1565299507177-b0ac66763828?w=600', true, false, false, 10);

-- Kids Menu (11)
INSERT INTO menu_items (id, name, description, price, image_url, available, vegetarian, featured, category_id) VALUES
(68, 'Mini Cheese Pizza', 'Kid-sized pizza topped with mozzarella cheese', 480.00, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?w=600', true, true, false, 11),
(69, 'Chicken Nuggets & Fries', 'Crispy chicken nuggets served with golden fries', 520.00, 'https://images.unsplash.com/photo-1562967914-608f82629710?w=600', true, false, true, 11),
(70, 'Mac and Cheese', 'Creamy cheesy macaroni, a kids favorite', 450.00, 'https://images.unsplash.com/photo-1543339494-b4cd4f7ba686?w=600', true, true, false, 11),
(71, 'Fruit Jelly Cups', 'Colorful fruit jelly cups for a sweet treat', 250.00, 'https://images.unsplash.com/photo-1488477181946-6428a0291777?w=600', true, true, false, 11);

-- Live Counters (12)
INSERT INTO menu_items (id, name, description, price, image_url, available, vegetarian, featured, category_id) VALUES
(72, 'Live Pasta Station', 'Chef-prepared pasta tossed live with your choice of sauce', 950.00, 'https://images.unsplash.com/photo-1473093295043-cdd812d0e601?w=600', true, true, true, 12),
(73, 'Live Dosa Counter', 'Freshly made crispy dosas with chutneys and sambar', 650.00, 'https://images.unsplash.com/photo-1630383249896-583cf4c47a1c?w=600', true, true, true, 12),
(74, 'Live Grill Station', 'Choose your meat or veggies, grilled fresh in front of you', 1100.00, 'https://images.unsplash.com/photo-1529193591184-b1d58069ecdd?w=600', true, false, false, 12),
(75, 'Live Dessert Counter', 'Made-to-order crepes and ice cream with toppings', 720.00, 'https://images.unsplash.com/photo-1488477181946-6428a0291777?w=600', true, true, false, 12);
