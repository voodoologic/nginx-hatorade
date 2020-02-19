FROM ubuntu:18.04
MAINTAINER Doug Headley <headley.douglas@gmail.com>

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y nginx iputils-ping dnsutils

RUN  rm -rf /var/lib/apt/lists/* && \
  chown -R www-data:www-data /var/lib/nginx

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

# Define working directory.
WORKDIR /etc/nginx

# CMD ["nginx"]
COPY ./nginx.conf /etc/nginx/
COPY ./local.conf /etc/nginx/

# Set the default command to execute
# when creating a new container
# CMD service nginx start
LABEL container=hatorade-nginx
CMD service nginx start -c /etc/nginx/local.conf
#CMD service nginx start -c /etc/nginx/nginx.conf

