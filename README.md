<p align="center">
  <a href="http://nestjs.com/" target="blank"><img src="https://nestjs.com/img/logo_text.svg" width="320" alt="Nest Logo" /></a>
</p>

## Running the app

```bash
# install deps
$ yarn install

# restart postgres in docker and push migrations
$ docker-compose up

## in detach mode
$ docker-compose up -d

# Enter into the nest app shell
$ docker ps -a
$ docker exec -it container-id bash
$ npx prisma migrate deploy

```
