# FROM node:18-alpine As development
# FROM node:16-alpine3.16 As development
FROM node:16-alpine3.16 
RUN apk add --no-cache bash
WORKDIR /usr/src/app
COPY package*.json ./
# COPY --from=deps /lib/x86_64-linux-gnu/libz.so.1 /lib/x86_64-linux-gnu/libz.so.1
COPY prisma ./prisma/
RUN yarn add glob rimraf
RUN yarn 
RUN yarn prisma generate dev
EXPOSE 4000
RUN yarn prisma:dev:deploy
COPY . .
CMD [ "yarn", "run", "start:dev" ]















# CMD [ "yarn", "run", "start:migrate:pro" ]



# RUN yarn build
# CMD ["node", "dist/main"]

# FROM node:18-alpine As production
# FROM node:16-alpine3.16 As production
# ARG NODE_ENV=production
# ENV NODE_ENV=${NODE_ENV}
# WORKDIR /usr/src/app
# COPY package*.json ./
# # COPY --from=deps /lib/x86_64-linux-gnu/libz.so.1 /lib/x86_64-linux-gnu/libz.so.1
# COPY prisma ./prisma/
# RUN yarn add glob rimraf
# RUN yarn
# COPY . .
# COPY --from=development /usr/src/app/dist ./dist/
# # CMD ["node", "dist/main"]
# # CMD [ "yarn", "run", "start:migrate:prodd" ]
# CMD [ "yarn", "run", "start:migrate:prod" ]


# ---------------------------------

# FROM node:18-alpine

# WORKDIR /app

# COPY package.json yarn.lock .env prisma ./

# RUN apk add --update --no-cache openssl1.1-compat openssl

# RUN yarn

# RUN yarn prisma generate dev

# RUN yarn prisma migrate deploy

# COPY prisma ./prisma

# COPY . .
# # RUN DOCKER_BUILDKIT=1 docker build -f - . < /tmp/Dockerfile

# # RUN yarn build

# CMD [ "yarn", "run", "start:migrate:prodd" ]

# CMD [ "node", "dist/main.js" ]

# RUN yarn prisma migrate deploy

# --------------------------------------

# FROM node:14 AS builder

# Create app directory
# WORKDIR /app

# A wildcard is used to ensure both package.json AND package-lock.json are copied
# COPY package*.json ./

# Install app dependencies
# RUN yarn install

# COPY . .

# RUN yarn prisma generate
# COPY prisma ./prisma/

# RUN yarn run build

# FROM node:14

# COPY --from=builder /app/node_modules ./node_modules
# COPY --from=builder /app/package*.json ./
# COPY --from=builder /app/dist ./dist

# EXPOSE 4000
# CMD [ "node", "dist/main.js" ]

# CMD [ "npm", "run", "start:prod" ]
# ------------------------------
# FROM node:14 AS builder

# # Create app directory
# WORKDIR /app

# # A wildcard is used to ensure both package.json AND package-lock.json are copied
# RUN yarn prisma generate
# COPY package*.json ./
# COPY prisma ./prisma/

# # Install app dependencies
# RUN npm install

# COPY . .

# RUN npm run build

# FROM node:14

# COPY --from=builder /app/node_modules ./node_modules
# COPY --from=builder /app/package*.json ./
# COPY --from=builder /app/dist ./dist
# COPY --from=builder /app/prisma ./prisma

# EXPOSE 3000
# # 👇 new migrate and start app script
# CMD [  "npm", "run", "start:migrate:prod" ]

# -------------------------------

# FROM node:14 AS builder

# WORKDIR /app

# COPY package*.json .env tsconfig.json tsconfig.build.json ./
# COPY prisma ./prisma/

# RUN yarn add @nestjs/platform-express

# RUN yarn add prisma --dev

# RUN yarn 

# RUN yarn build

# FROM node:14

# COPY . .

# COPY --from=builder /app/node_modules ./node_modules
# COPY --from=builder /app/package*.json ./
# COPY --from=builder /app/dist ./dist
# COPY --from=builder /app/prisma ./prisma
# COPY --from=builder /app/.env ./env
# COPY --from=builder /app/.env ./env
# COPY --from=builder /app/tsconfig.json ./tsconfig.json
# COPY --from=builder /app/tsconfig.build.json ./tsconfig.build.json

# RUN yarn build

# RUN yarn prisma:dev:deploy


# ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
# ENV PATH=$PATH:/home/node/.npm-global/bin
# WORKDIR /app
# COPY package*.json ./
# RUN yarn cache clean -f
# RUN yarn
# COPY . .
# CMD ["yarn", "start:dev"]
