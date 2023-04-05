FROM nginx

WORKDIR /var/www/html
ARG TARGETPLATFORM

RUN echo "I'm building for $TARGETPLATFORM"

COPY ./conf.d/default.conf /etc/nginx/conf.d/default.conf


COPY ./html .
EXPOSE 80