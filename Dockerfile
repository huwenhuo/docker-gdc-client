FROM ubuntu:16.04
LABEL "Description"="The gdc-client provides several convenience functions for uploading/downloading via HTTPS at the gdc data portal"

RUN apt-get update -y && apt-get install -y \
    python \
    build-essential \
    unzip \
    curl \
    wget \
    zlib1g-dev

# clone git repository
RUN cd /tmp && wget https://gdc.cancer.gov/files/public/file/gdc-client_v1.6.1_Ubuntu_x64-py3.7-ubuntu-16.04.zip && \
    unzip gdc-client_v1.6.1_Ubuntu_x64-py3.7-ubuntu-16.04.zip && unzip gdc-client_v1.6.1_Ubuntu_x64.zip && \
    mv gdc-client /usr/bin/ && rm -rf /tmp/gdc-client*
