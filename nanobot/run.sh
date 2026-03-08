#!/bin/bash
set -e

CONFIG_DIR=/config/nanobot
# Create directories
mkdir -p $CONFIG_DIR/workspace
mkdir -p $CONFIG_DIR/sessions

# Link /root/.nanobot to /config/nanobot (HA's /homeassistant/nanobot/)
rm -rf /root/.nanobot
ln -sf $CONFIG_DIR /root/.nanobot

# Check if config exists
if [ ! -f "$CONFIG_DIR/config.json" ]; then
    echo "Error: Config file not found"
    echo "Please create /homeassistant/nanobot/config.json"
    echo ""
    echo "Example config:"
    cat << 'EOF'
{
  "agents": {
    "defaults": {
      "workspace": "~/.nanobot/workspace",
      "model": "claude-sonnet-4-20250514",
      "max_tokens": 8192,
      "temperature": 0.7
    }
  },
  "providers": {
    "vllm": {
      "api_key": "your-api-key",
      "api_base": "http://localhost:3030/v1"
    }
  },
  "channels": {
    "homeassistant": {
      "enabled": false
    },
    "telegram": { "enabled": false },
    "whatsapp": { "enabled": false }
  },
  "gateway": {
    "host": "0.0.0.0",
    "port": 18790
  }
}
EOF
    exit 1
fi

echo "Config: /homeassistant/nanobot/config.json"
echo "Starting nanobot gateway..."

exec nanobot gateway
