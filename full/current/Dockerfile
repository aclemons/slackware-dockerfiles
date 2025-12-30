FROM aclemons/slackware:current@sha256:90b431f8c1dcb32c2dbfaadb6d77d1b56eaf13de171081c5b54095abec7a6d5b

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
