FROM mysql:8.0

USER root

ENV DOCKER_VERSION "17.03.0-ce"

RUN apt update -y && apt install -y curl python git python-pip
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash - && \
      apt install -y nodejs
RUN curl -L -o /tmp/docker-"$DOCKER_VERSION".tgz https://download.docker.com/linux/static/stable/x86_64/docker-"$DOCKER_VERSION".tgz && \
      tar -xz -C /tmp -f /tmp/docker-"$DOCKER_VERSION".tgz && \
      mv /tmp/docker/* /usr/bin
RUN npm install -g --no-optional dredd && \
      pip install pipenv dredd_hooks
