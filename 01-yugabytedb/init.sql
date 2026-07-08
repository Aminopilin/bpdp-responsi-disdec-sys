-- =========================================================
-- init.sql
-- Script untuk membuat 2 tabel di YugabyteDB (YSQL / PostgreSQL-compatible)
-- Jalankan dengan: ysqlsh -h <host> -f init.sql
-- =========================================================

-- Hapus tabel jika sudah pernah dibuat sebelumnya (biar bisa dijalankan ulang)
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

-- =========================================================
-- Tabel 1: products
-- =========================================================
CREATE TABLE products (
    id       SERIAL PRIMARY KEY,
    name     VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price    NUMERIC(12,2),
    stock    INT
);

INSERT INTO products (name, category, price, stock) VALUES
('Laptop Asus X415',        'Electronics', 8500000, 15),
('Mouse Logitech M170',     'Electronics',  150000, 50),
('Keyboard Mechanical RGB', 'Electronics',  450000, 30),
('Monitor LG 24 inch',      'Electronics', 2200000, 20),
('Headset Gaming HyperX',   'Electronics',  750000, 25);

-- =========================================================
-- Tabel 2: customers
-- =========================================================
CREATE TABLE customers (
    id    SERIAL PRIMARY KEY,
    name  VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    city  VARCHAR(50),
    phone VARCHAR(20)
);

INSERT INTO customers (name, email, city, phone) VALUES
('Andi Saputra', 'andi.saputra@email.com',  'Yogyakarta', '081234567890'),
('Budi Santoso', 'budi.santoso@email.com',  'Salatiga',   '081234567891'),
('Citra Dewi',   'citra.dewi@email.com',    'Semarang',   '081234567892'),
('Dian Permata', 'dian.permata@email.com',  'Solo',       '081234567893'),
('Eka Wijaya',   'eka.wijaya@email.com',    'Magelang',   '081234567894');

-- =========================================================
-- Verifikasi
-- =========================================================
\dt
SELECT * FROM products;
SELECT * FROM customers;
