FROM rust:1.65 as builder

WORKDIR /usr/src/myapp
COPY myapp/ ./
RUN cargo install --path .

FROM debian:buster-slim
RUN apt-get update && apt-get install -y extra-runtime-dependencies && rm -rf /var/lib/apt/lists/*
COPY --from=builder /usr/local/cargo/bin/myapp /usr/local/bin/myapp
FROM debian:bookworm-slim
RUN apt-get update && apt-get install -y libpq-dev curl
COPY --from=builder /usr/local/cargo/bin/myapp /usr/local/bin/myapp

CMD ["myapp"]
