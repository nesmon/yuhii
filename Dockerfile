ARG NODE_VERSION=18.16.0

FROM node:${NODE_VERSION}-alpine AS yuhii_node

WORKDIR /home/docker

RUN apk add git

COPY package*.json ./

COPY --from=symfony_php /home/docker/vendor vendor/

RUN npm install --force
## If you are building your code for production
# RUN npm ci --only=production
COPY . .