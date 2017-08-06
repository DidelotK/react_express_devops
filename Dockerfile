FROM node:6.11

MAINTAINER Axel Camara <axel.camara@hotmail.fr>

# Create app directory
RUN mkdir -p /app

# Bundle app source
COPY app /app

# Install app dependencies
RUN cd /app/client && npm install
RUN cd /app/server && npm install

# Build client
RUN cd /app/client && npm run build

# set a health check
#HEALTHCHECK --interval=5s \
#            --timeout=5s \
#            CMD curl -f http://127.0.0.1:4000 || #exit 1

EXPOSE 4000

WORKDIR /app/server

CMD ["npm", "start"]
