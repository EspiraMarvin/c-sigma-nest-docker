FROM node:18-alpine
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=$PATH:/home/node/.npm-global/bin
WORKDIR /app
COPY package*.json ./
RUN yarn cache clean -f
RUN yarn
COPY . .
CMD ["yarn", "start:dev"]