# Nanobot AI Assistant for Home Assistant

Ultra-lightweight personal AI assistant with chat integrations.

## Features

- 🤖 AI assistant powered by any OpenAI-compatible API
- 💬 WhatsApp integration
- 📱 Telegram integration
- 🛠️ Built-in tools (shell, file operations, web search)

## Configuration

### Required Settings

| Option | Description |
|--------|-------------|
| `model` | LLM model name (e.g., `claude-sonnet-4-20250514`) |
| `api_base` | OpenAI-compatible API URL (e.g., `http://192.168.0.134:3030/v1`) |
| `api_key` | API key for the LLM service |

### Optional Settings

| Option | Default | Description |
|--------|---------|-------------|
| `max_tokens` | 8192 | Maximum tokens per response |
| `temperature` | 0.7 | LLM temperature |

### WhatsApp

| Option | Description |
|--------|-------------|
| `whatsapp_enabled` | Enable WhatsApp integration |
| `whatsapp_allow_from` | List of allowed phone numbers (e.g., `["+1234567890"]`) |

To connect WhatsApp:
1. Enable WhatsApp in the add-on config
2. Check the add-on logs for QR code
3. Scan with WhatsApp on your phone

### Telegram

| Option | Description |
|--------|-------------|
| `telegram_enabled` | Enable Telegram integration |
| `telegram_token` | Bot token from @BotFather |
| `telegram_allow_from` | List of allowed user IDs |

## Example Configuration

```yaml
model: "claude-sonnet-4-20250514"
api_base: "http://192.168.0.134:3030/v1"
api_key: "your-api-key"
max_tokens: 8192
temperature: 0.7
whatsapp_enabled: false
whatsapp_allow_from: []
telegram_enabled: true
telegram_token: "123456:ABC-DEF..."
telegram_allow_from: ["123456789"]
```

## Data Location

- Config: `/config/nanobot/config.json`
- Workspace: `/config/nanobot/workspace/`
- Sessions: `/config/nanobot/sessions/`
