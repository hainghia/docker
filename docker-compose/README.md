![logo](docker-compose.png?raw=true)
___

## [Docker Compose-file](https://docs.docker.com/compose/compose-file/)

> Từ cuối tháng 6 năm 2023, Compose V1 sẽ không được hỗ trợ nữa và sẽ bị xóa khỏi tất cả các phiên bản Docker
> Desktop. <br>
> `docker-compose` sẽ không còn khả dụng mà phải chuyển qua `docker compose`

Docker Compose V2 được viết hoàn toàn bằng Go thay vì Python như V1. [Github](https://github.com/docker/compose)

#### Kiểm tra version

```shell
docker compose version
```
### [Download Docker Compose](https://github.com/docker/compose#where-to-get-docker-compose)
Thông thường Docker Compose sẽ được cài kèm theo [Docker Desktop](https://www.docker.com/products/docker-desktop/).
Trên Linux có thể tải file nhị phân từ [Releases](https://github.com/docker/compose/releases)

## Docker compose file
Docker compose file có thể xem là một file cấu hình: Services, Networks và Volumes cho các ứng dụng trong Docker
