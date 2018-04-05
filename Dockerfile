FROM ubuntu:17.10

ENV PROJECTNAME=ATOM

# Access SSH login
ENV USERNAME=ubuntu
ENV PASSWORD=ubuntu

ENV WORKDIRECTORY /home/ubuntu

RUN apt-get update
RUN apt-get install -y vim-nox curl git software-properties-common

# Add user to the image
RUN adduser --quiet --disabled-password --shell /bin/bash --home /home/${USERNAME} --gecos "User" ${USERNAME}
# Set password for the Ubuntu user (you may want to alter this).
RUN echo "$USERNAME:$PASSWORD" | chpasswd

# Installation Python 3
RUN apt install -y git python3 python3-pip
# Mise à jour PIP
RUN pip3 install --upgrade pip
RUN pip3 install flake8
RUN pip3 install flake8-docstrings

# Installation Visual studio

RUN  curl https://code.visualstudio.com/download/code_1.21.1-1521038896_amd64.deb
RUN dpkg -i code_1.21.1-1521038896_amd64.deb
RUN apt-get install -f # Install dependencies
RUN apt-get update
RUN apt-get install code # or code-insiders

WORKDIR ${WORKDIRECTORY}
RUN cd ${WORKDIRECTORY} \
    && mkdir -p work \
    && chown -R $USERNAME work
