FROM rust:1.60.0-buster as rust
WORKDIR /app
COPY . .
RUN cargo build --release

FROM rust:1.60.0-buster
COPY --from=rust /app/target/release/sccache /usr/local/bin/sccache
ENV RUSTC_WRAPPER /usr/local/bin/sccache
