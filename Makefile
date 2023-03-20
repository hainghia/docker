.PHONY: docker-compose
docker-compose:
	docker compose -f docker-compose/docker-compose.yaml down
	docker compose -f docker-compose/docker-compose.yaml build
	docker compose -f docker-compose/docker-compose.yaml up -d


.PHONY: multi-stage
multi-stage:
	docker compose -f multi-stage/docker-compose.yaml down
	docker compose -f multi-stage/docker-compose.yaml build
	docker compose -f multi-stage/docker-compose.yaml up -d

.PHONY: wasm
wasm:
	docker compose -f docker-wasm/docker-compose.yaml down
	docker compose -f docker-wasm/docker-compose.yaml build
	docker compose -f docker-wasm/docker-compose.yaml up -d

.PHONY: deploy
deploy:
	@if [ -z $$(docker network ls --filter name=haproxy_network -q) ]; then \
		docker network create haproxy_network; \
		echo "Network haproxy_network has been created successfully"; \
	else \
		echo "Network haproxy_network already exists"; \
	fi

	docker compose -f deploy/users/github/docker-compose.yaml down
	docker compose -f deploy/users/gitlab/docker-compose.yaml down
	docker compose -f deploy/web-assembly/docker-compose.yaml down
	docker compose -f deploy/haproxy/docker-compose.yaml down

	docker compose -f deploy/users/github/docker-compose.yaml build
	docker compose -f deploy/users/gitlab/docker-compose.yaml build
	docker compose -f deploy/web-assembly/docker-compose.yaml build
	docker compose -f deploy/haproxy/docker-compose.yaml build

	docker compose -f deploy/users/github/docker-compose.yaml up -d
	docker compose -f deploy/users/gitlab/docker-compose.yaml up -d
	docker compose -f deploy/web-assembly/docker-compose.yaml up -d
	docker compose -f deploy/haproxy/docker-compose.yaml up -d