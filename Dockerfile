FROM circleci/nomad:0.5.2

RUN apt-get update \
    && apt-get install -y sudo apt-transport-https software-properties-common ca-certificates netcat

# ENV DOCKER_SHA256=05ceec7fd937e1416e5dce12b0b6e1c655907d349d52574319a1e875077ccb79

# RUN /bin/sh -c 'curl -o /tmp/docker.tgz https://get.docker.com/builds/Linux/x86_64/docker-17.05.0-ce.tgz' \
#     && echo "${DOCKER_SHA256} /tmp/docker.tgz" | sha256sum -c \
#     && tar -xzf /tmp/docker.tgz -C /usr/local/share \
#     && ln -s /usr/local/share/docker/docker /usr/local/bin

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add - \
    && sudo add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/debian \
       $(lsb_release -cs) \
       stable" \
    && sudo apt-get update \
    && sudo apt-get -y install docker-ce

# ADD ./nomad-dev.hcl /nomad-dev.hcl

# CMD nomad agent -config /nomad-dev.hcl
