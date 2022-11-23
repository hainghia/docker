FROM rust:1.65

WORKDIR /usr/src/myapp
COPY myapp/ ./
RUN cargo install --path .
CMD ["myapp"]
