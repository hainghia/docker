<p align="center">
<a href="/" target="_blank">
<img src="logo.svg" width="400">
</a></p>

<p align="center">
<a>rustc 1.62.0 (fe5b13d68 2022-05-18)</a> |
<a>Microsoft C++ Build Tools</a> |
<a>Cargo 1.62.0</a>
</p>

___

## Command Line

### Rust

```shell
rustup update
rustc --version
rustup self uninstall
```

### Cargo:

```shell
cargo --version
cargo doc --open
cargo test
cargo build
cargo build --release
cargo build -r
cargo check
cargo run
cargo run --release
cargo watch -x run
```

- Generate Secret Key 256-bit base64 key:

```shell
openssl rand -base64 32
```

___

### Diesel CLI

- setting the `DATABASE_URL` environment variable

```shell
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

___

## Install Environment

> https://github.com/golang-migrate/migrate/tree/master/cmd/migrate
>
> https://visualstudio.microsoft.com/visual-cpp-build-tools/
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