FROM node:18-alpine
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=$PATH:/home/node/.npm-global/bin
WORKDIR /home/node
COPY package*.json ./
RUN npm cache clean -f
RUN npm i corepack -g
RUN yarn
COPY . .