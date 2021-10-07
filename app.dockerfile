FROM homeassistant/home-assistant:2021.10

HEALTHCHECK CMD curl -f http://localhost:8123 || exit 1
