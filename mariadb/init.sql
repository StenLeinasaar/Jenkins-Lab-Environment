-- Drop the database if it exists and create a new one
DROP DATABASE IF EXISTS fastbuy_db;
CREATE DATABASE fastbuy_db;
USE fastbuy_db;

-- Create a user for accessing the database
CREATE USER IF NOT EXISTS 'fastbuy_user'@'%' IDENTIFIED BY '';

-- Grant privileges to the user
GRANT ALL PRIVILEGES ON fastbuy_db.* TO 'fastbuy_user'@'%';

-- Create the deals table with additional fields
CREATE TABLE deals (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    deal_description TEXT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    discount_percentage INT CHECK (discount_percentage BETWEEN 0 AND 100),
    stock INT NOT NULL CHECK (stock >= 0),
    image_url VARCHAR(500),
    total_rating DECIMAL(2,1) CHECK (total_rating BETWEEN 0 AND 5)
);

-- Insert sample data
INSERT INTO deals (product_name, deal_description, price, discount_percentage, stock, image_url, total_rating)
VALUES
    ("Nike Running Shoes", "50% off on Nike Air Zoom Pegasus!", 65.00, 50, 120, "https://images.unsplash.com/photo-1542291026-7eec264c27ff?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", 4.8),
    ("Men's Cotton T-Shirts", "Buy 1 Get 1 Free on premium cotton tees!", 25.00, 50, 300, "https://plus.unsplash.com/premium_photo-1718913936342-eaafff98834b?q=80&w=2672&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", 4.5),
    ("Samsung 55-inch 4K TV", "Huge Discount on Samsung Smart TV – Limited time!", 499.99, 30, 50, "https://images.unsplash.com/photo-1593305841991-05c297ba4575?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8c2Ftc3VuJTIwdHZ8ZW58MHx8MHx8fDA%3D", 4.7),
    ("Dyson V11 Vacuum Cleaner", "Flat 30% off on Dyson Cordless Vacuum!", 349.00, 30, 80, "https://images.unsplash.com/photo-1527515637462-cff94eecc1ac?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZHlzb24lMjB2YWN1dW18ZW58MHx8MHx8fDA%3D", 4.9),
    ("MacBook Air M2", "Get 40% off on the latest Apple MacBook Air!", 899.99, 40, 25, "https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bWFjYm9va3xlbnwwfHwwfHx8MA%3D%3D", 4.6),
    ("Women's Summer Dress", "Summer Sale: 25% off on Floral Midi Dresses!", 39.99, 25, 150, "https://images.unsplash.com/photo-1520310809185-5cc119cf8b08?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8d29tZW4ncyUyMHN1bW1lciUyMGRyZXNzfGVufDB8fDB8fHww", 4.4),
    ("Amazon Orders", "Free Shipping on all orders above $50!", 50.00, 0, 9999, "https://images.unsplash.com/photo-1522780550166-284a0288c8df?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8YW1hem9ufGVufDB8fDB8fHww", 5.0),
    ("Maybelline Lipstick Set", "20% off on Maybelline Beauty Products!", 18.99, 20, 200, "https://plus.unsplash.com/premium_photo-1661772819014-1fe81103e12b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8bGlwc3RpY2t8ZW58MHx8MHx8fDA%3D", 4.3),
    ("L'Oréal Skincare Pack", "Buy 2 Get 1 Free on L'Oréal skincare essentials!", 49.99, 33, 100, "https://images.unsplash.com/photo-1598440947619-2c35fc9aa908?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHNraW5jYXJlfGVufDB8fDB8fHww", 4.7),
    ("Modern Office Desk", "15% off on premium wooden office furniture!", 199.00, 15, 60, "https://images.unsplash.com/photo-1518455027359-f3f8164ba6bd?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fG9mZmljZSUyMGRlc2t8ZW58MHx8MHx8fDA%3D", 4.5);

-- Flush privileges to apply the user and permission changes
FLUSH PRIVILEGES;
