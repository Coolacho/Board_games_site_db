USE board_games_site;

INSERT INTO accounts (username, password, type, date_of_creation) VALUES
('admin', 'admin', 'Admin', DATE(NOW())),
('john_doe', 'p@ssw0rd', 'Customer', DATE(NOW())),
('jane_smith', 'secure123', 'Customer', DATE(NOW())),
('david_wilson', 'qwerty456', 'Customer', DATE(NOW())),
('emily_miller', 'letmein', 'Customer', DATE(NOW()));

INSERT INTO addresses (address, postal_code, city, country) VALUES
('123 Main Street', '12345', 'Exampleville', 'United States'),
('456 Elm Avenue', '67890', 'Sampletown', 'Canada'),
('789 Oak Lane', '54321', 'Testburg', 'Australia'),
('101 Pine Road', '98765', 'Mocksville', 'United Kingdom'),
('222 Park Avenue', '24680', 'Playville', 'United States'),
('333 Lakeview Drive', '13579', 'Scenicville', 'Canada'),
('444 Mountain Road', '86420', 'Hikeridge', 'New Zealand'),
('555 River Street', '57246', 'Aquatown', 'Spain');

INSERT INTO customers (first_name, last_name, account_id) VALUES
('John', 'Doe', 2),
('Jane', 'Smith', 3),
('David', 'Wilson', 4),
('Emily', 'Miller', 5);

INSERT INTO suppliers (name) VALUES
('Supplier A'),
('Supplier B'),
('Supplier C'),
('Supplier D');

INSERT INTO contacts_info (email_address, telephone, address_id, customer_id, supplier_id) VALUES
('john.doe@example.com', '+359 88 123 4567', 1, 1, NULL),
('jane.smith@example.com', '+359 88 234 5678', 2, 2, NULL),
('david.wilson@example.com', '+359 88 567 8901', 3, 3, NULL),
('emily.miller@example.com', '+359 88 678 9012', 4, 4, NULL),
('contact@supplier1.com', '+359 2 345 6789', 5, NULL, 1),
('contact@supplier2.com', '+359 2 456 7890', 6, NULL, 2),
('contact@supplier3.com', '+359 2 789 0123', 7, NULL, 3),
('contact@supplier4.com', '+359 2 890 1234', 8, NULL, 4);

INSERT INTO orders (date_made, total, payment_method, customer_id) VALUES
('2023-08-01', 145.00, 'On receive', 1),
('2023-08-02', 179.00, 'By card', 2),
('2023-08-03', 318.00, 'On receive', 3),
('2023-08-12', 146.00, 'By card', 2),
('2023-08-13', 42.00, 'On receive', 3),
('2023-08-04', 135.00, 'By card', 4);

INSERT INTO publishers (name) VALUES
('Druid city Games'),
('Fantasy Flight Games'),
('Stonemaier Games'),
('Roxley'),
('Inside the box'),
('Days of Wonder');

INSERT INTO products (name, type, description_path, price, min_player_cnt, max_player_cnt, min_play_time, max_play_time, min_player_age, publisher_id) VALUES
('Scythe', 'Board game', '/src/main/resources/static/descriptions/scythe/description.txt', 145.00, 1, 5, 90, 115, 14, 3),
('Expeditions', 'Board game', '/src/main/resources/static/descriptions/expeditions/description.txt', 146.00, 1, 5, 60, 90, 14, 3),
('Brass: Birmingham', 'Board game', '/src/main/resources/static/descriptions/brass_birmingham/description.txt', 135.00, 2, 4, 60, 120, 14, 4),
('Sub Terra', 'Board game', '/src/main/resources/static/descriptions/sub_terra/description.txt', 95.00, 1, 6, 60, 90, 10, 5),
('Sub Terra: Investigation', 'Expansion', '/src/main/resources/static/descriptions/sub_terra_investigation/description.txt', 42.00, 1, 6, 45, 90, 10, 5),
('Sub Terra: Extraction', 'Expansion', '/src/main/resources/static/descriptions/sub_terra_extraction/description.txt', 42.00, 1, 6, 45, 90, 10, 5),
('Sub Terra: Annihilation', 'Expansion', '/src/main/resources/static/descriptions/sub_terra_annihilation/description.txt', 42.00, 1, 6, 45, 90, 10, 5),
('Sub Terra: Incubation', 'Expansion', '/src/main/resources/static/descriptions/sub_terra_incubation/description.txt', 42.00, 1, 6, 45, 90, 10, 5),
('Mansions of Madness: Second edition', 'Board game', '/src/main/resources/static/descriptions/mansions_of_madness_second_edition/description.txt', 229.00, 1, 5, 120, 180, 14, 2),
('The Grimm Forest', 'Board game', '/src/main/resources/static/descriptions/the_grimm_forest/description.txt', 89.00, 2, 4, 45, 60, 8, 1),
('Small World', 'Board game', '/src/main/resources/static/descriptions/small_world/description.txt', 110.00, 2, 5, 40, 80, 8, 6);

