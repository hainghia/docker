## Level 1

> *The simplest version*

```shell
#Time to Build Dockerfile for the first time
[+] Building 238.8s (10/10) FINISHED
```

```shell
# Average Dockerfile build time since 2nd time
[+] Building 238.8s (10/10) FINISHED
```

```shell
# Size of Images Obtained
REPOSITORY           TAG       IMAGE ID       CREATED          SIZE
multi-stage-level1   latest    6f745a423530   2 minutes ago    3.38GB
```

## Level 2

> *[Use slim-bookworm or alpine](https://hub.docker.com/_/rust/tags)*

```shell
#Time to Build Dockerfile for the first time
[+] Building 461.3s (15/15) FINISHED
```

```shell
# Average Dockerfile build time since 2nd time
[+] Building 9.7s (14/14) FINISHED
```

```shell
# Size of Images Obtained
REPOSITORY           TAG       IMAGE ID       CREATED          SIZE
multi-stage-level1   latest    560f360da606   30 seconds ago   2.24GB
```

## Level 3

> *[Use slim-bookworm or alpine](https://hub.docker.com/_/rust/tags)*

```shell
#Time to Build Dockerfile for the first time
[+] Building 190.1s (14/14) FINISHED
```

```shell
# Average Dockerfile build time since 2nd time
[+] Building 9.4s (15/15) FINISHED
```

```shell
# Size of Images Obtained
REPOSITORY           TAG       IMAGE ID       CREATED              SIZE
multi-stage-level1   latest    0c13178da97f   About a minute ago   1.67GB
```

## Level 4

> *[Multi-stage builds](https://docs.docker.com/build/building/multi-stage/)*

```shell
#Time to Build Dockerfile for the first time
[+] Building 214.2s (16/16) FINISHED
```

```shell
# Average Dockerfile build time since 2nd time
[+] Building 8.0s (15/15) FINISHED
```

```shell
# Size of Images Obtained
REPOSITORY           TAG       IMAGE ID       CREATED          SIZE
multi-stage-level1   latest    31607e7248ae   16 seconds ago   846MB
```

## Level 5

> *[Multi-stage builds](https://docs.docker.com/build/building/multi-stage/)*

```shell
#Time to Build Dockerfile for the first time
[+] Building 194.2s (18/18) FINISHED
```

```shell
# Average Dockerfile build time since 2nd time
[+] Building 7.8s (17/17) FINISHED
```

```shell
# Size of Images Obtained
REPOSITORY           TAG       IMAGE ID       CREATED          SIZE
multi-stage-level1   latest    e866b7764242   21 seconds ago   100MB
```