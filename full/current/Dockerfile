FROM aclemons/slackware:current@sha256:ff8d66f4b0c3fbbe11b69cf778aba0f97bb4f77d2b081d9100774df3f92320cd

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
