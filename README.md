# docker_apache_php
Docker image for using apache + php7. You can copy your website to the container.

**How to run it on your computer?**
- create docker image, for example by cmd
```
docker build -t apache-php-alpine:latest .
```
- create docker container from image
```
docker create --name apache apache-php-alpine
```
- start container
```
docker start apache
```

There is the simplest way to start the image. It has a default page 'It works!' and a 'index.php' page with php info.

**How to add my website to a container?**
- create docker image(see previous section)
- create docker container
```
docker create -h [YOUR CONTAINER HOSTNAME] -e DOCUMENT_ROOT=[ENTRY POINT DIRECTORY NAME, default public_html] --name apache apache-php-alpine
```
- copy your zip website to the container
```
docker cp web.zip apache:/home/myapp.example.com.zip
```
You should copy your zip file to /home direcory with name same as CONTAINER HOSTNAME
- start container
```
docker start apache
```
