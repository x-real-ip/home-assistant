FROM homeassistant/home-assistant:stable

HEALTHCHECK CMD curl -f http://localhost:8123 || exit 1