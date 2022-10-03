FROM ubuntu:20.04

RUN apt update && \
	apt install -y curl

RUN curl -fsSL https://clis.cloud.ibm.com/install/linux | sh

ENV USERNAME developer
ARG UID
RUN useradd -m $USERNAME && \
        echo "$USERNAME:$USERNAME" | chpasswd && \
        usermod --shell /bin/bash $USERNAME && \
	usermod -aG sudo $USERNAME && \
        mkdir -p /etc/sudoers.d/ && \
        echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$USERNAME && \
        chmod 0440 /etc/sudoers.d/$USERNAME && \
        usermod  --uid $UID $USERNAME && \
	groupmod --gid $UID $USERNAME

USER $USERNAME
WORKDIR /home/$USERNAME
RUN ibmcloud plugin install code-engine
