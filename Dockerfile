FROM registry1-docker-io.repo.lab.pl.alcatel-lucent.com/node:12-alpine

# ARG http_proxy=${DOCKER_HTTP_PROXY}

WORKDIR /app

# Config artifactory proxy
COPY repositories /etc/apk/repositories

RUN wget repo.lab.pl.alcatel-lucent.com/node-js/v11.15.0/node-v11.15.0.tar.gz

RUN npm config set unsafe-perm true
RUN npm config set --global tarball /app/node-v11.15.0.tar.gz


# copying package-lock and package.json


COPY package*.json ./


RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 9000
CMD [ "node", "server.js" ]