DROP DATABASE IF EXISTS board_games_site;
CREATE DATABASE board_games_site;
USE board_games_site;

CREATE TABLE addresses(
	id INT AUTO_INCREMENT PRIMARY KEY,
    address VARCHAR(255) NOT NULL UNIQUE,
    postal_code VARCHAR(15) NOT NULL,
    city VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL
);

CREATE TABLE contacts_info(
	id INT AUTO_INCREMENT PRIMARY KEY,
    email_address VARCHAR(100) NOT NULL UNIQUE,
    telephone VARCHAR(10) NOT NULL UNIQUE,
    address_id INT NOT NULL,
    FOREIGN KEY (address_id) REFERENCES addresses(id)
);

CREATE TABLE customers(
	id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    contact_info_id INT NOT NULL UNIQUE,
    FOREIGN KEY (contact_info_id) REFERENCES contacts_info(id)
);

CREATE TABLE accounts(
	id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(20) NOT NULL,
    type ENUM ("Admin", "Customer") NOT NULL,
    date_of_creation DATE NOT NULL,
    customer_id INT NULL UNIQUE DEFAULT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE suppliers(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    contact_info_id INT NOT NULL UNIQUE,
    FOREIGN KEY (contact_info_id) REFERENCES contacts_info(id)
);

CREATE TABLE orders(
	id INT AUTO_INCREMENT PRIMARY KEY,
    date_made DATE NOT NULL,
    status ENUM("In progress", "Canceled", "Completed") DEFAULT "In progress",
    date_completed DATE NULL DEFAULT NULL,
    total FLOAT NOT NULL,
    is_payed BOOLEAN NOT NULL DEFAULT FALSE,
    payment_method ENUM("On receive", "By card"),
    customer_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE publishers(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE products(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description VARCHAR(255) NOT NULL UNIQUE, #Saves a file path to a txt file
    price FLOAT NOT NULL,
    rating FLOAT(1) NOT NULL DEFAULT 0.0,
    min_player_cnt INT NOT NULL,
    max_player_cnt INT NOT NULL,
    min_play_time TIME NOT NULL,
    max_play_time TIME NOT NULL,
    min_player_age INT NOT NULL,
    publisher_id INT NOT NULL,
    FOREIGN KEY (publisher_id) REFERENCES publishers(id)
);

CREATE TABLE categories(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE product_categories(
	id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    category_id INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (category_id) REFERENCES categories(id),
    CONSTRAINT UNIQUE (product_id, category_id)
);

CREATE TABLE images(
	id INT AUTO_INCREMENT PRIMARY KEY,
    path VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE product_images(
	id INT AUTO_INCREMENT PRIMARY KEY,
	product_id INT NOT NULL,
    image_id INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (image_id) REFERENCES images(id)
);

CREATE TABLE order_products(
	id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id),
    CONSTRAINT UNIQUE (order_id, product_id)
);

CREATE TABLE supply(
	id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    supplier_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(id),
    CONSTRAINT UNIQUE (product_id, supplier_id)
);