FROM nginx:1.25

WORKDIR /var/www/html

COPY dist/lander6.html ./

EXPOSE 80