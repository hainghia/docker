## [Multi-platform images](https://docs.docker.com/build/building/multi-platform/)

### [Building from Compose file](https://docs.docker.com/build/bake/compose-file/)

Với việc Apple chuyển tất cả các máy của họ sang
silicon dựa trên ARM tùy chỉnh và AWS cung cấp tỷ lệ hiệu suất trên chi phí tốt nhất với các phiên bản Graviton2 của họ,
người ta không còn mong đợi rằng tất cả phần mềm chỉ cần chạy trên bộ xử lý x86.
https://www.docker.com/blog/faster-multi-platform-builds-dockerfile-cross-compilation-guide/

```shell
docker kill $(docker ps -aq); docker rm $(docker ps -aq); docker rmi $(docker images -aq); docker volume prune -f; docker system prune --all --force
```

```shell
 docker buildx ls
```

```shell
docker buildx build --platform linux/amd64,linux/arm64 -t kukun/multi-platform-multi-platform .
```

Check Platform Image
```shell
brew install jq
docker image inspect {images_name} | jq '.[0].Os + "/" + .[0].Architecture'

# Or
docker image inspect 3f702f961473 | grep Architecture
```