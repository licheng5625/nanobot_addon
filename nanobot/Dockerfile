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

RUN git init \
    && git remote add origin https://github.com/licheng5625/nanobot.git \
    && git fetch --depth 1 origin 9bccfa63d2ad4416411913752b6948c0cfc3b3d0 \
    && git checkout FETCH_HEAD \
    && rm -rf .git

# Install nanobot in venv
RUN uv pip install --no-cache .

RUN uv pip install nanobot-ai[discord]
WORKDIR /app

# Create config directory
RUN mkdir -p /root/.nanobot

# Copy run script
COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]
