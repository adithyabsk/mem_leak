FROM debian:bookworm-slim

# Install necessary tools
RUN apt-get update && apt-get install -y \
    g++ \
    valgrind \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy the C++ program and shell script
COPY leak.cpp .
COPY run.sh .

# Make the shell script executable
RUN chmod +x run.sh

# Command to run the Valgrind script
CMD ["./run.sh"]
