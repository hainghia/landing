FROM nginx:1.25

WORKDIR /var/www/html

COPY dist/lander3.html ./index.html

EXPOSE 80