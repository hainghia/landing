FROM nginx:1.25

WORKDIR /var/www/html

COPY dist/lander2.html ./

EXPOSE 80