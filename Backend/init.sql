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
('Arroz', 'Abarrotes', 8.50, 120, 340),
('Aceite Vegetal', 'Abarrotes', 15.90, 80, 210),
('Azucar', 'Abarrotes', 6.20, 150, 180),
('Fideo Spaghetti', 'Abarrotes', 5.40, 200, 95),
('Leche Entera', 'Lácteos', 7.80, 100, 420),
('Yogurt Natural', 'Lácteos', 12.50, 60, 150),
('Queso Fresco', 'Lácteos', 22.00, 40, 88),
('Mantequilla', 'Lácteos', 9.90, 70, 60),
('Pan Integral', 'Panadería', 4.50, 90, 300),
('Pan Blanco', 'Panadería', 3.80, 100, 275),
('Galletas Saladas', 'Panadería', 6.00, 130, 190),
('Galletas Dulces', 'Panadería', 6.50, 130, 205),
('Manzana', 'Frutas', 9.00, 60, 130),
('Platano', 'Frutas', 4.50, 80, 260),
('Naranja', 'Frutas', 6.00, 70, 150),
('Palta', 'Frutas', 14.00, 40, 95),
('Tomate', 'Verduras', 7.00, 90, 180),
('Cebolla', 'Verduras', 5.50, 100, 160),
('Papa', 'Verduras', 4.00, 150, 340),
('Zanahoria', 'Verduras', 5.00, 80, 90),
('Pollo Entero', 'Carnes', 18.00, 50, 210),
('Carne de Res', 'Carnes', 35.00, 30, 75),
('Pescado', 'Carnes', 22.50, 35, 60),
('Huevos', 'Abarrotes', 11.00, 100, 380),
('Detergente', 'Limpieza', 13.50, 60, 40),
('Jabon', 'Limpieza', 3.20, 200, 220),
('Papel Higienico', 'Limpieza', 10.00, 90, 300),
('Lejia', 'Limpieza', 5.80, 70, 55),
('Coca Cola', 'Bebidas', 9.50, 100, 410),
('Agua Mineral', 'Bebidas', 4.00, 150, 500);