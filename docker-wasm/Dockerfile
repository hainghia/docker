FROM --platform=linux/amd64 rust:1.68.0 as builder

WORKDIR /app

RUN rustup target add wasm32-wasi

RUN USER=root cargo init

COPY Cargo.lock Cargo.toml ./

RUN cargo build --release --target wasm32-wasi

RUN rm -rf src/*.rs && rm target/wasm32-wasi/release/deps/wasm*

COPY ./src ./src

RUN cargo build --release --target wasm32-wasi

FROM scratch as wasm

COPY --from=builder /app/target/wasm32-wasi/release/wasm.wasm /wasm.wasm
EXPOSE 80
ENTRYPOINT [ "wasm.wasm" ]