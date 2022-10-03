# Home Assistant

[![Build Status](https://drone.theautomation.nl/api/badges/theautomation/home-assistant/status.svg)](https://drone.theautomation.nl/theautomation/home-assistant)
![GitHub repo size](https://img.shields.io/github/repo-size/theautomation/home-assistant-code?logo=Github)
![GitHub commit activity](https://img.shields.io/github/commit-activity/y/theautomation/home-assistant-code?logo=github)
![GitHub last commit (branch)](https://img.shields.io/github/last-commit/theautomation/home-assistant-code/main?logo=github)

Application running in Kubernetes <img src="https://github.com/theautomation/kubernetes-gitops/blob/main/assets/img/k8s.png?raw=true" alt="K8s" style="height: 40px; width:40px;"/>

[Home Assistant](https://www.home-assistant.io/): Free and open-source home automation software designed to be the central home automation control system for smart home technology.

## Automations

All my automations are running in Node-RED [flows](https://github.com/theautomation/node-red-code/blob/main/src/data/flows.json)

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

## Folder Structure Conventions

    ├── cicd                 
    │   ├── argocd             # ArgoCD application that automates the deployment of the desired application states
    │   ├── tekton             # Tekton CI pipeline 
    ├── deploy                 
    │   ├── k8s                # Kubernetes manifest yaml('s)
    │   ├── container          # Containerfiles to build container image(s)
    ├── src                    
    │   ├── ...                # Application source code

## mDNS

To get mDNS (zeroconf) working in K8s, install Avahi-daemon on the host where the pod is running on. 

```bash
sudo apt-get install avahi-daemon
```

Turn on the reflector. Go into `/etc/avahi/avahi-daemon.conf` and change the reflector section to:

```
 [reflector]
 enable-reflector=yes
 reflect-ipv=no
```

Add hostnetwork en dnspolicy in K8s deployment

```yaml
...
      hostNetwork: true
      dnsPolicy: ClusterFirstWithHostNet
      containers:
...
```

Copy installed custom components from pod to local git repo directory
```console
rm -r /home/coen/github/home-assistant/src/config/custom_components/* \
&& kubectl cp home-automation/<pod-name>:/config/custom_components /home/coen/github/home-assistant/src/config/custom_components
```
