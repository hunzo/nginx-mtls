FROM nginx:alpine

RUN rm /etc/nginx/conf.d/default.conf

COPY nginx.conf /etc/nginx/conf.d

COPY dhparam /etc/nginx/conf.d
COPY ca.crt /etc/nginx/conf.d
COPY server1.crt /etc/nginx/conf.d
COPY server1.key /etc/nginx/conf.d
