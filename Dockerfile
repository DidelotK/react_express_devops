FROM node:6.11

MAINTAINER Axel Camara <axel.camara@hotmail.fr>

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Bundle app source
COPY /app /usr/src/app

# Install app dependencies
RUN cd /usr/src/app/client && npm install
RUN cd /usr/src/app/server && npm install

# Build client
RUN cd /usr/src/app/client && npm run build

# Run server
RUN cd /usr/src/app/server && npm start

EXPOSE 4000

CMD [ "npm", "start" ]
