#!/bin/bash
# https://github.com/JetBrains/teamcity-docker-agent/blob/master/run-docker.sh
if [ "$DOCKER_IN_DOCKER" = "start" ] ; then
 rm /var/run/docker.pid 2>/dev/null
 service docker start
 echo "Docker daemon started"
fi
