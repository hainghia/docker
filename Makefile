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