FROM nginx:1.25

WORKDIR /var/www/html

COPY dist/lander4.html ./index.html

EXPOSE 80