ARG BUILD_FROM=ghcr.io/home-assistant/aarch64-base-debian:trixie
FROM $BUILD_FROM

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    python3-venv \
    nodejs \
    npm \
    git \
    curl \
    bash \
    jq \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Create virtual environment and install uv
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
RUN pip install --no-cache-dir uv

# Install playwright and browsers
RUN uv pip install playwright && playwright install --with-deps chromium

# Clone nanobot from licheng5625 fork with homeassistant channel
RUN git clone --depth 1 --branch feature/homeassistant-channel \
    https://github.com/licheng5625/nanobot.git . \
    && rm -rf .git
    
# Install nanobot in venv
RUN uv pip install --no-cache .

# Build WhatsApp bridge
WORKDIR /app/bridge
RUN npm install && npm run build
WORKDIR /app

# Create config directory
RUN mkdir -p /root/.nanobot

# Copy run script
COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]
