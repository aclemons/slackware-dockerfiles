FROM aclemons/slackware:current@sha256:da7acb908c80dbd10c2feb6251e7c08813b28e1c885f9cd0125afcd8b29d2467

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
