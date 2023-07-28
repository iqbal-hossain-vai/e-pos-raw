# Use an official Golang runtime as a base image
FROM golang:1.17.1-buster AS builder

# Set the working directory in the container
WORKDIR /app

# Copy the necessary files to the container
COPY . .

# Build the Beacon Chain binary
RUN cd beacon-chain && make

# Build the Validator binary
RUN cd validator && make

# Start a new image
FROM ethereum/client-go:v1.10.11

# Copy the built binaries from the builder stage
COPY --from=builder /app/beacon-chain/build/beacon-chain /usr/local/bin/
COPY --from=builder /app/validator/build/validator /usr/local/bin/

# Set the working directory in the container
WORKDIR /app

# Copy the necessary files to the container
COPY . .

# Expose the required ports
EXPOSE 4000 8551 8545

# Set up and run the Beacon Chain and Validator nodes
#CMD ["./entrypoint.sh"]
