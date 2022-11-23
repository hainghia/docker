FROM rust:1.67 as rust
WORKDIR /web
COPY . .
RUN cargo install --path .
CMD ["web"]