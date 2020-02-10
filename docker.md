# Comandos útiles de docker

- **docker ps**: muestra los contenedores que estan corriendo
- **docker pull**: descargar imagen
- **docker images**: muestra todas las imagenes descargadas
- **docker run -p "80:80" -v ${PWD}/app:/app mattrayner/lamp:latest-1604**: hacer correr la imagen en el contenedor
- **docker rmi -f (idImagen)**: borrar imagen
- **docker-compose up**: para levantar el docker cuando ya esta el docker-compose.yml
- **docker-compose up --build**: para reconstruir y que te tome los cambios.
- **docker exec -it (id) bash**: entra al linux
- **docker rm $(docker ps -q) -f**: sacar todos los contenedores
- **docker rmi $(docker images -q) -f** sacar todas las imagenes.
- **docker-compose down** siempre que no se cierre bien.
- **docker exec -t (id) mysql -u root -p**: Conectarse a la base de datos por comando.
- Para montar el volumen en una ruta, hay que hacerlo desde el archivo .yml o yaml y en todos los servicios que se levantan. EJEMPLO:
             volumes:
            - ./public:/var/www/public

