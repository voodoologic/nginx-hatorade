docker run -it --rm --name letsencrypt \
  -v "/etc/letsencrypt:/etc/letsencrypt" \
  -v "/var/lib/letsencrypt:/var/lib/letsencrypt" \
  quay.io/letsencrypt/letsencrypt:latest \
  certonly \
  -d hatora.de \
  -d *.hatora.de \
  --manual \
  --preferred-challenges dns \
  --server https://acme-v02.api.letsencrypt.org/directory
