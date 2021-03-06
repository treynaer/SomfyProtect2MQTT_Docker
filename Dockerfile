FROM alpine:latest
ENV LANG C.UTF-8

# SomfyProtect2MQTT version
ARG VERSION=0.1.5

# Install required packages
RUN apk update && apk add bash
RUN apk add --no-cache py3-pip
RUN pip3 install python-json2yaml

# Download source and untar
WORKDIR /usr/src
ADD "https://github.com/Minims/SomfyProtect2MQTT/archive/refs/tags/${VERSION}.tar.gz" src.tar.gz
RUN tar -xvf src.tar.gz
RUN mv /usr/src/SomfyProtect2MQTT-${VERSION} /usr/src/SomfyProtect2MQTT
RUN mv /usr/src/SomfyProtect2MQTT/somfyProtect2Mqtt/config/config.yaml.example /usr/src/SomfyProtect2MQTT/somfyProtect2Mqtt/config/config.yaml

# Install python requirements
WORKDIR /usr/src/SomfyProtect2MQTT/somfyProtect2Mqtt
RUN pip3 install -r requirements.txt

# Run script
COPY run.sh /
RUN chmod a+x /run.sh
CMD [ "/run.sh" ]
