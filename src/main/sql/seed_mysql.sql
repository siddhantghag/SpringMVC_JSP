USE omsdb;

-- Using DelegatingPasswordEncoder format:
-- {noop} means no encoding; quick start for dev.
-- Switch to {bcrypt}<hash> once you migrate to BCrypt.

INSERT INTO users(username, password, role, enabled) VALUES
('admin', '{noop}admin123', 'ADMIN', 1),
('customer', '{noop}customer123', 'CUSTOMER', 1);

INSERT INTO categories(name, description) VALUES
('Books', 'Fiction and non-fiction'),
('Electronics', 'Gadgets and accessories'),
('Clothing', 'Men and Women apparel');

INSERT INTO products(name, description, price, stockQuantity, imageUrl, category_id) VALUES
('Java Handbook', 'Complete guide to Java', 699.00, 20, NULL, (SELECT id FROM categories WHERE name='Books')),
('Wireless Mouse', '2.4G ergonomic mouse', 899.00, 30, NULL, (SELECT id FROM categories WHERE name='Electronics')),
('T-Shirt', '100% cotton tee', 499.00, 50, NULL, (SELECT id FROM categories WHERE name='Clothing'));