FROM homeassistant/home-assistant:2021.12

HEALTHCHECK CMD curl -f http://localhost:8123 || exit 1
