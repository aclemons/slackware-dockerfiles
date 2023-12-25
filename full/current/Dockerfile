FROM aclemons/slackware:current@sha256:d53183641fe755371018c2b9cf5b0ff503d54efe8eafcfbd2418cd52d11e47b8

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
