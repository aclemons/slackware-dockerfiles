ARG base_image=aclemons/slackware:14.2-x84_64-full
# hadolint ignore=DL3006
FROM $base_image

RUN bash /usr/doc/slackpkg+-1.8.0/setupmultilib.sh

COPY scripts/docker-entrypoint.sh /usr/local/bin/
COPY scripts/32dev.sh /etc/profile.d/

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]