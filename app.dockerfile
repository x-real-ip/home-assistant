FROM homeassistant/home-assistant:2022.2

HEALTHCHECK CMD curl -f http://localhost:8123 || exit 1
