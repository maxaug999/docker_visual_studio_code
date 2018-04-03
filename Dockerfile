FROM ubuntu:17.10


RUN apt-get update

RUN apt-get install -y vim-nox curl git software-properties-common

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
