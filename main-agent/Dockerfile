FROM jetbrains/teamcity-agent:2023.05 AS base
USER root

RUN curl 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb' --output /tmp/chrome.deb \
    && apt-get update \
    && apt-get dist-upgrade -y \
    && apt-get install -y openjdk-8-jdk-headless openjfx \
    && apt-get install -y wget imagemagick ghostscript \
    && apt-get install -y /tmp/chrome.deb \
    && rm /tmp/chrome.deb \
    && curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && apt-get install -y nodejs \
    && npm i -g npm pnpm yarn

USER buildagent
