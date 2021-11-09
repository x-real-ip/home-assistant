FROM homeassistant/home-assistant:2021.11

HEALTHCHECK CMD curl -f http://localhost:8123 || exit 1
