<p align="center">
  <a href="http://nestjs.com/" target="blank"><img src="https://nestjs.com/img/logo_text.svg" width="320" alt="Nest Logo" /></a>
</p>

### Setup Local

## Installation

```bash
$ npm install
```

## Running the app

```bash
# install deps
$ yarn

# start api in dev mode
$ npm run start:dev

# restart postgres in docker and push migrations
$ yarn db:dev:restart

# production mode
$ npm run start:prod
```

## Others

start the postgres image With Docker

```bash
docker-compose up --build --force-recreate -detach
```

Start postgres in docker and run prisma migrations

```bash
yarn db:dev:restart
```

Prisma studio

```bash
npx prisma studio
```

Start Test db image and run prisma migrations

```bash
yarn db:test:restart
```
