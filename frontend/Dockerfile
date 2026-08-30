# Utilizar la imagen oficial ligera de Nginx basada en Alpine
FROM nginx:alpine

# Copiar la configuración personalizada de Nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copiar los archivos estáticos al directorio público de Nginx
COPY . /usr/share/nginx/html

# Exponer el puerto 80 del contenedor
EXPOSE 80

# Iniciar Nginx en primer plano
CMD ["nginx", "-g", "daemon off;"]