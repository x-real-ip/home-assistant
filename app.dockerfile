FROM homeassistant/home-assistant:2022.4

COPY ./config /config

HEALTHCHECK CMD curl -f http://localhost:8123 || exit 1
