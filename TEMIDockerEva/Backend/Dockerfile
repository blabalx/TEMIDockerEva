FROM python:3.12-slim

# Directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiamos primero requirements para aprovechar el cache de Docker
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiamos el código de la aplicación
COPY app.py .

# Puerto en el que corre Flask
EXPOSE 5000

# Comando que arranca el backend al iniciar el contenedor
CMD ["python", "app.py"]