FROM aclemons/slackware:current@sha256:35a9dbfb8c9116cd4f375a893cfdb170ff606571791f39622887eea78268a752

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
