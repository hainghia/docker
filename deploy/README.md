### Ansible Commands
**Lưu ý trong folder cần copy file .env.example > .env và thay đổi giá trị tương ứng. Tương tự đối với env.exmaple.yaml > env.yaml**
```shell
ansible all --module-name ansible.builtin.ping --user ubuntu --inventory inventory.yaml
```
```shell
ansible-playbook --inventory inventory.yaml playbook.yaml
```

### Check Version Ubuntu
```shell
lsb_release -a
```
```
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 22.04.2 LTS
Release:        22.04
Codename:       jammy
```

## Commands
```shell
docker inspect users > inspect.json; vim inspect.json;
```
```shell
docker logs --details --follow --timestamps --tail 5 --since 2023-03-13T03:56:33.542039610Z --until 2024-01-01T23:59:59Z www
```
# Deploy application system to AWS EC2 server
[user.kukun.site](http://user.kukun.site/)

```shell
#- Name: ubuntu
#- Region: Singapore
#- Platform: Ubuntu (Linux/UNIX)
#- Public IPv4 address: 18.136.104.245
#- Domain: kukun.site
ssh ubuntu@18.136.104.245
```

```shell
#- Name: Seminar Docker
#- Region: Singapore
#- Platform: Ubuntu (Linux/UNIX)
#- Public IPv4 address: 3.1.202.29
#- Domain: kukun.site
ssh ubuntu@3.1.202.29
```

#### authorized_keys

```shell
Seminar Docker

ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOKE7tRp++q/EjFH/0kr2Bysg70FFHo4tHNTZMpCHI7H private_key
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA1ZEgTK1fAQRL1o920apLM8nZaklDmunVlxB6WJDfzL NTA-PC
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMr9ZCl6TOwf7KoCUI8JQrlhRUACUDHqQ/8VNV59nlGL LapTop
```