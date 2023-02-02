# https://christitus.com/why-we-dont-browse-the-internet-anymore/
# https://github.com/FreshRSS/FreshRSS/tree/edge/Docker

# Feed Aggregation
    docker run -d \
    --name=full-test-rss \
    -e PUID=1000 \
    -e PGID=1000 \
    -p 50000:80 \
    --restart always \
    heussd/fivefilters-full-text-rss:latest

 # Feed Reader
docker run -d --restart unless-stopped --log-opt max-size=10m \
  -p 49999:80 \
  -e TZ=Australia/Melbourne \
  -e PUID=1000 \
  -e PGID=1000 \
  -e 'CRON_MIN=1,31' \
  -v freshrss_data:/var/www/FreshRSS/data \
  -v freshrss_extensions:/var/www/FreshRSS/extensions \
  --name freshrss \
  freshrss/freshrss
