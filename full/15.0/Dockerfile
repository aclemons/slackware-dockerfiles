FROM aclemons/slackware:15.0@sha256:db5fe60e2c714ddacd0ca9f044570fa0950cb1b966e30d2b78418fdbadf2fa75

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
