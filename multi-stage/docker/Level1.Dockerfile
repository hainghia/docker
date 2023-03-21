FROM rust:1.68 as rust
WORKDIR /web
COPY . .
RUN cargo install --path .
CMD ["web"]