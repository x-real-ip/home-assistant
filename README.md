# Home Assistant

[![Continuous integration](https://github.com/x-real-ip/home-assistant/actions/workflows/ci.yaml/badge.svg)](https://github.com/x-real-ip/home-assistant/actions/workflows/ci.yaml)
![GitHub repo size](https://img.shields.io/github/repo-size/x-real-ip/home-assistant?logo=Github)
![GitHub commit activity](https://img.shields.io/github/commit-activity/y/x-real-ip/home-assistant?logo=github)
![GitHub last commit (branch)](https://img.shields.io/github/last-commit/x-real-ip/home-assistant/main?logo=github)

<img src="https://github.com/x-real-ip/infrastructure/blob/main/assets/img/k8s.png?raw=true" alt="K8s" style="height: 30px; width:30px;"/>
Application running in Kubernetes.

[Home Assistant](https://www.home-assistant.io/): Free and open-source home
automation software designed to be the central home automation control system
for smart home technology.

## Automations

All my automations are running in Node-RED
[flows](https://github.com/x-real-ip/node-red-flows/tree/main) as an
alternative automation engine.

## Hardware

- Aeotec Z-Wave Gen5 Stick 908.42 MHz
- Bluesound Powernode 2i
- DIYLESS OpenTherm Gateway
- ESP32
- ESP8622
- First Alert Z-Wave Smoke & Carbon Monoxide detector 2nd Gen 908.42 MHz
- Google Home Speaker
- Home Assistant Voice Preview Edition
- ISKRA Smart Meter
- LG SmartTV WebOS
- Nvidia Shield TV Pro
- Shelly 1 Relay
- Shelly 1PM Mini Gen3
- Shelly BLU Door/Window
- Shelly BLU H&T
- Shelly BLU Motion
- Shelly Bulb RGBW
- Shelly Dimmer
- Shelly Dimmer2
- Shelly Plug-S
- Shelly Plus Plug
- Shelly i3
- SolarEdge Inverter
- Tado Bridge
- Tado Smart Thermostat
- Tado Smart Radiator Thermostat
- Tado Wireless Temperature Sensor
- Xioami Roborock S55
- Xioami Roborock S6 Pure

## Other

Copy installed HACS integration types from pod to local git repo directory

```console
rm -r /home/coen/git-repositories/home-assistant/src/config/custom_components/* &&
for podname in $(kubectl get pods -n home-automation -l app=home-assistant -o json| jq -r '.items[].metadata.name'); do kubectl cp home-automation/${podname}:/config/custom_components /home/coen/git-repositories/home-assistant/src/config/custom_components; done
```

Copy installed HACS dashboard types from pod to local git repo directory
```console
rm -r /home/coen/git-repositories/home-assistant/src/config/www/community/* &&
for podname in $(kubectl get pods -n home-automation -l app=home-assistant -o json| jq -r '.items[].metadata.name'); do kubectl cp home-automation/${podname}:/config/www/community /home/coen/git-repositories/home-assistant/src/config/www/community; done
```

TEST