INSERT INTO categories (name) VALUES
('Family games'),
('Party games'),
('Cooperative games'),
('Card games'),
('Miniature games'),
('Historical and military games'),
('Fantasy'),
('Strategy'),
('Adventure'),
('Exploration'),
('Horror');

INSERT INTO product_categories (product_id, category_id) VALUES
(1, 6),
(1, 8),
(2, 6),
(2, 8),
(2, 9),
(3, 4),
(3, 8),
(4, 1),
(4, 3),
(4, 8),
(4, 9),
(4, 10),
(5, 1),
(5, 3),
(5, 8),
(5, 9),
(5, 10),
(6, 1),
(6, 3),
(6, 8),
(6, 9),
(6, 10),
(7, 1),
(7, 3),
(7, 8),
(7, 9),
(7, 10),
(8, 1),
(8, 3),
(8, 8),
(8, 9),
(8, 10),
(9, 3),
(9, 5),
(9, 7),
(9, 8),
(9, 9),
(9, 10),
(9, 11),
(10, 1),
(10, 4),
(10, 7),
(10, 8),
(11, 1),
(11, 7),
(11, 8);

INSERT INTO images (path, product_id) VALUES
('/src/main/resources/static/images/scythe/box.jpg', 1),
('/src/main/resources/static/images/scythe/content.jpg', 1),
('/src/main/resources/static/images/expeditions/box.jpg', 2),
('/src/main/resources/static/images/expeditions/content.jpg', 2),
('/src/main/resources/static/images/brass_birmingham/box.jpg', 3),
('/src/main/resources/static/images/brass_birmingham/content.jpg', 3),
('/src/main/resources/static/images/sub_terra/box.jpg', 4),
('/src/main/resources/static/images/sub_terra/content.jpg', 4),
('/src/main/resources/static/images/sub_terra_investigation/box.jpg', 5),
('/src/main/resources/static/images/sub_terra_investigation/content.jpg', 5),
('/src/main/resources/static/images/sub_terra_extraction/box.jpg', 6),
('/src/main/resources/static/images/sub_terra_extraction/content.jpg', 6),
('/src/main/resources/static/images/sub_terra_annihilation/box.jpg', 7),
('/src/main/resources/static/images/sub_terra_annihilation/content.jpg', 7),
('/src/main/resources/static/images/sub_terra_incubation/box.jpg', 8),
('/src/main/resources/static/images/sub_terra_incubation/content.jpg', 8),
('/src/main/resources/static/images/mansions_of_madness_second_edition/box.jpg', 9),
('/src/main/resources/static/images/mansions_of_madness_second_edition/content.jpg', 9),
('/src/main/resources/static/images/the_grimm_forest/box.jpg', 10),
('/src/main/resources/static/images/the_grimm_forest/content.jpg', 10),
('/src/main/resources/static/images/small_world/box.jpg', 11),
('/src/main/resources/static/images/small_world/content.jpg', 11);

INSERT INTO order_products (order_id, product_id, quantity) VALUES
(1, 1, 1),
(2, 4, 1),
(2, 5, 1),
(2, 6, 1),
(3, 9, 1),
(3, 10, 1),
(4, 2, 1),
(5, 8, 1),
(6, 3, 1);

INSERT INTO product_suppliers (product_id, supplier_id, quantity) VALUES
(1, 1, 3),
(2, 2, 2),
(3, 3, 4),
(4, 4, 1),
(5, 1, 5),
(6, 2, 4),
(7, 3, 4),
(8, 4, 5),
(9, 1, 2),
(10, 2, 3),
(11, 3, 4);
