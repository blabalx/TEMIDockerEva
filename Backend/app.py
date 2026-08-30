"""
Backend de QuickOrder - API REST
Expone /productos y /dashboard, conectando con MySQL
"""
import os
import time
from flask import Flask, jsonify
import mysql.connector
from mysql.connector import Error

app = Flask(__name__)

# --- Configuración de conexión a la base de datos ---
# variables de entorno definidas en docker-compose.yml
DB_CONFIG = {
    "host": os.environ.get("DB_HOST", "db"),          
    "user": os.environ.get("DB_USER", "root"),
    "password": os.environ.get("DB_PASSWORD", "root"),
    "database": os.environ.get("DB_NAME", "quickorder"),
}


def get_connection(retries=10, delay=3):
  
    last_error = None
    for attempt in range(retries):
        try:
            conn = mysql.connector.connect(**DB_CONFIG)
            return conn
        except Error as e:
            last_error = e
            print(f"Intento {attempt + 1}/{retries}: BD no disponible aún ({e})")
            time.sleep(delay)
    raise last_error


@app.route("/")
def home():
    return jsonify({"mensaje": "API de QuickOrder funcionando"})


@app.route("/productos", methods=["GET"])
def get_productos():
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM productos")
    productos = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify(productos)


@app.route("/dashboard", methods=["GET"])
def get_dashboard():
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)

    # Total de productos
    cursor.execute("SELECT COUNT(*) AS total FROM productos")
    total_productos = cursor.fetchone()["total"]

    # Precio promedio
    cursor.execute("SELECT AVG(precio) AS promedio FROM productos")
    precio_promedio = float(cursor.fetchone()["promedio"])

    # Producto más económico
    cursor.execute("SELECT * FROM productos ORDER BY precio ASC LIMIT 1")
    producto_mas_economico = cursor.fetchone()

    # Producto más costoso
    cursor.execute("SELECT * FROM productos ORDER BY precio DESC LIMIT 1")
    producto_mas_costoso = cursor.fetchone()

    # 3 productos más económicos
    cursor.execute("SELECT * FROM productos ORDER BY precio ASC LIMIT 3")
    tres_mas_economicos = cursor.fetchall()

    # 5 productos más vendidos
    cursor.execute("SELECT * FROM productos ORDER BY unidades_vendidas DESC LIMIT 5")
    cinco_mas_vendidos = cursor.fetchall()

    # Stock total
    cursor.execute("SELECT SUM(stock) AS stock_total FROM productos")
    stock_total = int(cursor.fetchone()["stock_total"])

    cursor.close()
    conn.close()

    return jsonify({
        "total_productos": total_productos,
        "precio_promedio": round(precio_promedio, 2),
        "producto_mas_economico": producto_mas_economico,
        "producto_mas_costoso": producto_mas_costoso,
        "tres_mas_economicos": tres_mas_economicos,
        "cinco_mas_vendidos": cinco_mas_vendidos,
        "stock_total": stock_total,
    })


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)