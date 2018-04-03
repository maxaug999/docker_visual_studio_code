FROM ubuntu:17.10

ENV PROJECTNAME=VS

NV WORKDIRECTORY /home/ubuntu

RUN apt-get update

RUN apt-get install -y vim-nox curl git software-properties-common

# Installation Python 3
RUN apt install -y git python3 python3-pip
# Mise à jour PIP
RUN pip3 install --upgrade pip
RUN pip3 install flake8
RUN pip3 install flake8-docstrings

# Installation Visual studio
