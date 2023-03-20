<p style="display: flex; justify-content: center"><img src="./dockerfile.svg" alt="Logo" width="400"></p>
___

### Dockerfile dùng để xây dựng một Image

- `Dockerfile` chứa các hướng dẫn cho Docker Engine để xây dựng một image Docker. Tên mặc định của Dockerfile
  là `Dockerfile` và không có phần mở rộng.
  Đối với tên mặc định chúng ta có thể sử dụng các lệnh `docker build`, `docker run` mà không cần gắn
  tag `--file Dockerfile`

### [Cú pháp `Dockerfile`](https://docs.docker.com/engine/reference/builder/#format):

- Quy ước instruction nên viết HOA

```shell
# Comment
INSTRUCTION arguments
```

- Luôn được bắt đầu bằng `FROM nginx` of `FROM scratch`

- Dockerfile được xây dựng dưa trên các [Layer](https://docs.docker.com/glossary/#layer). Do đó chúng rất nhanh và nhẹ

```shell
FROM [--platform= [AS <platform >] <image >[: <tag >] <name >]

```

- Không nên có khoảng trắng trước mỗi Layer

```shell
        directive# this is a comment-line
    RUN echo hello
RUN echo world
```

Trừ khoảng trắng trong các đối số command

```shell
RUN echo "\
     hello\
     world"
```

- Biến môi trường được khai báo bằng ENV

```shell
ENV PORT="80"

RUN echo $PORT ${PORT}
```

### [Tệp `.dockerignore` hoạt động tương tự `.gitignore`](https://docs.docker.com/engine/reference/builder/#dockerignore-file)

```shell
# comment
*/temp*
*/*/temp*
temp?
```

### [FROM](https://docs.docker.com/engine/reference/builder/#from)

```shell
FROM [--platform=<platform>] <image> [AS <name>]
FROM [--platform=<platform>] <image>[:<tag>] [AS <name>]
FROM [--platform=<platform>] <image>[@<digest>] [AS <name>]
```

### [WORKDIR](https://docs.docker.com/engine/reference/builder/#workdir)

```shell
ENV DIRPATH=/path
WORKDIR $DIRPATH/$DIRNAME
RUN pwd
```

### [RUN](https://docs.docker.com/engine/reference/builder/#run)

```shell
RUN <command>
RUN /bin/bash -c 'source $HOME/.bashrc && echo $HOME'

RUN ["executable", "param1", "param2"]
RUN ["/bin/bash", "-c", "echo hello"]

# Ở dạng JSON , cần phải thoát dấu gạch chéo ngược. Điều này đặc biệt có liên quan trên Windows nơi dấu gạch chéo ngược là dấu phân cách đường dẫn
RUN ["c:\\windows\\system32\\tasklist.exe"]
```

### [CMD](https://docs.docker.com/engine/reference/builder/#cmd)

Chỉ có thể có một `CMD` hướng dẫn trong tệp Dockerfile. Nếu nhiều hơn một `CMD` thì chỉ cái cuối cùng `CMD` mới có
hiệu lực.
`RUN` thực sự chạy một lệnh và cam kết kết quả; `CMD` không thực thi bất cứ điều gì tại thời điểm xây dựng, nhưng chỉ
định lệnh dự định cho Image.

```shell
CMD ["executable","param1","param2"]
CMD ["param1","param2"]
CMD command param1 param2
```

[EXPOSE](https://docs.docker.com/engine/reference/builder/#expose)

```shell
EXPOSE 80/tcp
EXPOSE 80/udp
```

### [ENV ](https://docs.docker.com/engine/reference/builder/#env)

```shell
ENV MY_NAME="John Doe"
ENV MY_DOG=Rex\ The\ Dog
ENV MY_CAT=fluffy
```

### [ARG](https://docs.docker.com/engine/reference/builder/#arg)

Không sử dụng secret đặt vào ARG

```shell
ARG <name>[=<default value>]
```

### [ADD](https://docs.docker.com/engine/reference/builder/#add)

```shell
ADD [--chown=<user>:<group>] [--checksum=<checksum>] <src>... <dest>
ADD [--chown=<user>:<group>] ["<src>",... "<dest>"]
```

### [COPY](https://docs.docker.com/engine/reference/builder/#copy)

```shell
COPY --chown=55:mygroup files* /somedir/
COPY --chown=bin files* /somedir/
COPY --chown=1 files* /somedir/
COPY --chown=10:11 files* /somedir/
```

### [ENTRYPOINT](https://docs.docker.com/engine/reference/builder/#entrypoint)

```shell
ENTRYPOINT ["executable", "param1", "param2"]
```

### [USER](https://docs.docker.com/engine/reference/builder/#user)

```shell
USER <user>[:<group>]
```

# [Các nguyên tắc của The Twelve-Factor](https://12factor.net)

- Codebase
- Dependencies
- Config
- Backing services
- Build, release, run
- Processes
- Port binding
- Concurrency
- Disposability
- Dev/prod parity
- Logs
- Admin processes

## [Các phương pháp hay nhất để viết Dockerfiles](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)

### [Dockerfile có thể được build qua stdin](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#pipe-dockerfile-through-stdin)

```shell
docker build -t myimage:latest -<<EOF
FROM busybox
RUN echo "hello world"
EOF
```

- Phù hợp trong trường hợp chỉ build `Dockerfile` 1 lần duy nhất và không update nó.
- Không có file `Dockerfile` nào được gửi tới `docker daemon` dó đó quá trình build nhanh hơn
- Không sử dụng được `COPY` hoặc `ADD`

### [Multi Stage Builds](https://docs.docker.com/build/building/multi-stage/)

Bản dựng nhiều giai đoạn cho phép bạn giảm đáng kể kích thước của Image cuối cùng mà không gặp khó khăn trong việc giảm
số lượng tệp và lớp trung gian.
[Demo 5 stage](../multi-stage)

### [Không cài đặt các Package dư thừa](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#dont-install-unnecessary-packages)

### [Mỗi Images chỉ nên thực hiện một chức năng](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#decouple-applications)

Ví dụ Ứng dụng Web nên tách ra PHP, Nginx, Mysql riêng biệt thay vì gộp chung

### [Giảm thiểu số lượng Layer](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#minimize-the-number-of-layers)

Nhiều giai đoạn nhưng giảm thiểu số lượng Layer

```shell
RUN apt-get update && apt-get install -y \
  bzr \
  cvs \
  git \
  mercurial \
  subversion \
  && rm -rf /var/lib/apt/lists/*
```

thay vì

```shell
RUN apt-get update && 
RUN apt-get install -y bzr
RUN apt-get install -y cvs
RUN apt-get install -y git
RUN apt-get install -y  mercurial
RUN apt-get install -y  subversion
RUN rm -rf /var/lib/apt/lists/*
```

### [Tận dụng bộ đệm](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#leverage-build-cache)

Nếu bạn hoàn toàn không muốn sử dụng bộ đệm, bạn có thể sử dụng tùy --no-cache=true chọn trên docker buildlệnh. Tuy
nhiên, nếu bạn cho phép Docker sử dụng bộ đệm của nó, điều quan trọng là phải hiểu khi nào nó có thể và không thể tìm
thấy một hình ảnh phù hợp.

### [Cân nhắc sử dụng các bản Alpine, Slim](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#dockerfile-instructions)

