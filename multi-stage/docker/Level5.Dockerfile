FROM rust:1.68-slim-bookworm as builder

ARG PROJECT_NAME="web"

WORKDIR /${PROJECT_NAME}

# 1. Create a new empty shell project
RUN USER=root cargo init

# 2. Copy our manifests
COPY Cargo.lock Cargo.toml ./

# 3. Build only the dependencies to cache them
RUN cargo build --release
RUN rm -rf src/*.rs

# 4. Now that the dependency is built, copy your source code
COPY ./src ./src

# 5. Build for release.
RUN rm ./target/release/deps/${PROJECT_NAME}*
RUN cargo install --path .


FROM debian:bookworm-slim
# copy the build artifact from the build stage
COPY --from=builder /usr/local/cargo/bin/${PROJECT_NAME} /bin/
CMD ["web"]