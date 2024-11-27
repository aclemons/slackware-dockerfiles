FROM aclemons/slackware:current@sha256:3d712cc21d93e368fafdb5ae780c274bbb87cdd271ed7b1f095915305a2f44e3

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
