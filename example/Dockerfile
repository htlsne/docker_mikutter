FROM orumin/mikutter:alpine
MAINTAINER orumin


COPY mikutter_confroot /home/mikutter/mikutter_confroot
COPY run.sh /usr/local/bin

USER root

RUN set -x \
    && cd /home/mikutter \
      && chown -R mikutter mikutter_confroot \
      && chmod +x /usr/local/bin/run.sh

USER mikutter

CMD ["/usr/local/bin/run.sh"]
