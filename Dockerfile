FROM node:16-alpine3.16 

#installs bash in the container
RUN apk add --no-cache bash

#sets working directory
WORKDIR /usr/src/app

COPY package*.json .env ./

COPY prisma ./prisma/

#installs deep delete module for files & folders
RUN yarn add glob rimraf

RUN yarn 

#generates prisma client
RUN yarn prisma generate dev

COPY . .

CMD [ "yarn", "run", "start:dev" ]
