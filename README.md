<p align="center">
<a href="/" target="_blank">
<img src="system_structure.svg" alt="System structure">
</a></p>

<p align="center">
<a>rustc 1.62.0 (fe5b13d68 2022-05-18)</a> |
<a>Microsoft C++ Build Tools</a> |
<a>Cargo 1.62.0</a>
</p>

___
# Installed request

[Rust](https://www.rust-lang.org/tools/install)

[Postgresql](https://www.postgresql.org/download/)

[Apache Kafka](https://kafka.apache.org/quickstart)

[Node.js®](https://nodejs.org/)

[Diesel CLI](https://diesel.rs/guides/getting-started.html) (to install run `cargo install diesel_cli --no-default-features --features postgres`)

[CMake](https://cmake.org/download/#latest). (this is needed for the rust-rdkafka crate to work). Add Cmake path `C:\Program Files\CMake\bin` into environment variable in Window

[LLVM](https://releases.llvm.org/download.html). (this is needed for the rust-rdkafka crate to work). Add Cmake path `C:\Program Files\CMake\bin` into environment variable in Window

---
## Command Line

## Rust

```shell
rustup update
rustc --version
rustup self uninstall
cargo install cargo-watch
```


## Install Nightly Rust
https://doc.rust-lang.org/book/appendix-07-nightly-rust.html
```shell
rustup toolchain install nightly
rustup toolchain list
rustup override set nightly
```

## PostgresQL
https://www.postgresql.org/download/
https://www.enterprisedb.com/downloads/postgres-postgresql-downloads
WARNING: Console code page (437) differs from Windows code page (1252) 8-bit characters might not work correctly. See psql reference page "Notes for Windows users" for details.
```shell
chcp 1252
psql --username postgres --host localhost --port 5432
```
- Drop Database Error
Database Name: database_name
`*ERROR:  database "actix" is being accessed by other users*
*DETAIL:  There are 15 other sessions using the database.*`
```shell
drop database database_name;
REVOKE CONNECT ON DATABASE database_name FROM public;
SELECT pg_terminate_backend(pg_stat_activity.pid) FROM pg_stat_activity WHERE pg_stat_activity.datname = 'database_name';
drop database database_name;
```

## Cargo:

```shell
cargo --version
cargo doc --open
cargo test
cargo build
cargo build --release
cargo build -r
cargo check
cargo bench
cargo run
cargo run --release
cargo watch -x run
```

## Run Apollo Router with Environment variable
https://github.com/apollographql/supergraph-demo-fed2/tree/main/supergraph
```shell
cargo run --bin apollo-router -- -s ./apollo-router/supergraph.graphql -c ./apollo-router/router.yaml
```

- Generate Secret Key 256-bit base64 key: ASN.1 DER formatted private key

```shell
choco install openssl
openssl rand -base64 32
openssl genrsa -out rocket.pem 512
openssl rsa -in rocket.pem -out rocket.der -outform der
```

___

### Diesel CLI

- setting the `DATABASE_URL` environment variable

```shell
# DATABASE_URL: postgres://{user}:{password}@{hostname}:{port}/{database-name}
echo DATABASE_URL=postgres://postgres:ahkvqca0n@localhost:5432/documents > .env
```

- Install the CLI tool

```shell
cargo install diesel_cli
cargo install diesel_cli --no-default-features --features postgres
```

- Setup Diesel for your project

```shell 
diesel setup
```

- Generate a new migration with the given name, and the current timestamp as the version.

```shell
diesel migration generate create_posts
```

- Next, we’ll write the SQL for migrations:

```postgresql
CREATE TABLE posts
(
    id        SERIAL PRIMARY KEY,
    title     VARCHAR NOT NULL,
    body      TEXT    NOT NULL,
    published BOOLEAN NOT NULL DEFAULT FALSE
)
```

And

```postgresql
DROP TABLE posts
```

- Runs all pending migrations.

```shell
diesel migration run
```

- Reverts and re-runs the latest migration. Useful for testing that a migration can in fact be reverted.

```shell
diesel migration redo --all
```

- Reverts the specified migrations.

```shell
diesel migration revert --all
```

- Returns true if there are any pending migrations.

```shell
diesel migration pending
```

- Lists all available migrations, marking those that have been applied.

```shell
diesel migration list
```

### Go Lang migrate CLI

- Installation Windows

```shell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex
scoop install migrate
```

- Usage

```shell
migrate -help
migrate -source file://./src/database/migrations -database postgres://postgres:ahkvqca0n@localhost:5432/documents?sslmode=disable up
```

## NodeJs

```shell
node
http.STATUS_CODES
```

## Install make

```shell
choco install make
make supergraph
```

# Apollo Router Manager

https://www.apollographql.com/docs/federation/quickstart/local-composition/

## Install the Rover CLI

MacOS / Unix-like

```shell
curl -sSL https://rover.apollo.dev/nix/latest | sh
```

Windows

```shell
iwr 'https://rover.apollo.dev/win/latest' | iex
```

- Add path to environment variable `C:\Users\username\.rover\bin`

## The Apollo Router

https://www.apollographql.com/docs/router/quickstart/

Automatic download (Linux, OSX, WSL, Windows Git Bash) Doesn't run on Powershell

```shell
curl -sSL https://router.apollo.dev/download/nix/latest | sh
```

If running on Powershell need to download: https://github.com/apollographql/router/releases
Unzip and Copy the `router.exe` file to the project root directory

## Compose a supergraph schema based on a supergraph configuration file

`By installing this plugin, you accept the terms and conditions outlined by this license.
More information on the ELv2 license can be found here: https://go.apollo.dev/elv2.
Do you accept the terms and conditions of the ELv2 license? [y/N]
error: This command requires that you accept the terms of the ELv2 license.`
### Run:
```shell
rover supergraph compose --config ./supergraph.yaml
```
Instead of
```shell
# Creates prod-schema.graphql or overwrites if it already exists
rover supergraph compose --config ./supergraph.yaml > supergraph.graphql
```

## Provide the composed schema to the router

```shell
./router --supergraph=supergraph.graphql
```

___

## Install Environment

> https://github.com/golang-migrate/migrate/tree/master/cmd/migrate
>
> https://visualstudio.microsoft.com/visual-cpp-build-tools/
>
> https://romankudryashov.com/blog/2020/12/graphql-rust/
>
> https://www.rust-lang.org/
>
> https://rocket.rs/
>
> https://diesel.rs/

### Cargo uses conventions for file placement to make it easy to dive into a new Cargo package:

```

├── Cargo.lock
├── Cargo.toml
├── src/
│ ├── lib.rs
│ ├── main.rs
│ └── bin/
│ ├── named-executable.rs
│ ├── another-executable.rs
│ └── multi-file-executable/
│ ├── main.rs
│ └── some_module.rs
├── benches/
│ ├── large-input.rs
│ └── multi-file-bench/
│ ├── main.rs
│ └── bench_module.rs
├── examples/
│ ├── simple.rs
│ └── multi-file-example/
│ ├── main.rs
│ └── ex_module.rs
└── tests/
├── some-integration-tests.rs
└── multi-file-test/
├── main.rs
└── test_module.rs

```

***

- `Cargo.toml` and `Cargo.lock` are stored in the root of your package (package root).
- Source code goes in the `src` directory.
- The **default library** file is `src/lib.rs`.
- The **default executable** file is `src/main.rs`.
    - **Other executables** can be placed in `src/bin/`.
- **Benchmarks** go in the `benches` directory.
- **Examples** go in the `examples` directory.
- **Integration tests** go in the `tests` directory.

If a `binary`, `example`, `bench`, or `integration test` consists of multiple source files, place a main.rs file along
with the
extra [modules](https://doc.rust-lang.org/cargo/appendix/glossary.html#module) within a subdirectory of the `src/bin`
, `examples`, `benches`, or `tests` directory. The name of the
executable

will be the directory name.

You can learn more about Rust's module system in
the [book](https://doc.rust-lang.org/book/ch07-00-managing-growing-projects-with-packages-crates-and-modules.html).

See [Configuring a target](https://doc.rust-lang.org/cargo/reference/cargo-targets.html#configuring-a-target) for more
details on manually configuring targets.
See [Target auto-discovery](https://doc.rust-lang.org/cargo/reference/cargo-targets.html#target-auto-discovery) for more
information on controlling how Cargo automatically infers target names.
