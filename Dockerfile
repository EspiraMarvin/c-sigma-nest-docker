FROM node:16-alpine3.16 

RUN apk add --no-cache bash

WORKDIR /usr/src/app

COPY package*.json .env ./

COPY prisma ./prisma/

RUN yarn add glob rimraf

RUN yarn 

RUN yarn prisma generate dev

COPY . .

CMD [ "yarn", "run", "start:dev" ]
