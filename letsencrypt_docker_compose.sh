docker-compose run --rm --entrypoint "\
  certbot certonly --webroot -w /var/www/certbot \
  --staging \
  --email doug@mail.passiveobserver.com \
  --rsa-key-size 4096 \
  --agree-tos \
  -d hatora.de \
  --force-renewal" certbot
