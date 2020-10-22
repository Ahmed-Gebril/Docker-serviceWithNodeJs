FROM node:12

# ARG http_proxy=${DOCKER_HTTP_PROXY}

WORKDIR /app


# copying package-lock and package.json


COPY package*.json ./

RUN npm install


# Bundle app source
COPY . .

EXPOSE 9000
CMD [ "node", "server.js" ]
