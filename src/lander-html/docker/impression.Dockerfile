FROM nginx:1.25

WORKDIR /var/www/html

COPY impression/index.html ./index.html

EXPOSE 80