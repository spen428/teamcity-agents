FROM jetbrains/teamcity-agent:2023.11 AS base
USER root

RUN curl 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb' --output /tmp/chrome.deb \
    && apt-get update \
    && apt-get install -y openjdk-8-jdk openjfx wget imagemagick ghostscript git apt-transport-https ca-certificates software-properties-common bash \
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

USER buildagent
