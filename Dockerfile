# Utiliza una imagen base de Python
FROM python:3.9-slim

# Establece el directorio de trabajo en el contenedor
WORKDIR /app

# Copia los archivos de requisitos al contenedor
COPY requirements.txt .

# Instala las dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Copia el código fuente al contenedor
COPY src/ .

# Expone el puerto en el que tu aplicación se ejecuta (si aplica)
EXPOSE 8000

# Define el comando por defecto para ejecutar la aplicación
CMD ["python", "hello_world.py"]
