#
# Nginx Dockerfile
#
# https://github.com/dockerfile/nginx
#

# Pull base image.
FROM ubuntu:14.04

LABEL container=hatorade-nginx
# Install Nginx.
RUN \
  apt-get update && \ 
  apt-get install -y nginx
RUN  rm -rf /var/lib/apt/lists/* && \
  chown -R www-data:www-data /var/lib/nginx

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

# Define working directory.
WORKDIR /etc/nginx

# Define default command.
# CMD ["nginx"]
COPY ./nginx.conf /etc/nginx/
# Expose ports.

# Set the default command to execute
# when creating a new container
CMD service nginx start

