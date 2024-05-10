# Imagen a utilizar para Python 
FROM python:3-slim

# Directorio de trabajo
WORKDIR /app

# Copiar los requerimientos a /app
COPY requirements.txt /app

# Instalar los requerimientos
RUN pip install -r requirements.txt

# Copiar todo al directorio actual
COPY . .

# Exponer el puerto 5000 para tener acceso fuera del contenedor
EXPOSE 5000

# Variable de entorno FLAS_APP y FLASK_ENV
ENV FLASK_APP=app.py
ENV FLASK_ENV=development

# Iniciar aplicación
CMD ["flask", "run", "--host", "0.0.0.0"]
