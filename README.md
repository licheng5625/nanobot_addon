# Nanobot Add-ons for Home Assistant

[![Add repository to Home Assistant](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Flicheng5625%2Fnanobot_addon)

## Add-ons

### Nanobot AI Assistant

Ultra-lightweight personal AI assistant with WhatsApp/Telegram integration.

## Installation

1. Click the button above or add this repository URL to your Home Assistant add-on store:
   ```
   https://github.com/licheng5625/nanobot_addon
   ```

2. Install the "Nanobot AI Assistant" add-on

3. Create config file at `/homeassistant/nanobot/config.json`:
   ```json
   {
     "agents": {
       "defaults": {
         "workspace": "~/.nanobot/workspace",
         "model": "claude-sonnet-4-20250514",
         "max_tokens": 8192
       }
     },
     "providers": {
       "anthropic": {
         "api_key": "your-api-key"
       }
     },
     "channels": {
       "telegram": { "enabled": false },
       "whatsapp": { "enabled": false }
     },
     "gateway": {
       "host": "0.0.0.0",
       "port": 18790
     }
   }
   ```

4. Start the add-on

## Support

- [Nanobot GitHub](https://github.com/HKUDS/nanobot)
