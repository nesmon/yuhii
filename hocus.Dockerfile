FROM hocusdev/workspace

# Set up node
RUN { curl --retry-all-errors --connect-timeout 5 --retry 5 --retry-delay 0 --retry-max-time 40 -fsSL https://deb.nodesource.com/setup_18.x | sudo bash -; } \
    && DEBIAN_FRONTEND=noninteractive sudo apt-get install -y nodejs \
    && sudo apt-get clean \
    && sudo rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && sudo npm install -g npm@latest

# start the docker daemon by using the sock file
FROM docker:20.10.9-dind as docker

# Install Docker Compose
RUN apk update && apk add docker-compose

# Run docker compose
WORKDIR /home/docker

COPY . .

CMD ["docker", "compose", "up", "-d"]