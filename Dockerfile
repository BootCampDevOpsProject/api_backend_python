# Imagen a utilizar 
FROM python:3-slim
# Directorio
WORKDIR /app
# Requerimientos a copiar a la carpeta /app
COPY requirements.txt /app
# Instalar los requerimientos
RUN pip install -r requirements.txt
# Copiar todo al directorio actual
COPY . .
# Exponer el puerto de la app
EXPOSE 5000
# Variable necesaria para app
ENV FLASK_APP=app.py
# Variable dev para app.
ENV FLASK_ENV=development
# Ejecutar comando dentro del contedeor para correr la aplicación
CMD ["flask", "run", "--host", "0.0.0.0"]
