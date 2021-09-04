FROM homeassistant/home-assistant:2021.8

HEALTHCHECK CMD curl -f http://localhost:8123 || exit 1
