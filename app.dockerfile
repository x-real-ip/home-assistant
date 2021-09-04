FROM homeassistant/home-assistant:2021.9

HEALTHCHECK CMD curl -f http://localhost:8123 || exit 1
