FROM node:20-slim

# Install essentials
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    procps \
    sqlite3 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

# Copy startup script and fix Windows line endings (CRLF -> LF)
COPY scripts/start.sh /usr/local/bin/start.sh
RUN sed -i 's/\r$//' /usr/local/bin/start.sh && chmod +x /usr/local/bin/start.sh

EXPOSE 3000 4000 5001

CMD ["/usr/local/bin/start.sh"]
