FROM rust:1.65

WORKDIR /usr/src/myapp
EXPOSE 8000
COPY myapp/ ./
RUN cargo install --path .
CMD ["myapp"]
