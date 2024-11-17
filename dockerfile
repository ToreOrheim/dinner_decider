# Use the official Rust image to build the program
FROM rust:1.73 AS builder

# Set the working directory in the container
WORKDIR /usr/src/dinner_prepper

# Copy the Cargo.toml and Cargo.lock files to the container
COPY . .

# Build dependencies first (to take advantage of Docker caching)
RUN cargo build --release
RUN rm src/*.rs

# Copy the rest of the source code
COPY . .

# Build the actual binary
RUN cargo install --path .

# Use a smaller base image to run the program
FROM debian:bookworm-slim

# Install necessary dependencies for the application (if any)
RUN apt-get update && \
    apt-get install -y libc6 && \
    rm -rf /var/lib/apt/lists/*

# Copy the built binary from the builder image
COPY --from=builder /usr/local/cargo/bin/dinner_prepper /usr/local/bin/dinner_prepper

# Set the entry point for the container
ENTRYPOINT ["/usr/local/bin/dinner_prepper"]

# Optional: Set the default command or environment variables
# CMD []

