FROM aclemons/slackware:current@sha256:bdd5c5d9a4a75039c777a762708140eaffa0a612022a7a61b8caa7efc09f937c

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
