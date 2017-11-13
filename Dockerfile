FROM ruby:alpine
MAINTAINER orumin

ARG WORK_DIR="/home/mikutter"

ARG USER_NAME="mikutter"
ARG USER_ID="1000"

RUN set -x \
    && apk upgrade --update \
    && apk --no-cache add --virtual .build-deps \
      gcc musl-dev make g++ file alpine-sdk git \
    \
	&& adduser -D -u ${USER_ID} -h ${WORK_DIR} ${USER_NAME}

WORKDIR ${WORK_DIR}

RUN set -x \
    && su mikutter \
	&& git clone git://toshia.dip.jp/mikutter.git \
    && cd mikutter \
      && rm -r core/plugin/gtk \
      && rm -r core/plugin/gui \
      && bundle install

# clean up
RUN set -x \
    && apk del --purge .build-deps

USER ${USER_NAME}
