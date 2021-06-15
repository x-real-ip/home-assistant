FROM homeassistant/home-assistant:latest

HEALTHCHECK CMD curl -f http://localhost:8123 || exit 1