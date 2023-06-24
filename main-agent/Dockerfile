FROM jetbrains/teamcity-minimal-agent:2023.05 AS base
USER root

ENV GIT_SSH_VARIANT=ssh

RUN curl 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb' --output /tmp/chrome.deb \
    && apt-get update \
    && apt-get install -y openjdk-8-jdk openjfx wget imagemagick ghostscript git apt-transport-https ca-certificates software-properties-common \
    && apt-get install -y /tmp/chrome.deb \
    && rm /tmp/chrome.deb \
    && curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && apt-get install -y nodejs \
    && npm i -g npm pnpm yarn \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# https://github.com/JetBrains/teamcity-docker-images/blob/master/context/generated/linux/Agent/Ubuntu/20.04-sudo/Dockerfile
RUN apt-get update && \
    apt-get install -y --no-install-recommends sudo && \
    echo 'buildagent ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers && \
    apt-get clean all && \
    rm -rf /var/lib/apt/lists/*

# https://github.com/JetBrains/teamcity-docker-agent/blob/master/ubuntu/Dockerfile
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
    \
    apt-cache policy docker-ce && \
    apt-get update && \
    apt-get install -y  docker-ce=5:19.03.3~3-0~ubuntu-bionic \
                        docker-ce-cli=5:19.03.3~3-0~ubuntu-bionic \
                        containerd.io=1.2.6-3 \
                        systemd && \
    systemctl disable docker && \
    curl -SL "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose && \
    \
    apt-get install -y --no-install-recommends \
            fontconfig \
            libc6 \
            libgcc1 \
            libgssapi-krb5-2 \
            libicu60 \
            liblttng-ust0 \
            libssl1.0.0 \
            libstdc++6 \
            zlib1g \
        && rm -rf /var/lib/apt/lists/* && \
    \
    apt-get clean all && \
    \
    usermod -aG docker buildagent

VOLUME /var/lib/docker

COPY run-docker.sh /services/run-docker.sh

USER buildagent
