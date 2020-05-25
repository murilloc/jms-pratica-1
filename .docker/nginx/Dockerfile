FROM nginx:1.17.10-alpine
RUN apk update
RUN apk add bash

RUN rm /etc/nginx/conf.d/default.conf
COPY ./nginx.conf /etc/nginx/conf.d
