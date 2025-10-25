FROM ubuntu:22.04

# Install required dependencies
RUN apt-get update && \
    apt-get install -y \
    cowsay \
    fortune-mod \
    netcat-openbsd \
    bash \
    dos2unix \
    && rm -rf /var/lib/apt/lists/*

# Set PATH to include cowsay
ENV PATH="/usr/games:${PATH}"

# Create app directory
WORKDIR /app

# Copy the wisecow script
COPY wisecow.sh .

# Convert line endings from Windows to Unix and make executable
RUN dos2unix wisecow.sh && \
    chmod +x wisecow.sh

# Expose port 4499
EXPOSE 4499

# Run the application
CMD ["bash", "./wisecow.sh"]