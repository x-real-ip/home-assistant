FROM ghcr.io/home-assistant/home-assistant:2024.12

COPY ./src/config /config

# Install pypng for QR Generator issue https://github.com/DeerMaximum/QR-Code-Generator/issues/58
RUN pip3 install pypng

# Python module failed workaround.
RUN touch /.dockerenv

# Add iptables rules in the prestop hook for the Shelly device to block UDP traffic, forcing a reconnection to the new pod.
RUN apk add --no-cache iptables