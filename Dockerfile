FROM python:buster

LABEL maintainer="Vasiliy Vanchuk <vvscode@gmail.com>"

LABEL description="Install node prereqs, nodejs, yarn awscli"

LABEL refs="\
  https://deb.nodesource.com/setup_14.x \
  https://yarnpkg.com/en/docs/install \
  https://aws.amazon.com/cli/ \
  "

RUN \
  echo "deb https://deb.nodesource.com/node_14.x buster main" > /etc/apt/sources.list.d/nodesource.list && \
  wget -qO- https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list && \
  wget -qO- https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  apt-get update && \
  apt-get install -yqq nodejs yarn && \
  pip install -U pip && pip install pipenv && pip install awscli\
  npm i -g npm@latest && \
  rm -rf /var/lib/apt/lists/*
