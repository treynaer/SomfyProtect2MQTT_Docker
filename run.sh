#!/usr/bin/env bash

echo "Configuration :"
echo "$(cat /usr/src/SomfyProtect2MQTT/somfyProtect2Mqtt/config/config.yaml)"

python3 /usr/src/SomfyProtect2MQTT/somfyProtect2Mqtt/main.py
