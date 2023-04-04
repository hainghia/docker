## [Multi-platform images](https://docs.docker.com/build/building/multi-platform/)

Với việc Apple chuyển tất cả các máy của họ sang
silicon dựa trên ARM tùy chỉnh và AWS cung cấp tỷ lệ hiệu suất trên chi phí tốt nhất với các phiên bản Graviton2 của họ,
người ta không còn mong đợi rằng tất cả phần mềm chỉ cần chạy trên bộ xử lý x86.

```shell
docker kill $(docker ps -aq); docker rm $(docker ps -aq); docker rmi $(docker images -aq); docker volume prune -f; docker system prune --all --force
```

```shell
 docker buildx ls
```