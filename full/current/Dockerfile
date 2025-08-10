FROM aclemons/slackware:current@sha256:4f4f0da1877dca0c9fa1e27ce0caa9856b1d83d6d488ce7be1f879bfb03f858b

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
