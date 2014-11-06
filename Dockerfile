# Nginx Dockerfile
#
# https://github.com/dockerfile/nginx
#

# Pull base image.
FROM ubuntu:14.04

# Install Nginx.

RUN  apt-get update 
RUN  apt-get -y install software-properties-common
RUN  apt-get -y install -y nginx 
RUN  add-apt-repository -y ppa:nginx/stable 
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf 
RUN chown -R www-data:www-data /var/lib/nginx

# Define mountable directories.
VOLUME ["/data", "/etc/nginx/sites-enabled", "/var/log/nginx"]

# Define working directory.
WORKDIR /etc/nginx

# Define default command.
CMD ["nginx"]
