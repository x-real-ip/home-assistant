FROM ghcr.io/home-assistant/home-assistant:beta

COPY ./src/config /config

# Install pypng for QR Generator issue https://github.com/DeerMaximum/QR-Code-Generator/issues/58
RUN pip3 install pypng
