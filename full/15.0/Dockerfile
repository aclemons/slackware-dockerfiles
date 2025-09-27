FROM aclemons/slackware:15.0@sha256:670ee359310da37e2bb7dcd66daf41f9a56b8d808ce42b02bfdbc09ea627e0df

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
