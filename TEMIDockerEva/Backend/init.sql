-- init.sql
-- Este script se ejecuta automáticamente la PRIMERA VEZ que se crea el contenedor
-- de MySQL

CREATE DATABASE IF NOT EXISTS quickorder;
USE quickorder;

CREATE TABLE IF NOT EXISTS productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    unidades_vendidas INT NOT NULL
);

INSERT INTO productos (nombre, categoria, precio, stock, unidades_vendidas) VALUES
('Arroz 1kg', 'Abarrotes', 8.50, 120, 340),
('Aceite Vegetal 1L', 'Abarrotes', 15.90, 80, 210),
('Azúcar 1kg', 'Abarrotes', 6.20, 150, 180),
('Fideo Spaghetti 500g', 'Abarrotes', 5.40, 200, 95),
('Leche Entera 1L', 'Lácteos', 7.80, 100, 420),
('Yogurt Natural 1L', 'Lácteos', 12.50, 60, 150),
('Queso Fresco 500g', 'Lácteos', 22.00, 40, 88),
('Mantequilla 200g', 'Lácteos', 9.90, 70, 60),
('Pan Integral', 'Panadería', 4.50, 90, 300),
('Pan Blanco', 'Panadería', 3.80, 100, 275),
('Galletas Saladas', 'Panadería', 6.00, 130, 190),
('Galletas Dulces', 'Panadería', 6.50, 130, 205),
('Manzana (kg)', 'Frutas', 9.00, 60, 130),
('Plátano (kg)', 'Frutas', 4.50, 80, 260),
('Naranja (kg)', 'Frutas', 6.00, 70, 150),
('Palta (kg)', 'Frutas', 14.00, 40, 95),
('Tomate (kg)', 'Verduras', 7.00, 90, 180),
('Cebolla (kg)', 'Verduras', 5.50, 100, 160),
('Papa (kg)', 'Verduras', 4.00, 150, 340),
('Zanahoria (kg)', 'Verduras', 5.00, 80, 90),
('Pollo Entero (kg)', 'Carnes', 18.00, 50, 210),
('Carne de Res (kg)', 'Carnes', 35.00, 30, 75),
('Pescado (kg)', 'Carnes', 22.50, 35, 60),
('Huevos (docena)', 'Abarrotes', 11.00, 100, 380),
('Detergente 1kg', 'Limpieza', 13.50, 60, 40),
('Jabón de Baño', 'Limpieza', 3.20, 200, 220),
('Papel Higiénico (paq. 4)', 'Limpieza', 10.00, 90, 300),
('Lejía 1L', 'Limpieza', 5.80, 70, 55),
('Coca Cola 2L', 'Bebidas', 9.50, 100, 410),
('Agua Mineral 2L', 'Bebidas', 4.00, 150, 500);