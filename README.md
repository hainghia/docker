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