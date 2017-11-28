FROM ubuntu:17.04

WORKDIR /ansible

ARG ANSIBLE_VERSION=2.4.1.0

LABEL ANSIBLE_VERSION=$ANSIBLE_VERSION \
      UBUNTU_VERSION=17.04

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
        python \
        python-pip \
        libffi-dev \
        libssl-dev \
        python-dev \
    && pip install --upgrade pip ansible==${ANSIBLE_VERSION} \
    && apt-get purge -y \
        python-dev \
        libffi-dev \
    && rm -rf /var/cache/apt/archives \
    && rm -rf /var/lib/apt/lists

ENTRYPOINT [ "ansible-playbook" ]
