FROM jetbrains/teamcity-agent:2023.05 AS base
USER root

RUN curl 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb' --output /tmp/chrome.deb
RUN apt-get update \
    && apt-get install -y wget imagemagick ghostscript \
    && apt-get install -y /tmp/chrome.deb \
    && rm /tmp/chrome.deb

RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && apt-get install -y nodejs
RUN npm i -g npm pnpm yarn

USER buildagent
