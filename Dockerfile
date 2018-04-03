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
RUN dpkg -i <file>.deb
RUN apt-get install -f # Install dependencies

RUN  curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
RUN mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
RUN sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
RUN apt-get update
RUN apt-get install code # or code-insiders

WORKDIR ${WORKDIRECTORY}
RUN cd ${WORKDIRECTORY} \
    && mkdir -p work \
    && chown -R $USERNAME work
