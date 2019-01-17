# LTS Image
FROM debian:buster-slim

LABEL maintainer="docker@captnemo.in"

ARG DEBIAN_FRONTEND="noninteractive"

WORKDIR /src

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    calibre \
    pandoc \
    ruby \
    ruby-dev \
    wget \
    zlib1g-dev \
    && gem install bundler --no-ri --no-rdoc \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY . /src/

RUN bundle install

ENTRYPOINT ["/src/bootstrap.sh", "docker"]

VOLUME ["/output"]
