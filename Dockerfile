################################################################################
##################### Set Inital Image to work from ############################
FROM ubuntu:16.04

################################################################################
##################### Add Container Labels #####################################
LABEL "Regtools_License"="Apache-2.0"
LABEL "Description"="The gdc-client provides several convenience functions for uploading/downloading via HTTPS at the gcd data portal"

ENV gdc_version 1.3.0

################################################################################
##################### Install System Dependencies ##############################
RUN apt-get update -y && apt-get install -y \
    python \
    build-essential \
    unzip \
    curl \
    zlib1g-dev

################################################################################
##################### Install Regtools #########################################

# clone git repository
ADD https://github.com/NCI-GDC/gdc-client/files/1552236/gdc-client_v${gdc_version}_Ubuntu14.04_x64.zip /usr/bin/
RUN unzip /usr/bin/gdc-client_v${gdc_version}_Ubuntu14.04_x64.zip -d /usr/bin/

################################################################################
###################### set environment path    #################################

# add regtools executable to path
ENV PATH="/usr/bin/:${PATH}"
