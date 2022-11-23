![logo](logo.svg?raw=true)
___
```shell
docker run -dp 8080:8080 --name=wasm-example --runtime=io.containerd.wasmedge.v1 --platform=wasi/wasm32 michaelirwin244/wasm-example
```

```shell
docker compose down; docker compose build; docker compose up -d
```