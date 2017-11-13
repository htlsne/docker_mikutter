FROM ruby:2.4.1
MAINTAINER orumin

ARG WORK_DIR="/home/mikutter"

ARG USER_NAME="mikutter"
ARG USER_ID="1000"

RUN set -x \
    && apt-get update \
	&& apt-get install -y \
	  libpango1.0-dev \
	  libgtk2.0-dev \
	  libatk1.0-dev \
	  libgirepository1.0-dev \
	  git \
	  build-essential \
    \
	&& groupadd --system -g 1000 mikutter \
	&& useradd -m -s /bin/bash -g mikutter -u 1000 -d /home/mikutter mikutter \
	&& echo mikutter:mikutter | chpasswd

USER ${USER_NAME}

WORKDIR ${WORK_DIR}

RUN set -x && \
	git clone git://toshia.dip.jp/mikutter.git && \
    cd mikutter && \
    git checkout develop && \
    bundle install

ENTRYPOINT ["/usr/local/bundle/bin/bundle", "exec", "/home/mikutter/mikutter/mikutter.rb"]
