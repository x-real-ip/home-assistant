FROM homeassistant/home-assistant:2021.11.0

HEALTHCHECK CMD curl -f http://localhost:8123 || exit 1
