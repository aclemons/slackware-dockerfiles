FROM aclemons/slackware:15.0@sha256:154eda407fe8bf52102df7ed613eae332b2b86d809b19e4d91842b19464747c7

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
