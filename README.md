# Home Assistant

[![Build Status](https://drone.theautomation.nl/api/badges/theautomation/home-assistant/status.svg)](https://drone.theautomation.nl/theautomation/home-assistant)
![GitHub repo size](https://img.shields.io/github/repo-size/theautomation/home-assistant?logo=Github)
![GitHub commit activity](https://img.shields.io/github/commit-activity/y/theautomation/home-assistant?logo=github)
![GitHub last commit (branch)](https://img.shields.io/github/last-commit/theautomation/home-assistant/main?logo=github)

<img src="https://github.com/theautomation/kubernetes-gitops/blob/main/assets/img/k8s.png?raw=true" alt="K8s" style="height: 30px; width:30px;"/>
Application running in Kubernetes.

[Home Assistant](https://www.home-assistant.io/): Free and open-source home
automation software designed to be the central home automation control system
for smart home technology.

## Automations

All my automations are running in Node-RED
[flows](https://github.com/theautomation/node-red-code/blob/main/src/data/flows.json)

## Hardware

- 433 MHz Motion Sensor
- 433 MHz TS34C Thermo- en hygrosensor
- Aeotec Z-Wave Gen5 Stick 868.42 MHz
- Aeotec Z-Wave Gen5 Stick 908.42 MHz
- Aeotec Z-Wave Recessed Doorsensor 868.42 MHz
- ESP01S
- ESP32
- ESP8622
- Fibaro Z-Wave Wall Plug 868.42 MHz
- First Alert Z-Wave Smoke & Carbon Monoxide detector 2nd Gen 908.42 MHz
- Google Home
- Google Home Mini
- ISKRA Smart Meter
- LG SmartTV WebOS
- Logitech Harmony Hub
- Neo Coolman Z-Wave Wall Plug 868.42 MHz
- Nvidia Shield TV
- RFXCOM 433trfx Transceiver
- Shelly Dimmer
- Shelly Dimmer2
- Shelly 1 Relay
- Shelly Plug-S
- Shelly i3
- Solar Edge Inverter
- Tado Bridge
- Tado Smart Thermostat
- Tado Smart Radiator Thermostat
- Tado Wireless Temperature Sensor
- WLED
- Xioami Roborock S55
- Xioami Roborock S6 Pure
- Xiaomi Mi Flower Care Plant Sensor

## mDNS

To get mDNS (zeroconf) working in K8s, install Avahi-daemon on the host where
the pod is running on.

```bash
sudo apt-get install avahi-daemon
```

Turn on the reflector. Go into `/etc/avahi/avahi-daemon.conf` and change the
reflector section to:

```
 [reflector]
 enable-reflector=yes
 reflect-ipv=no
```

Add hostnetwork en dnspolicy in K8s deployment

```yaml

---
hostNetwork: true
dnsPolicy: ClusterFirstWithHostNet
containers:
```

## Other

Copy installed custom components from pod to local git repo directory

```console
rm -r /home/coen/github/home-assistant/src/config/custom_components/* \
for podname in $(kubectl get pods -n home-automation -l app=home-assistant -o json| jq -r '.items[].metadata.name'); do kubectl cp home-automation/${podname}:/config/custom_components /home/coen/github/home-assistant/src/config/custom_components; done
```
