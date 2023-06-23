FROM jetbrains/teamcity-minimal-agent:2023.05 AS base
USER root

# https://github.com/JetBrains/teamcity-docker-images/blob/master/context/generated/linux/Agent/Ubuntu/20.04-sudo/Dockerfile
RUN apt-get update && \
    apt-get install -y --no-install-recommends sudo && \
    # https://github.com/goodwithtech/dockle/blob/master/CHECKPOINT.md#dkl-di-0005
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    echo 'buildagent ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers && \
    rm -rf /var/lib/apt/lists/*

RUN curl 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb' --output /tmp/chrome.deb \
    && apt-get update \
    && apt-get install -y openjdk-8-jdk openjfx wget imagemagick ghostscript \
    && apt-get install -y /tmp/chrome.deb \
    && rm /tmp/chrome.deb \
    && curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && apt-get install -y nodejs \
    && npm i -g npm pnpm yarn \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

USER buildagent
