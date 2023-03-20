![logo](logo.svg?raw=true "logo.svg")
___

## Git Repositories

- [GitHub](https://github.com/hainghia/docker)
- [GitLab](https://gitlab.com/hainghia/docker)
- [Bitbucket](https://bitbucket.org/hainghia/docker)

### Remote repository

```shell
git remote -v

git remote add origin git@github.com:hainghia/docker.git
git remote add gitlab git@gitlab.com:hainghia/docker.git
git remote add bitbucket git@bitbucket.org:hainghia/docker.git


git add .; git commit -asm "Initial commit";git push origin main; git push gitlab main; git push bitbucket main
```

# Docker

```shell
docker kill $(docker ps -aq); docker rm $(docker ps -aq); docker rmi $(docker images -aq); docker volume prune -f; docker system prune --all --force

make multi-stage
```

## [Documentation Seminar Docker](https://docs.google.com/document/d/1S3dlG6Lqu7LYZDZDgxbzCSiBhCqc--0vT4pOYD5Ie84)

---

## [Docker CommandLine](./command/README.md)

> Thực hiện một số CommandLine cơ bản của Docker

---

## [Docker Compose](./docker-compose/README.md)

```shell
make docker-compose
```

---

## [Dockerfile](./dockerfile/README.md)

> Giới thiệu về Dockerfile và demo [Multi Stage](./multi-stage/README.md)

```shell
make multi-stage
```

---

## [Docker Wasm](./docker-wasm/README.md)

```shell
make wasm
```

## [Deploy](./deploy/README.md)

```shell
make deploy
```
