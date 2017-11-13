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
	&& groupadd --system -g ${USER_ID} ${USER_NAME} \
	&& useradd -m -s /bin/bash -g ${USER_NAME} -u ${USER_ID} -d ${WORK_DIR} ${USER_NAME} \
	&& echo ${USER_NAME}:${USER_NAME} | chpasswd

USER ${USER_NAME}

RUN set -x \
    && cd ${WORK_DIR} \
	&& git clone git://toshia.dip.jp/mikutter.git \
      && cd mikutter \
      && bundle install

WORKDIR ${WORK_DIR}/mikutter

CMD ["/usr/local/bin/bundle", "exec", "/home/mikutter/mikutter/mikutter.rb"]
