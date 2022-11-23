![logo](logo.svg?raw=true "logo.svg")
___

## [Trunk Commands](https://trunkrs.dev/commands)

[trunkrs](https://trunkrs.dev/#install)
```shell
cargo install --locked trunk
```
`trunk build` runs a cargo build targeting the wasm32 instruction set, runs `wasm-bindgen` on the built WASM, and spawns
asset build pipelines for any assets defined in the target `index.html`


```shell
trunk build --release
```

`trunk watch` does the same thing as `trunk build`, but also watches the filesystem for changes, triggering new builds
as changes are detected.

```shell
trunk watch
```

`trunk serve` does the same thing as `trunk watch`, but also spawns a web server.

```shell
trunk serve
```

Cleans up any build artifacts generated from earlier builds.

```shell
trunk clean
```