# pull the latest official nginx image
FROM --platform=linux/amd64 nginx:stable

# copy the additional nginx configuration
COPY alexcv /etc/nginx/conf.d/alexcv

COPY html /usr/share/nginx/html/
RUN rm /usr/share/nginx/html/index.html
COPY index.html /usr/share/nginx/html/index.html

STOPSIGNAL SIGQUIT

CMD ["nginx", "-g", "daemon off;"]