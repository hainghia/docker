## [Multi-platform images](https://docs.docker.com/build/building/multi-platform/)

```shell
docker kill $(docker ps -aq); docker rm $(docker ps -aq); docker rmi $(docker images -aq); docker volume prune -f; docker system prune --all --force
```
```shell
 docker buildx ls
```